<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-09-16
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <!--  Bootstrap 核心 JavaScript 文件 -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- 本地Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" />
    <title>导航栏</title>
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
            <a class="navbar-brand" href="/index.jsp">买买买网</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li id="indexId"><a href="/index.jsp">首页<span class="sr-only">(current)</span></a></li>
                <li id="registerId" ><a href="register">注册帐号</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">宝贝<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="list-group-item list-group-item-success"><a href="#">书籍<span class="glyphicon glyphicon-book" aria-hidden="true"/></a></li>
                        <li class="list-group-item list-group-item-warning"><a href="#">买错了的衣物<span class="glyphicon glyphicon-gift" aria-hidden="true"/></a></li>
                        <li class="list-group-item list-group-item-info"><a href="#">电子产品<span class="glyphicon glyphicon-hdd" aria-hidden="true"/></a></li>
                        <li class="list-group-item list-group-item-warning"><a href="#">不可描述的生活用品<span class="glyphicon glyphicon-heart" aria-hidden="true"/></a></li>
                    </ul>
                </li>
                <li id="rank" ><a href="#">排行榜<span class="glyphicon glyphicon-star" aria-hidden="true"/></a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"/>查询</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li id="loginId">
                    <c:if test="${not empty Account}"><a><span class="glyphicon glyphicon-user" aria-hidden="true"/>${Account.account}</a></c:if>
                    <c:if test="${empty Account }"><a href="/User/login"><span class="glyphicon glyphicon-user" aria-hidden="true"/>未登录</a></c:if>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的帐户 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/User/myInfo"><span class="glyphicon glyphicon-user" aria-hidden="true"/>个人信息</a></li>
                        <li><a href="/User/communication"><span class="glyphicon glyphicon-comment" aria-hidden="true"/>聊天消息 <span class="badge">3</span></a></li>
                        <li><a href="/User/transaction"><span class="glyphicon glyphicon-usd" aria-hidden="true"/>交易记录</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="list-group-item list-group-item-danger"><a href="/User/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"/>退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--导航栏结束-->

</body>
</html>
<script type="text/javascript">
    var index = document.getElementById("indexId");
    var register = document.getElementById("registerId");
    var loginId = document.getElementById("loginId");
    register.onmouseover = function () {
        register.className="active";
    }
    register.onmouseout=function () {
        register.className="";
    }
    index.onmouseover = function () {
        index.className="active";
    }
    index.onmouseout=function () {
        index.className="";
    }
    loginId.onmouseover = function () {
        loginId.className="active";
    }
    loginId.onmouseout=function () {
        loginId.className="";
    }

</script>