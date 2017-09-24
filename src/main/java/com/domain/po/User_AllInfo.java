package com.domain.po;

import com.domain.eneity.User;
import com.domain.eneity.UserInfo;

public class User_AllInfo {
    private Integer id;
    private String account;
    private String tel;
    private String pwd;
    private String gender;
    private String sign_in_date;
    private String signature;
    private double allpurchase;
    private double allseal;
    private Integer EXP;
    private String Email;

    public User_AllInfo() {
    }
    public User_AllInfo(User user, UserInfo userInfo) {
        this.id=user.getId();
        this.account=user.getAccount();
        this.tel=user.getTel();
        this.pwd=user.getPwd();
        this.gender=user.getGender();
        this.sign_in_date=user.getSign_in_date();
        this.signature=userInfo.getSignature();
        this.allpurchase=userInfo.getAllpurchase();
        this.allseal=userInfo.getAllseal();
        this.EXP=userInfo.getEXP();
        this.Email=this.getEmail();
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSign_in_date() {
        return sign_in_date;
    }

    public void setSign_in_date(String sign_in_date) {
        this.sign_in_date = sign_in_date;
    }

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