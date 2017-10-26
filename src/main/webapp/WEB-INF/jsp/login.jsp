<%@ page import="com.sun.org.apache.xpath.internal.operations.Bool" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-09-14
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String userName;
    Boolean hasUserName = false;
    Boolean hasPwd = false;
    Boolean rememberAP = false;
    String password;
    Cookie[] cookies = request.getCookies();
    for (int i=0;cookies!=null&&i<cookies.length;i++){
        if("Account".equals(cookies[i].getName())){
            userName = cookies[i].getValue();
            request.setAttribute("userName",userName);
            hasUserName = true;
        }
        if("Password".equals(cookies[i].getName())){
            password = cookies[i].getValue();
            request.setAttribute("password",password);
            hasPwd = true;
        }
    }

    if(hasPwd && hasUserName){
        rememberAP = true;
    }
    request.setAttribute("rememberAP",rememberAP);
%>

<html>
<head>
    <title>登录页面</title>
</head>
<body>
<%@include file="head.jsp"%>

<!--表单-->
<form class="form-horizontal" action="/User/checkLogin" onsubmit="return check()" method="post">
    <div class="form-group">
        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
        <label for="inputAccount" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-3">
            <input name="account" type="text" class="form-control" id="inputAccount" placeholder="请输入用户名" value="${userName}"><span id="accSpan"></span>
        </div>
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
        <label for="inputPassword" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-3">
            <input name="pwd" type="password" class="form-control" id="inputPassword" placeholder="请输入密码" value="${password}"><span id="pwdSpan"></span>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-3">
            <button type="submit" class="btn btn-default">登录</button>
            <input type="checkbox" name="rememberAcc" id="rememberAcc"><span>记住账户</span>
        </div>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    <%--记住密码的操作代码--%>
    var rememberAcc = document.getElementById("rememberAcc");
        if(true==${rememberAP}){
            rememberAcc.checked = true;
        }else{
            rememberAcc.checked = false;
        }

    var accountIn = document.getElementById("inputAccount");
    var hasAccount = false;
    accountIn.onmouseout = function () {
        var span = document.getElementById("accSpan");
        if(accountIn.value.length==0){
            span.innerHTML="";
            span.className="";
            hasAccount = false;
        }else if (accountIn.value.length>15){
            span.innerHTML="请输入正确的用户名";
            span.className="text-danger";
            hasAccount = false;
        }else{
            span.innerHTML="";
            span.className="text-success";
            hasAccount = true;
        }
    }

    var passwordIn = document.getElementById("inputPassword");
    var hasPassword = false;
    passwordIn.onmouseout = function () {
        var span = document.getElementById("pwdSpan");
        if (passwordIn.value.length == 0){
            span.innerHTML="";
            span.className="";
            hasPassword = false;
        } else if(passwordIn.value.length<6){
            span.innerHTML="密码格式不正确";
            span.className="text-danger";
            hasPassword = false;
        }else{
            span.innerHTML="";
            span.className="text-success";
            hasPassword = true;
        }
    }


    function check(){
        if(hasAccount && hasPassword){
            return true;
        }
        else{
            if(!hasAccount){
                var span = document.getElementById("accSpan");
                span.innerHTML="请输入用户名";
                span.className="text-danger";
            }
            if (!hasPassword){
                var span = document.getElementById("pwdSpan");
                span.innerHTML="请输入密码";
                span.className="text-danger";
            }
            return false;
        }
    }
</script>