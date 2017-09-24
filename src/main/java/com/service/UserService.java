package com.service;

import com.domain.eneity.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {
    //注册
    public int registerAccount(User user);

    //登录
    public int loginCheck(User user, HttpServletRequest request);

    //注册时候检测用户名和电话
    public int signInCheck(User user);

    //注销
    public void logout(HttpServletRequest request, HttpServletResponse response);

    //更新密码
    public int updatePwd(User user);

    public int uploadIcon(HttpServletRequest request);
}
