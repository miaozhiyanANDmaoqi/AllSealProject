<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-09-16
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
                    <div><input type="file" name="photo" class="btn btn-default col-sm-5"/></div><br/>
                    <div><input type="submit" value="上传头像" class="btn btn-primary"/></div>
                </form>
            </p>
        </div>
    </div>
</div>


<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">个人信息</h3>
    </div>

    <div class="panel-body">
        <a href="changePwd">修改!!!!</a><br/>
        完善程度:
        <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                60%
            </div>
        </div>
        进度条测试
        <div class="progress">
            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                <span class="sr-only">20% Complete</span>
            </div>
        </div>

    </div>



</div>




</body>
</html>
