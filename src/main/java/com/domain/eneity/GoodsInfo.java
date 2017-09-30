package com.domain.eneity;

import java.io.Serializable;

public class GoodsInfo implements Serializable{
    private Integer gid;
    private Integer uid;
    private String online_time;
    private double price;
    private String description;
    private Integer type;//1.书籍 2.衣物 3.电子产品 4.其他杂物

    @Override
    public String toString() {
        return "GoodsInfo{" +
                "gid=" + gid +
                ", uid=" + uid +
                ", online_time='" + online_time + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", type=" + type +
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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
