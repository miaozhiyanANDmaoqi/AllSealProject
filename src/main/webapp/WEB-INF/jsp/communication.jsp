<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-09-24
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>聊天消息</title>
</head>

<body>
<%@include file="head.jsp"%>

<div class="col-sm-3 col-md-2">
    <div class="thumbnail">
        <img src="${pageContext.request.contextPath}/img/test.jpg" alt="暂无头像">
        <div class="caption">
            <h4>基本信息</h4>
            <h5>账户:${Account.account}</h5>
            <p>
            <form action="/uploadGood" method="post" enctype="multipart/form-data">
                <input type="file" name="photo" class="btn btn-default col-sm-5"/>
                <input type="submit" value="上传头像" class="btn btn-primary"/>
            </form>
            </p>
        </div>
    </div>
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" ><a href="/myInfo">我的信息</a></li>
        <li role="presentation" class="active"><a href="/communication">聊天消息</a></li>
        <li role="presentation"><a href="/transaction">交易记录</a></li>
    </ul>
</div>


<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">聊天消息</h3>
    </div>

    <div class="panel-body">


    </div>

</div>


</body>
</html>
