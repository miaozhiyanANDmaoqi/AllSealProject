package com.service.impl;

import com.dao.UserInfoMapper;
import com.dao.UserMapper;
import com.domain.Emnu.SucceedOrFail;
import com.domain.MyException.UserIconNotFoundException;
import com.domain.eneity.User;
import com.domain.eneity.UserInfo;
import com.domain.po.User_AllInfo;
import com.domain.utils.MD5Utils;
import com.service.UserService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;

    public User findUserByAccount(String acc) {
        User user = new User();
        user.setAccount(acc);
        return userMapper.findUserByManyElement(user);
    }

    /**
     * 注册时异步检查，返回1成功 -3account不可用 -2tel不可用 -5都不可用
     *
     * @param user
     * @return
     */
    public int signInCheck(User user) {
        int result = 0;
        User user_acc = new User();
        user_acc.setAccount(user.getAccount());
        if (user_acc.getAccount() != null && userMapper.findUserByManyElement(user_acc) != null) {
            result = result - 3;
        }
        User user_tel = new User();
        user_tel.setTel(user.getTel());
        if (user_tel.getTel() != null && userMapper.findUserByManyElement(user_tel) != null) {
            result = result - 2;
        }
        return result;
    }

    /**
     * 用户注册
     *
     * @param user
     * @return
     */
    public int registerAccount(User user) {
        User user_acc = new User();
        user_acc.setAccount(user.getAccount());
        user.setPwd(MD5Utils.md5(user.getPwd()));//对密码经行md5加密
        if (userMapper.findUserByManyElement(user_acc) != null) {
            return SucceedOrFail.failure.getCode();
        }
        User user_tel = new User();
        user_tel.setTel(user.getTel());
        if (userMapper.findUserByManyElement(user_tel) != null) {
            return SucceedOrFail.failure.getCode();
        }
        user.setSign_in_date(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(System.currentTimeMillis()));
        int user_flag = userMapper.insertUser(user);//插入user表，成功返回1，失败返回0
        UserInfo userInfo = new UserInfo();
        userInfo.setId(userMapper.findUserByManyElement(user).getId());//根据用户名和密码查到user的id
        int userinfo_flag = userInfoMapper.insertUserInfo(userInfo);//根据用户id插入userinfo表，成功返回1，失败返回0
        if (user_flag == 1 && userinfo_flag == 1) {
            return SucceedOrFail.success.getCode();
        } else {
            return SucceedOrFail.failure.getCode();
        }
    }

    /**
     * 用户登录
     *
     * @param user
     * @param request
     * @return
     */
    public int loginCheck(User user, HttpServletRequest request, HttpServletResponse response) {
        //获取用户输入的账号和密码
        user.setPwd(MD5Utils.md5(user.getPwd()));//对密码经行md5加密,在与加密后的密码进行比较
        User userreturn = userMapper.findUserByManyElement(user);

        //查询用户信息
        if (null == userreturn) {
            return SucceedOrFail.failure.getCode();
        } else {
            UserInfo u = new UserInfo();
            u.setId(userreturn.getId());
            UserInfo userInfo = userInfoMapper.findUserInfo(u);//根据user的id找到对应的userinfo
            User_AllInfo user_allInfo = new User_AllInfo(userreturn, userInfo);//合并数据
            if (null == user_allInfo.getEmail()) {
                user_allInfo.setEmail("");
            }
            request.getSession().setAttribute("Account", user_allInfo);

            //是否记住账户
            String rememberAcc = request.getParameter("rememberAcc");
            Cookie cookie_Account = new Cookie("Account", user.getAccount());
            cookie_Account.setPath(request.getContextPath());
            Cookie cookie_Password = new Cookie("Password", user.getPwd());
            cookie_Password.setPath(request.getContextPath());
            if (rememberAcc != null) {
                cookie_Account.setMaxAge(Integer.MAX_VALUE);
                cookie_Password.setMaxAge(Integer.MAX_VALUE);
            } else {
                cookie_Account.setMaxAge(0);
                cookie_Password.setMaxAge(0);
            }
            //写回cookie 到客户端
            response.addCookie(cookie_Account);
            response.addCookie(cookie_Password);

            return SucceedOrFail.success.getCode();
        }
    }

    /**
     * 用户注销
     *
     * @param request
     * @param response
     */
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        try {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户上传头像
     *
     * @param request
     * @return
     */
    public int uploadIcon(HttpServletRequest request) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
        servletFileUpload.setFileSizeMax(1024 * 1024 * 3);//上传文件大小最大为3MB
        servletFileUpload.setHeaderEncoding("UTF-8");
        try {
            List<FileItem> fileItems = servletFileUpload.parseRequest(request);
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {
                    //普通表单项
                    return SucceedOrFail.failure.getCode();
                } else {
                    //上传文件表单项
                    //获取用户id值
                    String userId = fileItem.getFieldName();
                    //判断上传文件是否为图片
                    String contentType = fileItem.getContentType();
                    String fileName = fileItem.getName();
                    int lastPoint = fileName.lastIndexOf(".");
                    String suffix = fileName.substring(lastPoint + 1);//取得后缀
                    if (!(suffix.equals("jpg") || contentType.equals("image/jpeg"))) {
                        return SucceedOrFail.failure.getCode();
                    }
                    //存WEB-INF路径下安全
                    String dirRealPath = request.getSession().getServletContext().getRealPath("/upload/userIcon");
                    //如果目录文件不存在，则生成目录文件
                    File directory = new File(dirRealPath);
                    if (!directory.exists()) {
                        directory.mkdirs();//若不存在，则创建目录
                    }
                    File iconfile = new File(directory, userId + "." + suffix);//真正上传的文件应该存入的此文件
                    fileItem.write(iconfile);
                }
            }
            return SucceedOrFail.success.getCode();
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SucceedOrFail.failure.getCode();
    }

    public int updateAllInfo(HttpServletRequest request) {
        User_AllInfo user_allInfo = (User_AllInfo) request.getSession().getAttribute("Account");

        User user = user_allInfo.getUser();
        user.setTel(request.getParameter("Ntel"));

        UserInfo userInfo = user_allInfo.getUserInfo();
        userInfo.setEmail(request.getParameter("Email"));
        userInfo.setSignature(request.getParameter("signature"));

        int userinfoflag = userInfoMapper.updateUserInfo(userInfo);
        int userflag = userMapper.updateUser(user);

        user_allInfo = new User_AllInfo(user, userInfo);
        request.getSession().setAttribute("Account", user_allInfo);
        if (userflag == 1 && userinfoflag == 1) {
            return SucceedOrFail.success.getCode();
        } else {
            return SucceedOrFail.failure.getCode();
        }
    }

    public int updatepwd(User user, HttpServletRequest request, HttpServletResponse response) {
        User_AllInfo user_allInfo = (User_AllInfo) request.getSession().getAttribute("Account");
        user_allInfo.setPwd(MD5Utils.md5(user.getPwd()));//md5加密
        request.getSession().setAttribute("Account", user_allInfo);
        return userMapper.updatePwd(user);
    }

    @Override
    public void exportUserIcon(HttpServletRequest request, HttpServletResponse response) throws UserIconNotFoundException, IOException {
        String userId = ((User_AllInfo) request.getSession().getAttribute("Account")).getId().toString();
        String picPath = request.getSession().getServletContext().getRealPath("/upload/userIcon/" + userId + ".jpg");
        File userIcon = new File(picPath);
        if (userIcon.exists()) {
            //通过路径得到一个输入流
            try(
                    FileInputStream fis = new FileInputStream(picPath);
                    ServletOutputStream sos = response.getOutputStream();
                    BufferedInputStream bis =  new BufferedInputStream(fis);
                    BufferedOutputStream bos = new BufferedOutputStream(sos);
                    ){
                //告知客户端要下载的文件
                response.setHeader("Content-Disposition","attachment;filename="+userIcon.getName());
                //告知客户端要下的文件类型
                response.setHeader("Content-Type","image/jpeg");//application/x-blorb 二进制也可以
                //通过字节流输出
                //方式1
                int temp;
                while((temp=bis.read())!=-1){
                    bos.write(temp);
                }
                //方式2
//                byte[] b = new byte[1024];
//                while((temp=fis.read(b))!=-1){
//                    sos.write(b,0,temp);
//                }
            }
        } else {
            throw new UserIconNotFoundException("该用户没有头像", 404);
        }
    }
}
