<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-09-27
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>最新动态</title>
</head>
<body style="background: url(/img/cloth2.jpg);  text-align:center">
<!--导航栏-->
<%@include file="../WEB-INF/jsp/head.jsp"%>
<!--头页-->
<div class="jumbotron" style="background-color:honeydew; text-align:center" >
    <h1> 骚年，等你很久了! <small>好货尽在!</small></h1>
</div>
<!--左半部显示商品-->
<div class="col-xs-8">
    <h3>分类<span class="label label-default">商品信息</span></h3>
    <table>
        <%--<c:forEach items="" var="">--%>
            <%--<div>--%>
                <%--<div class="col-xs-5">--%>
                    <%--<h1>12312312312332</h1>--%>
                <%--</div>--%>
                <%--<div class="col-xs-6">--%>
                    <%--<h1>88888888888</h1>--%>
                <%--</div>--%>
            <%--</div>--%>
        <tr>
            <div class="panel panel-warning">
                <div class="panel-body">
                   商品名称
                </div>
                <div class="panel-footer">
                    <div class="col-xs-6 col-md-3">
                        <a href="#" class="thumbnail">
                            <img src="/img/street.jpg" alt="...">
                        </a>
                    </div>
                </div>
            </div>
        </tr>
        <%--</c:forEach>--%>
    </table>
</div>
<!--右半部显示本页信息-->
<div class="col-xs-4">
    <ul class="list-group">
        <a href="#" class="list-group-item active">按时间顺序排序</a>
        <a href="#" class="list-group-item">按价格排序(低到高)</a>
        <a href="#" class="list-group-item">按价格排序(高到低)</a>
        <a href="#" class="list-group-item">按访问量排序</a>
        <a href="#" class="list-group-item">按卖家信用排序</a>
    </ul>
    <span></span>
    <div class="list-group">
        <li role="separator" class="divider"></li>
        <a href="#" class="list-group-item">
           本网信息统计
        </a>
    </div>
</div>


<!--底部分页-->
<nav aria-label="Page navigation">
    <ul class="pagination">
        <li>
            <a href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li>
            <a href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>
</body>
</html>
