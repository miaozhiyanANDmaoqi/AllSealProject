package com.domain.po;

import com.domain.eneity.GoodsInfo;
import com.domain.eneity.GoodsMessage;

import java.util.List;

public class GoodsDetial {
    private Integer gid;
    private Integer uid;
    private String goodsName;
    private String online_time;
    private double price = -1;
    private String description;
    private Integer goodstype;//1.书籍 2.衣物 3.电子产品 4.其他杂物
    private List<GoodsMessage> messages;

    public GoodsDetial() {
    }
    public GoodsDetial(GoodsInfo goodsInfo,List<GoodsMessage> messages) {
        this.messages = messages;
        this.gid=goodsInfo.getGid();
        this.uid=goodsInfo.getUid();
        this.goodsName=goodsInfo.getGoodsName();
        this.online_time = goodsInfo.getOnline_time();
        this.price = goodsInfo.getPrice();
        this.description=goodsInfo.getDescription();
        this.goodstype=goodsInfo.getGoodstype();
    }

    @Override
    public String toString() {
        return "GoodsDetial{" +
                "gid=" + gid +
                ", uid=" + uid +
                ", goodsName='" + goodsName + '\'' +
                ", online_time='" + online_time + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", goodstype=" + goodstype +
                ", messages=" + messages +
                '}';
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getOnline_time() {
        return online_time;
    }

    public void setOnline_time(String online_time) {
        this.online_time = online_time;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getGoodstype() {
        return goodstype;
    }

    public void setGoodstype(Integer goodstype) {
        this.goodstype = goodstype;
    }

    public List<GoodsMessage> getMessages() {
        return messages;
    }

    public void setMessages(List<GoodsMessage> messages) {
        this.messages = messages;
    }
}
