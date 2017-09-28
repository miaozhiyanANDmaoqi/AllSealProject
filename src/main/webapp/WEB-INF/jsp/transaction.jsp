<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-09-24
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>交易记录</title>
</head>

<body style="background: url(/img/cloth.jpg);  text-align:center">
<%@include file="head.jsp"%>

<!--左半部分-->
<div class="col-xs-2">
    <div class="thumbnail">
        <img src="${pageContext.request.contextPath}/upload/userIcon/${Account.id}.jpg" alt="暂无头像">
        <div class="caption">
            <h4>基本信息</h4>
            <h5>账户:${Account.account}</h5>
            <p>
            <form action="/uploadIcon" method="post" enctype="multipart/form-data">
                <input type="file" name="${Account.id}" class="btn btn-default col-sm-7"/>
                <input type="submit" value="上传头像" class="btn btn-primary"/>
            </form>
            </p>
        </div>
    </div>
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation"><a href="/myInfo">我的信息</a></li>
        <li role="presentation"><a href="/communication">聊天消息<span class="badge">14</span></a></li>
        <li role="presentation" class="active"><a href="/transaction">交易记录</a></li>
        <li role="presentation"><a href="/changePwd">修改密码</a></li>
    </ul>
</div>

<!--右半部分-->
<div class="panel panel-info col-xs-10">
    <div class="panel-heading">
        <h3 class="panel-title">交易记录</h3>
    </div>

    <div class="panel-body">


    </div>

</div>


</body>
</html>
