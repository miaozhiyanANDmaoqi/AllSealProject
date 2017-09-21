package com.controller;

import com.domain.Emnu.SucceedOrFail;
import com.domain.eneity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
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
    public String signIn(User user){
        int i = userService.registerAccount(user);
        if(SucceedOrFail.success.getCode() == i){
            return "jsp/success_register";
        }else{
            return "jsp/fail_register";
        }
    }

    @RequestMapping("checkLogin")
    public String checkLogin(User user,HttpServletRequest request){
        switch (userService.loginCheck(user,request)){
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



    @RequestMapping("register")
    public String register(){
        return "jsp/register";
    }

    @RequestMapping("login")
    public String login(){
        return "jsp/login";
    }

    @RequestMapping("myInfo")
    public String myInfo(){
        return "jsp/myInfo";
    }

    @RequestMapping("changePwd")
    public String updateUser(){
        return "jsp/changePwd";
    }

    @RequestMapping("updatePwd")
    public String updatePwd(User user){
        userService.updatePwd(user);
        return "jsp/updatePwd_Success";
    }
}
