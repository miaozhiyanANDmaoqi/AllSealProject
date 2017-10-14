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
                 var jsonuser = JSON.stringify(params);
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
                     "type":'POST',
                     "contentType":'application/json;charset=utf-8',
                     "success":function (data) {
                         alert(data);
                     },
                     "error":function () {
                         alert("服务器忙");
                     },
                     "dataType":'json'
                 });
             }

         }
         function bt2click() {
             var params = JSON.stringify({"account":"缪治安","tel":"15527097561"});
             $.ajax({
                 type:'POST',
                 url:'/rjsonrjson',
                 contentType:'application/json;charset=utf-8',
                 dataType:'json',
                 data:{"account":"缪治安","tel":"15527097561"},
                 success:function (data) {
                     alert(data);
                 },
                 error:function () {
                     alert("error");
                 }
             });
         }

         function bt3click() {
             var params = JSON.stringify({"account":"缪治666","tel":"15527097561"});
             $.ajax({
                 type:'POST',
                 url:'/rpojorjson',
//                 contentType:'application/json;charset=utf-8',
                 dataType:'json',
                 data:'account=缪治666&tel=15527097561&pwd=123',
                 success:function (data) {
                     alert(data);
                 },
                 error:function () {
                     alert("error");
                 }
             });
         }
    </script>
</head>
<body>
json test!
<button type="button" id="btn1">test</button>
<button type="button" id="btn2" onclick="bt2click()">请求json,返回json</button>
<button type="button" id="btn3" onclick="bt3click()">请求pojo,返回json</button>
</body>
</html>
