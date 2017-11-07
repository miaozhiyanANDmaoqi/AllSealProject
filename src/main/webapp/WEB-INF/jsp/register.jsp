<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-09-09
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>注册页面</title>
</head>
<body>
<%@include file="head.jsp"%>

<!--表单-->
<form class="form-horizontal" action="/User/signIn" onsubmit="return check()" method="post">
    <div class="form-group">
        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
        <label for="inputAccount" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-3">
            <input name="account" type="text" class="form-control" id="inputAccount" placeholder="用户名不超过15位"><span id="accSpan"></span>
        </div>
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
        <label for="inputPassword" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-3">
            <input name="pwd" type="password" class="form-control" id="inputPassword" placeholder="请输入密码,至少6位"><span id="pwdSpan"></span>
        </div>
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-check" aria-hidden="true"></span>
        <label for="inputPasswordCheck" class="col-sm-2 control-label">确认密码</label>
        <div class="col-sm-3">
            <input type="password" class="form-control" id="inputPasswordCheck" placeholder="请重复输入密码"><span id="pwdCheckSpan"></span>
        </div>
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
        <label for="inputTel" class="col-sm-2 control-label">手机号码</label>
        <div class="col-sm-3">
            <input name="tel" type="password" class="form-control" id="inputTel" placeholder="输入手机号码"><span id="telSpan"></span>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-3">
            <div class="checkbox">
                <label>
                    <input type="radio" name="gender" value="m" checked="checked"> 男
                    <input type="radio" name="gender" value="f"> 女
                </label>
                <div class="alert alert-warning" role="alert"><label>注意：选择后无法修改</label></div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-3">
            <button type="submit" class="btn btn-default" id ="submitButton">注册</button>
        </div>
    </div>
</form>

</body>
</html>
<script type="text/javascript">
    var spanacc = document.getElementById("accSpan");
    var spantel = document.getElementById("telSpan");

    var accountIn = document.getElementById("inputAccount");
    var hasAccount = false;
    accountIn.onblur = function () {
        if(accountIn.value.length==0){
            spanacc.innerHTML="";
            spanacc.className="";
            hasAccount = false;
        }else if (accountIn.value.length>15){
            spanacc.innerHTML="输入有误，用户名不超过15位";
            spanacc.className="text-danger";
            hasAccount = false;
        }else{
            spanacc.innerHTML="该用户名可以使用!";
            spanacc.className="text-success";
            hasAccount = true;
        }
    }

    var passwordIn = document.getElementById("inputPassword");
    var hasPassword = false;
    passwordIn.onblur = function () {
        var span = document.getElementById("pwdSpan");
        if (passwordIn.value.length == 0){
            span.innerHTML="";
            span.className="";
            hasPassword = false;
        } else if(passwordIn.value.length<6 || passwordIn.value.length>22){
            span.innerHTML="密码至少6位,至多22位";
            span.className="text-danger";
            hasPassword = false;
        }else{
            span.innerHTML="有效密码!";
            span.className="text-success";
            hasPassword = true;
        }
    }

    var passwordCheck = document.getElementById("inputPasswordCheck");
    var hasPassCheck = false;
    passwordCheck.onblur = function () {
        var span = document.getElementById("pwdCheckSpan");
        if(passwordIn.value.length ==0){
            span.innerHTML="";
            span.className="";
            hasPassCheck = false;
        }else if(passwordIn.value != passwordCheck.value){
            span.innerHTML="两次密码不一致";
            span.className="text-warning";
            hasPassCheck = false;
        }else{
            span.innerHTML="密码一致!";
            span.className="text-success";
            hasPassCheck = true;
        }
    }

    var inputTel = document.getElementById("inputTel");
    var hasTel =false;
    inputTel.onblur = function () {
        var reg=/^1+[35678]+[0-9]{9}$/;
        if(inputTel.value.length==0){
            spantel.innerHTML="";
            spantel.className="";
            hasTel =false;
        }else  if(reg.test(inputTel.value)){
            spantel.innerHTML="手机号可用!";
            spantel.className="text-success";
            hasTel =true;
        }else{
            spantel.innerHTML="请输入正确的手机号";
            spantel.className="text-warning";
            hasTel =false;
        }
    }


    function check(){
        if(hasAccount && hasPassword && hasPassCheck && hasTel)
            return true;
        else{
            alert("emmm~ 个人信息没有填写完整不能注册!");
            return false;
        }
    }

    var submit = document.getElementById("submitButton");
    submit.onmousemove = function () {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if(xmlhttp.readyState==4){
                if(xmlhttp.status==200){
                    if(xmlhttp.responseText=="-3"){
                        spanacc.innerHTML="该用户名已被注册";
                        spanacc.className="text-danger";
                        hasAccount = false;
                    }else if(xmlhttp.responseText== "-2"){
                        spantel.innerHTML="手机号已被注册";
                        spantel.className="text-danger";
                        hasTel =false;
                    }else if(xmlhttp.responseText== "-5"){
                        spanacc.innerHTML="该用户名已被注册";
                        spanacc.className="text-danger";
                        hasAccount = false;
                        spantel.innerHTML="手机号已被注册";
                        spantel.className="text-danger";
                        hasTel =false;
                    }else if(xmlhttp.responseText== "0"){
                        if(accountIn.value.length!=0){
                            spanacc.innerHTML="该用户名可以使用!";
                            spanacc.className="text-success";
                            hasAccount = true;
                        }
                        if(inputTel.value.length!=0){
                            spantel.innerHTML="手机号可用!";
                            spantel.className="text-success";
                            hasTel =true;
                        }
                    }
                }
            }
        }
        <!--建立连接-->
        xmlhttp.open("get","/User/signInCheckAccAndTel?account="+accountIn.value+"&tel="+inputTel.value);
        <!--发送请求-->
        xmlhttp.send(null);
    }


</script>
