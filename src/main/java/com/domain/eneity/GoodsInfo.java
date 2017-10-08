package com.domain.eneity;

import java.io.Serializable;

public class GoodsInfo implements Serializable{
    private Integer gid;
    private Integer uid;
    private String online_time;
    private double price = -1;
    private String description;
    private Integer goodstype;//1.书籍 2.衣物 3.电子产品 4.其他杂物

    @Override
    public String toString() {
        return "GoodsInfo{" +
                "gid=" + gid +
                ", uid=" + uid +
                ", online_time='" + online_time + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", goodstype=" + goodstype +
                '}';
    }

    /*
    * 利用阿里的JSON转换器，就不需要这个方法了
    * */
    public String jsonString(){
        return "{\"gid\":\""+gid+"\",\"uid\":\""+uid+"\",\"online_time\":\""+online_time+"\"" +
                ",\"price\":\""+price+"\",\"description\":\""+description+"\"" +
                ",\"goodstype\":\""+goodstype+"\"}";
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
}
