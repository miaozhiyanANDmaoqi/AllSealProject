package com.domain.eneity;

import java.util.Date;

public class GoodsMessage {
    private Integer gid;
    private Integer uid;
    private Date messageDate;
    private String text;

    @Override
    public String toString() {
        return "GoodsMessage{" +
                "gid=" + gid +
                ", uid=" + uid +
                ", messageDate=" + messageDate +
                ", text='" + text + '\'' +
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

    public Date getMessageDate() {
        return messageDate;
    }

    public void setMessageDate(Date messageDate) {
        this.messageDate = messageDate;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
