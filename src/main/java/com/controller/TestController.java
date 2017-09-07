package com.controller;

import com.Service.UserService;
import com.domain.eneity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
    @Autowired
    private UserService userService;

    @RequestMapping("/test")
    public String test(){
        return "test";
    }

    @RequestMapping("/go")
    public User go(){
        User u = new User();
        u.setAccount("123");
        u.setPwd("222");
        u.setTel("qweqwe");
        return u;
    }
}