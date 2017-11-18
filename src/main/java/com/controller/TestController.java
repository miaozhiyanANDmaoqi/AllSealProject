package com.controller;

import com.domain.eneity.User;
import com.service.RedisOption.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class TestController {
    @Autowired
    private ShardedJedisPool shardedJedisPool;
    @RequestMapping("/test")
    public String test(){
        return "test";
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

    @GetMapping("testRedis")
    @ResponseBody
    public String testRedis(HttpServletRequest request){
        ShardedJedis jedis = shardedJedisPool.getResource();//从池中获取jedis实例
//        Jedis jedis = new Jedis("127.0.0.1",6379);
//        jedis.auth("mzy!!!123");
        jedis.set("testkey1",request.getParameter("vv"));
        String val = jedis.get("testkey1");
        jedis.close();
        return val;
    }
//    @GetMapping("testRedisUtil")
//    @ResponseBody
//    public String testRedisUtil(HttpServletRequest request){
//        RedisUtil
//    }
}