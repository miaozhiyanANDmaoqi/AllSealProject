package com.controller;

import com.domain.eneity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
    @Autowired
    private UserService userService;


    @RequestMapping("/test")
    public String test(){
        return "test";
    }
    @RequestMapping("/str")
    @ResponseBody
    public String str(){
        return "string";
    }

    @RequestMapping("/go")
    @ResponseBody
    public User go(){
        User u = new User();
        u.setAccount("123");
        u.setPwd("222");
        u.setTel("qweqwe");
        return u;
    }
}