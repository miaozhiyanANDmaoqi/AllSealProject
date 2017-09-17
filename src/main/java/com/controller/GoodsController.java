package com.controller;

import com.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;

@Controller
public class GoodsController {
    @Autowired
    GoodsService goodsService;

    @RequestMapping("uploadGood")
    public String uploadGood(HttpServletRequest request){
        goodsService.uploadFile(request);
        return "jsp/myInfo";
    }

}
