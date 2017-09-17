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
MY info

上传图片:
<form action="/uploadGood" method="post" enctype="multipart/form-data">
    <input type="text" name="description"/><br/>
    <input type="file" name="photo"/><br/>
    <input type="submit" value="上传"/>
</form>
</body>
</html>
