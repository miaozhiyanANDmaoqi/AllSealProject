<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-10-30
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer gid = Integer.parseInt(request.getParameter("gid"));
    String name = request.getParameter("thisGoodsName");
    request.setAttribute("gid",gid);
    request.setAttribute("thisGoodsName",name);
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>${requestScope.get("thisGoodsName")}</title>
</head>
<body style="background: url(/img/cloth2.jpg);  text-align:center">
<!--导航栏-->
<%@include file="../WEB-INF/jsp/head.jsp"%>
<script type="text/javascript">
    
    function updateMessage() {
        var params =JSON.stringify({"gid":${requestScope.get("gid")}});
        $.ajax({
            type:'POST',
            url: '/Goods/goodsDetial',
            contentType:'application/json;charset=utf-8',
            dataType:'json',
            data:params,
            success:function (data) {
                $("#goodsName").text(data.goodsName);
                $("#description").text(data.description);
                $("#type").text(data.type);
                $("#gid").text(data.gid);
                $("#online_time").text(data.online_time);
                $("#price").text(data.price);
                for(var i=0;i< data.messages.length;i++){
                    $("#messages").append(
                        "                <div class=\"panel panel-warning\">\n" +
                        "                    <div class=\"panel-body\">\n" +
                        "       楼层："+i+"\n" +
                        "                    </div>\n" +
                        "                    <div class=\"panel-body\">\n" +
                        <%--用户信息--%>
                        "                        <div class=\"col-xs-4 col-md-3\" >"+
                        "                            <h6>留言时间："+data.messages[i].messageDate+"</h6> &nbsp &nbsp "+
                        "                            <h6>留言用户ID:"+data.messages[i].uid+"</h6>"+
                        "                        </div>"+
                        <%--留言信息--%>
                        "                           <div>"+data.messages[i].text+"</div>"+
                        "                    </div>" +
                        "                </div>"
                    );
                }
            },
            error:function () {
                alert("error");
            }
        });
    }

    function commitMessage() {
        var $message = $("#textarea").val();
        $("#textarea").val("");
        $.ajax({
            type:'POST',
            url:'/GoodsMessage/commitGoodsMessage',
            dataType:'json',
            data:'text='+$message+'&gid='+${requestScope.get("gid")},
            success:function (data) {
                $("#messages").empty();<%--清空所有的子元素--%>
                for(var i=0;i< data.length;i++){
                    $("#messages").append(
                        "                <div class=\"panel panel-warning\">\n" +
                        "                    <div class=\"panel-body\">\n" +
                        "       楼层："+i+"\n" +
                        "                    </div>\n" +
                        "                    <div class=\"panel-body\">\n" +
                        <%--用户信息--%>
                        "                        <div class=\"col-xs-4 col-md-3\" >"+
                        "                            <h6>留言时间："+data[i].messageDate+"</h6> &nbsp &nbsp "+
                        "                            <h6>留言用户ID:"+data[i].uid+"</h6>"+
                        "                        </div>"+
                        <%--留言信息--%>
                        "                           <div>"+data[i].text+"</div>"+
                        "                    </div>" +
                        "                </div>"
                    );
                }
            },
            error:function () {
                alert("还未登录！请先登录");
                location.href="/User/login";
            }
        });
    }

    setInterval(
       function () {
           $("#messages").empty();
           updateMessage();
       }
        ,9900
    )
</script>

<!--左半部显示商品-->
<div class="col-xs-8">
    <%--商品各种信息--%>
        <div class="panel-body" style="background-color: #fcf8e3">
            <h1 id="goodsName"></h1><%--goodsName--%>
            <h2 id="description"></h2>
            <h3 id="type"></h3>
            <h3 id="gid"></h3>
            <h3 id="online_time"></h3>
            <h3 id="price"></h3>
        </div>
        <%--留言板，查看的地方--%>
        <div id="messages"  style="background-color: #faebcc"></div>
        <%--发表留言的地方--%>
        <div>
            <div class="alert alert-info" role="alert">发表留言</div>
            <textarea id="textarea" style="width: 100%;height: 200px"></textarea>
            <button type="button" class="btn btn-info" style="margin-right: 8px" onclick="commitMessage()">发表</button>
        </div>

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
</body>
</html>
