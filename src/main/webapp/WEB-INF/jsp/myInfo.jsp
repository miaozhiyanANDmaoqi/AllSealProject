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

<div class="row">
    <div class="col-sm-3 col-md-2">
        <div class="thumbnail">
            <img src="${pageContext.request.contextPath}/img/test.jpg" alt="无图片">
            <div class="caption">
                <h3>Thumbnail label</h3>
                <p>p标题的啊！！</p>
                <p><a href="http://www.baidu.com" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
            </div>
        </div>
    </div>
</div>



上传图片:
<form action="/uploadGood" method="post" enctype="multipart/form-data">
    <input type="text" name="description"/><br/>
    <input type="file" name="photo"/><br/>
    <input type="submit" value="上传"/>
</form>
</body>
</html>
