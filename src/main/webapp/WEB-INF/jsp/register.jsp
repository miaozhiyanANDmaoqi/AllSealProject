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
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <!--  Bootstrap 核心 JavaScript 文件 -->
    <script src="../../js/bootstrap.min.js"></script>
    <!-- 本地Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css" type="text/css" />
    <title>注册页面</title>
</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">买买买网</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li id="indexId"><a href="/index.jsp">首页<span class="sr-only">(current)</span></a></li>
                <li id="registerId" ><a href="register">注册</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">宝贝<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">书籍</a></li>
                        <li><a href="#">买错了的衣物</a></li>
                        <li><a href="#">电子产品</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">不可描述的生活用品</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li id="loginId">
                    <c:if test="${not empty user}"><a>${user.account}</a></c:if>
                    <c:if test="${empty user }"><a href="/login">未登录</a></c:if>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的帐户 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/login">个人信息</a></li>
                        <li><a href="#">我的消息</a></li>
                        <li><a href="#">买卖记录</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/logout">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--导航栏结束-->

<!--表单-->
<form class="form-horizontal" action="/signIn" onsubmit="return check()" method="post">
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
        } else if(passwordIn.value.length<6){
            span.innerHTML="密码至少6位";
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
    submit.onmouseover = function () {
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
        xmlhttp.open("get","signInCheckAccAndTel?account="+accountIn.value+"&tel="+inputTel.value);
        <!--发送请求-->
        xmlhttp.send(null);
    }


</script>
