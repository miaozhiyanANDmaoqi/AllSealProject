package com.service.impl;

import com.dao.UserInfoMapper;
import com.dao.UserMapper;
import com.domain.Emnu.SucceedOrFail;
import com.domain.eneity.User;
import com.domain.eneity.UserInfo;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;

    public User findUserByAccount(String acc){
        User user = new User();
        user.setAccount(acc);
        return userMapper.findUserByManyElement(user);
    }

    /**
     * 返回1成功 -3account不可用 -2tel不可用 -5都不可用
     * @param user
     * @return
     */
    public int signInCheck(User user){
        int result = 0;
        User user_acc = new User();
        user_acc.setAccount(user.getAccount());
        if(userMapper.findUserByManyElement(user_acc)!=null){
            result = result-3;
        }
        User user_tel = new User();
        user_tel.setTel(user.getTel());
        if(userMapper.findUserByManyElement(user_tel)!=null){
            result = result-2;
        }
        return result;
    }

    public int registerAccount(User user) {
        User user_acc = new User();
        user_acc.setAccount(user.getAccount());
        if(userMapper.findUserByManyElement(user_acc)!=null){
            return SucceedOrFail.failure.getCode();
        }
        User user_tel=new User();
        user_tel.setTel(user.getTel());
        if(userMapper.findUserByManyElement(user_tel)!=null){
            return SucceedOrFail.failure.getCode();
        }
        user.setSign_in_date( new SimpleDateFormat("yyyy-MM-dd HH:mm").format(System.currentTimeMillis()));
        int user_flag = userMapper.insertUser(user);//插入user表，成功返回1，失败返回0
        UserInfo userInfo = new UserInfo();
        userInfo.setId(userMapper.findUserByManyElement(user).getId());//根据用户名和密码查到user的id
        int userinfo_flag = userInfoMapper.insertUserInfo(userInfo);//根据用户id插入userinfo表，成功返回1，失败返回0
        if(user_flag == 1 && userinfo_flag ==1){
            return SucceedOrFail.success.getCode();
        }else{
            return SucceedOrFail.failure.getCode();
        }
    }

    public int loginCheck(User user,HttpServletRequest request) {
       User userreturn = userMapper.findUserByManyElement(user);
       if(null == userreturn){
           return SucceedOrFail.failure.getCode();
       }else{
           request.getSession().setAttribute("Account",userreturn);
           return SucceedOrFail.success.getCode();
       }
    }

    public void logout(HttpServletRequest request,HttpServletResponse response) {
        request.getSession().invalidate();
        try {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public int updatePwd(User user) {
        return userMapper.updatePwd(user);
    }
}
