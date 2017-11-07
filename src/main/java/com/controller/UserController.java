package com.controller;

import com.domain.Emnu.SucceedOrFail;
import com.domain.MyException.UserIconNotFoundException;
import com.domain.annotation.Check;
import com.domain.eneity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("User")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("signInCheckAccAndTel")
    public void signInCheck(User user, HttpServletResponse response){
        String str = userService.signInCheck(user)+"";
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        printWriter.write(str);
    }

    @RequestMapping("signIn")
    public String signIn(User user,HttpServletRequest request) {
        int i = userService.registerAccount(user);
        if(SucceedOrFail.success.getCode() == i){
            return "jsp/success_register";
        }else{
            return "jsp/error";
        }
    }

    @RequestMapping("checkLogin")
    public String checkLogin(User user,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        switch (userService.loginCheck(user,request,response)){
            case 1:
                return "jsp/success_login";
            default:
                return "jsp/login";

        }
    }

    @RequestMapping("logout")
    public void logout(HttpServletRequest request,HttpServletResponse response){
        userService.logout(request,response);
    }

    @RequestMapping("updatePwd")
    public String updatePwd(User user,HttpServletRequest request,HttpServletResponse response){
        if(userService.updatepwd(user,request,response)==1){
            return "jsp/updatePwd_Success";
        } else{
            return "jsp/error";
        }
    }

    @RequestMapping("uploadIcon")
    public String uploadIcon(HttpServletRequest request){
        if(userService.uploadIcon(request)==SucceedOrFail.success.getCode()){
            return "jsp/myInfo";
        }else{
            return "jsp/error";
        }
    }
    @RequestMapping("updateUserAllInfo")
    public String updateUserAllInfo(HttpServletRequest request){
        if(userService.updateAllInfo(request)==SucceedOrFail.success.getCode()){
            return "jsp/myInfo";
        }else{
            return "jsp/error";
        }
    }

    @RequestMapping("exportUserIcon")
    public void exportUserIcon(HttpServletResponse response,HttpServletRequest request){
        try {
            userService.exportUserIcon(request,response);
        } catch (UserIconNotFoundException | IOException e) {//jdk7新特性:多个catch合并
            e.printStackTrace();
        }
    }

    @RequestMapping("register")
    public String register(){
        return "jsp/register";
    }

    @RequestMapping("login")
    public String login(){
        return "jsp/login";
    }

    @Check
    @RequestMapping("myInfo")
    public String myInfo(HttpServletRequest request){
        return "jsp/myInfo";
    }

    @Check
    @RequestMapping("changePwd")
    public String changePwd(HttpServletRequest request){
        return "jsp/changePwd";
    }

    @Check
    @RequestMapping("communication")
    public String communication(HttpServletRequest request){
        return "jsp/communication";
    }

    @Check
    @RequestMapping("transaction")
    public String transaction(HttpServletRequest request){
        return "jsp/transaction";
    }

    @Check
    @RequestMapping("changeUserInfo")
    public String changeUserInfo(HttpServletRequest request){
        return "jsp/changeUserInfo";
    }

    @RequestMapping("otherUserInfo")
    public String otherUserInfo(HttpServletRequest request){
        return "OtherUserInfo";
    }
}
