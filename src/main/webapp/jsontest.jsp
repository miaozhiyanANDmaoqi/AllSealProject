<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-10-06
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <title>Title</title>
    <script type="text/javascript">
         window.onload = function () {
             var btn1 = document.getElementById("btn1");
             btn1.onclick = function () {
                 var url = "/jsontestj";
                 var params = {"account":"杰克","tel":"15527097561"};
//                 $(this).load(url,params,function (data) {
//                     var jsonData = eval("("+data+")");
//                     alert(jsonData.message);
//                 });
//                 $.post(url,params,function (data) {
//                     alert(data);
//                 });
//                 $.get(url,params,function (data) {
//                     alert(data.message);
//                 });
                 $.ajax({
                     "url":url,
                     "data":params,
                     "type":"POST",
                     "success":function (data) {
                         alert(data);
                     },
                     "error":function () {
                         alert("服务器忙");
                     },
                     "dataType":"json"
                 });
             }
         }
    </script>
</head>
<body>
json test!
<button type="button" id="btn1">test</button>
</body>
</html>
