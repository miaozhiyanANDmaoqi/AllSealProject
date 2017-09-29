package com.service.aspectj;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class UserPermissionsCheck {

    @Before("execution(* com.service.UserService.*(..))")
    public void userLoginCheck(JoinPoint joinPoint){
        String methodName = joinPoint.getSignature().getName();
        if(methodName.equals("uploadIcon")||methodName.equals("updateAllInfo")||methodName.equals("updatepwd")){
            System.out.println("check!!!!!!!!!!!!!!!!");
        }
    }
}
