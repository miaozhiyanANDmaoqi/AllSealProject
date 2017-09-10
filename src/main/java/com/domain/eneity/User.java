package com.domain.eneity;

import java.io.Serializable;

public class User implements Serializable{
    private String account;
    private String tel;
    private String pwd;
    private String gender;
    private String sign_in_date;

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
}
