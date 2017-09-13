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

    @RequestMapping("register")
    public String register(){
        return "jsp/register";
    }

    @RequestMapping("signIn")
    public String signIn(User user){
        int i = userService.registerAccount(user);
        if(SucceedOrFail.success.getCode()==i){
            return "jsp/success_register";
        }else{
            return "jsp/fail_register";
        }
    }
}
