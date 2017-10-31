package com.controller;

import com.domain.annotation.Check;
import com.domain.eneity.GoodsInfo;
import com.domain.eneity.GoodsMessage;
import com.domain.po.User_AllInfo;
import com.service.GoodsMessageService;
import com.service.ServiceUtils.MessageObserver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("GoodsMessage")
public class GoodsMessageController {
    @Autowired
    GoodsMessageService  goodsMessageService;

    @Check
    @RequestMapping("/commitGoodsMessage")
    @ResponseBody
    public List<GoodsMessage> commitGoodsMessage(GoodsMessage goodsMessage, HttpServletRequest request){
        //插入留言
        User_AllInfo user_allInfo = (User_AllInfo) request.getSession().getAttribute("Account");
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

    @RequestMapping("addObserver")
    public void addObserver(Object object){
        MessageObserver.addOberver(object);
    }

    @RequestMapping("removeObserver")
    public void removeObserver(Object object){
        MessageObserver.removeObserver(object);
    }
}
