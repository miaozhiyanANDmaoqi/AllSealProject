package com.domain.po;

public class VoteReq {
    private Integer uid;
    private Integer gid;


    @Override
    public String toString() {
        return "VoteReq{" +
                "uid=" + uid +
                ", gid=" + gid +
                '}';
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

}
