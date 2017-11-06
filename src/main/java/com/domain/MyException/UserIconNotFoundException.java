package com.domain.MyException;

public class UserIconNotFoundException extends Exception{
    String msg;
    int err_code;

    public UserIconNotFoundException(String msg, int err_code) {
        super();
        this.msg = msg;
        this.err_code = err_code;
    }

    @Override
    public String toString() {
        return "UserIconNotFoundException{" +
                "msg='" + msg + '\'' +
                ", err_code=" + err_code +
                '}';
    }

    public String getMsg() {
        return msg;
    }

    public int getErr_code() {
        return err_code;
    }
}
