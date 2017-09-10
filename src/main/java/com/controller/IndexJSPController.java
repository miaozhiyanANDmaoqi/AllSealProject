package com.controller;

import com.domain.eneity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class IndexJSPController {
    @RequestMapping("register")
    public String register(){
        return "jsp/register";
    }

    @RequestMapping("signIn")
    public String signIn(User user){
        return "jsp/success";
    }
}
