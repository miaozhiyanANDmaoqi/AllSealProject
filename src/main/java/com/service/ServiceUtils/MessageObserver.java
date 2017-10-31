package com.service.ServiceUtils;

import java.util.List;

public class MessageObserver {
    //保存观察者的list
    private static List observer;
    //添加新的观察者
    public static Boolean addOberver(Object obj){
        return observer.add(obj);
    }
    //移除观察者
    public static Boolean removeObserver(Object obj){
        return observer.remove(obj);
    }

    private MessageObserver() {
    }
}
