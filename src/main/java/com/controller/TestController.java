package com.controller;

import com.domain.eneity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class TestController {
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
        u.setAccount("11234");
        u.setPwd("222");
        u.setTel("qweqwe");
        return u;
    }

    @RequestMapping("/jsontestj")
    @ResponseBody
    public User jsonTest(String s) throws IOException {
//        String method = request.getMethod();
//        System.out.println("method:"+method);
//        String AC = request.getParameter("account");
//        String tel = request.getParameter("tel");
        String asd = "成功了";
        String json = "{\"message\":\"成功了!\"}";
//        String json = "{'message':'成功了'}";
//        response.setContentType("application/json;charset=UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
//        response.getWriter().write(json);
        User user = new User();
        return user;
//        return json;
    }

    @RequestMapping("/rjsonrjson")
    public @ResponseBody User rjsonrjson(@RequestBody User user){
        System.out.println(user);
        return new User();
    }

    @RequestMapping("/rpojorjson")
    public @ResponseBody User rpojorjson(User user){
        System.out.println(user);

        return new User();
    }
}