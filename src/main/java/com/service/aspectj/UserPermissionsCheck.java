package com.service.aspectj;

import com.domain.annotation.Check;
import com.domain.po.User_AllInfo;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
@Aspect
public class UserPermissionsCheck {

    @Around("execution(* com.controller.UserController.*(..))")
    public Object userLoginCheck(ProceedingJoinPoint joinPoint)throws Throwable{
        Object result = null;
        //前执行

//        把方法名写死
//        String methodName = joinPoint.getSignature().getName();
//        if(methodName.equals("changePwd")||methodName.equals("communication")||methodName.equals("transaction")||
//                methodName.equals("changeUserInfo")||methodName.equals("myInfo")){

        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        if(methodSignature.getMethod().isAnnotationPresent(Check.class)){//有@Check注解就执行
            HttpServletRequest request = null;
            HttpServletResponse response = null;
            Object [] args = joinPoint.getArgs();
            for (int i=0;i<args.length;i++){
                if(args[i] instanceof HttpServletRequest){
                    request=(HttpServletRequest) args[i];
                }
                if(args[i] instanceof HttpServletResponse){
                    response = (HttpServletResponse)args[i];
                }
            }
            User_AllInfo user_allInfo = (User_AllInfo)request.getSession(true).getAttribute("Account");
            if(user_allInfo == null){
                try {
                  return "jsp/login";
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        //执行目标方法
        result = joinPoint.proceed();

        return result;
    }
}
