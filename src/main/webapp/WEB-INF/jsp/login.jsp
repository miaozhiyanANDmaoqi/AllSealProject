<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-09-14
  Time: 9:46
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
                <li id="indexId"><a href="#">首页<span class="sr-only">(current)</span></a></li>
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
                <li id="loginId"><a href="/login">${user.account}</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的帐户 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">个人信息</a></li>
                        <li><a href="#">我的消息</a></li>
                        <li><a href="#">买卖记录</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--导航栏结束-->

<!--表单-->
<form class="form-horizontal" action="/checkLogin" onsubmit="return check()" method="post">
    <div class="form-group">
        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
        <label for="inputAccount" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-3">
            <input name="account" type="text" class="form-control" id="inputAccount" placeholder="请输入用户名"><span id="accSpan"></span>
        </div>
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
        <label for="inputPassword" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-3">
            <input name="pwd" type="password" class="form-control" id="inputPassword" placeholder="请输入密码"><span id="pwdSpan"></span>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-3">
            <button type="submit" class="btn btn-default">登录</button>
        </div>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    var accountIn = document.getElementById("inputAccount");
    var hasAccount = false;
    accountIn.onblur = function () {
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
    passwordIn.onblur = function () {
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