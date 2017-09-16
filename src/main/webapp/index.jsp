<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>买买买！</title>
</head>

<body style="background: url(img/woodenbg.jpg);  text-align:center">
<%@include file="WEB-INF/jsp/head.jsp"%>

<a href="/test">跳转页面</a>
<a href="http://www.baidu.com">http://www.baidu.com</a>
<span>${user.account}</span>
</body>
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