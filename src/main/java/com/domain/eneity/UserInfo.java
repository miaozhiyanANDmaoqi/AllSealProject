package com.domain.eneity;

import java.io.Serializable;

public class UserInfo implements Serializable {
    private Integer id;
    private String signature;
    private double allpurchase;
    private double allseal;
    private Integer EXP;
    private String Email;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public double getAllpurchase() {
        return allpurchase;
    }

    public void setAllpurchase(double allpurchase) {
        this.allpurchase = allpurchase;
    }

    public double getAllseal() {
        return allseal;
    }

    public void setAllseal(double allseal) {
        this.allseal = allseal;
    }

    public Integer getEXP() {
        return EXP;
    }

    public void setEXP(Integer EXP) {
        this.EXP = EXP;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }
}
