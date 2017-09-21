package com.service.impl;

import com.dao.UserMapper;
import com.domain.Emnu.SucceedOrFail;
import com.domain.eneity.User;
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

    public User findUserByAccount(String acc){
        return userMapper.findUserByAccount(acc);
    }

    /**
     * 返回1成功 -3account不可用 -2tel不可用 -5都不可用
     * @param user
     * @return
     */
    public int signInCheck(User user){
        int result = 0;
        if(userMapper.findUserByAccount(user.getAccount())!=null){
            result = result-3;
        }
        if(userMapper.findUserByTel(user.getTel())!=null){
            result = result-2;
        }
        return result;
    }

    public int registerAccount(User user) {
        if(userMapper.findUserByAccount(user.getAccount())!=null){
            return SucceedOrFail.failure.getCode();
        }
        if(userMapper.findUserByTel(user.getTel())!=null){
            return SucceedOrFail.failure.getCode();
        }
        user.setSign_in_date( new SimpleDateFormat("yyyy-MM-dd HH:mm").format(System.currentTimeMillis()));
        return userMapper.insertUser(user);
    }

    public int loginCheck(User user,HttpServletRequest request) {
       User userreturn = userMapper.findUserByAccountAndPwd(user);
       if(null == userreturn){
           return SucceedOrFail.failure.getCode();
       }else{
           request.getSession().setAttribute("user",userreturn);
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

    public void updatePwd(User user) {
        userMapper.updatePwd(user);
    }
}
