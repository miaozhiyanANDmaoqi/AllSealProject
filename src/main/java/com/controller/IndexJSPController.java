package com.controller;

import com.domain.Emnu.SucceedOrFail;
import com.domain.eneity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexJSPController {
    @Autowired
    private UserService userService;

    @RequestMapping("signIn")
    public String signIn(User user){
        int i = userService.registerAccount(user);
        if(SucceedOrFail.success.getCode() == 1){
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



    @RequestMapping("register")
    public String register(){
        return "jsp/register";
    }

    @RequestMapping("login")
    public String login(){
        return "jsp/login";
    }

}
