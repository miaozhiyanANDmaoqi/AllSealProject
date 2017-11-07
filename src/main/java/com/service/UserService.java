package com.service;

import com.domain.MyException.UserIconNotFoundException;
import com.domain.eneity.User;
import com.domain.po.User_AllInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public interface UserService {
    //注册
    public int registerAccount(User user);
    //登录
    public int loginCheck(User user, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException;
    //注册时候检测用户名和电话
    public int signInCheck(User user);
    //注销
    public void logout(HttpServletRequest request, HttpServletResponse response);
    //上传头像
    public int uploadIcon(HttpServletRequest request);
    //修改所有信息
    public int updateAllInfo(HttpServletRequest request);
    //修改密码
    public int updatepwd(User user,HttpServletRequest request,HttpServletResponse response);
    //导出用户头像
    public void exportUserIcon(HttpServletRequest request,HttpServletResponse response) throws UserIconNotFoundException, IOException;
}
