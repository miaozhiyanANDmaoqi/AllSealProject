package com.domain.Emnu;

public enum SucceedOrFail {
    success(1),
    failure(-1)
    ;

    int code;

    SucceedOrFail(int code){
        this.code=code;
    }

    public int getCode(){
        return this.code;
    }
}
