package com.domain.Emnu;

public enum GoodsType {
    Books(1),
    Clothing(2),
    Electronic_Products(3),
    Other(4)
    ;

    int code;

    GoodsType(int code) {
        this.code = code;
    }

    public int getCode(){
        return this.code;
    }
}
