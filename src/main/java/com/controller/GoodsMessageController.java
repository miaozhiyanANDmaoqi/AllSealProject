package com.controller;

import com.domain.eneity.GoodsInfo;
import com.domain.eneity.GoodsMessage;
import com.domain.po.User_AllInfo;
import com.service.GoodsMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("GoodsMessage")
public class GoodsMessageController {
    @Autowired
    GoodsMessageService  goodsMessageService;

    @RequestMapping("/commitGoodsMessage")
    @ResponseBody
    public List<GoodsMessage> commitGoodsMessage(GoodsMessage goodsMessage, HttpSession session){
        //插入留言
        User_AllInfo user_allInfo = (User_AllInfo) session.getAttribute("Account");
        goodsMessage.setUid(user_allInfo.getId());
        Date date = new Date();//日期格式处理Date转换为mysql的Datetime
        Timestamp timestamp = new Timestamp(date.getTime());
        goodsMessage.setMessageDate(timestamp);
        goodsMessageService.addMessage(goodsMessage);

        //回显
        GoodsInfo goodsInfo = new GoodsInfo();
        goodsInfo.setGid(goodsMessage.getGid());
        return goodsMessageService.queryMSG(goodsInfo);
    }
}
