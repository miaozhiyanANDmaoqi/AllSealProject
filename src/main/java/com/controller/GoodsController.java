package com.controller;

import com.alibaba.fastjson.JSONArray;
import com.domain.eneity.GoodsInfo;
import com.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("Goods")
public class GoodsController {
    @Autowired
    GoodsService goodsService;

    @RequestMapping("uploadGood")
    public String uploadGood(HttpServletRequest request){
        goodsService.uploadFile(request);
        return "jsp/myInfo";
    }

    @RequestMapping("/listGoods")
    public void listGoods(HttpServletResponse response){
        GoodsInfo goodsInfo = new GoodsInfo();
        List goodslist = goodsService.listGoods(goodsInfo);
        try {
            response.setContentType("application/json;charset=UTF-8");
            String jsonList = JSONArray.toJSONString(goodslist);
            response.getWriter().write(jsonList);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("addGoods")
    public String addGoods(GoodsInfo goodsInfo){
        goodsService.addGoods(goodsInfo);
        return "jsp/transaction";
    }


    @RequestMapping("uploadGoods")
    public String uploadGoods(){
        return "jsp/uploadGoods";
    }
}
