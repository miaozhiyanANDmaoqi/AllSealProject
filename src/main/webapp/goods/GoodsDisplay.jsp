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
<div class="jumbotron" style="background-color:#c0a16b; text-align:center" >
    <h1 style="text-decoration-color: #8c8c8c"> 骚年，等你很久了! <small>好货尽在!</small></h1>
</div>
<div>
    <!--左半部显示商品-->
    <div class="col-xs-8">
        <span class="label label-default">商品类别</span>
        <table id="goodsTable">
            <%--<c:forEach>--%>
            <%--<tr>--%>
                <%--<div class="panel panel-warning">--%>
                    <%--<div class="panel-body">--%>
                        <%--商品名称--%>
                    <%--</div>--%>
                    <%--<div class="panel-footer" style="height: 170px;">--%>
                        <%--&lt;%&ndash;图片展示区&ndash;%&gt;--%>
                            <%--<div class="col-xs-6 col-md-3" >--%>
                                <%--<a href="#" class="thumbnail">--%>
                                    <%--<img src="/img/street.jpg" alt="..." class="img-rounded" style="width: auto;height: 100%;">--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--&lt;%&ndash;商品信息&ndash;%&gt;--%>
                            <%--<div style="height: 100%;">--%>
                                <%--<div style="margin-right: 0px">商品描述</div>--%>
                                <%--<div style="margin-right: 0px">商品价格</div>--%>
                                <%--<div style="margin-right: 0px">上线日期</div>--%>
                                <%--<div  class="alert alert-info">浏览次数</div>--%>
                                <%--<div style="margin-right: 0px">卖家信息</div>--%>
                            <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</tr>--%>
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
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        <%--获取商品信息--%>
        var type =${pageContext.request.getParameter("goodstype")};
        url = "/Goods/listGoods?goodstype="+type;

        $.get(url,function (data) {
//            var jsonData = eval(data);
            for(var i=0;i<data.length;i++){
                var POJO = data[i];
                $("#goodsTable").append(
                   " <tr><td style=\"width: 1000px;\">\n" +
                    "                <div class=\"panel panel-warning\">\n" +
                    "                    <div class=\"panel-body\">\n" +
                    "       类别："+POJO.goodstype+" &nbsp&nbsp&nbsp&nbsp  名称:"+POJO.goodsName+"\n" +
                    "                    </div>\n" +
                    "                    <div class=\"panel-footer\" style=\"height: 170px;\">\n" +
                    "                        <%--图片展示区--%>\n" +
                    "                        <div class=\"col-xs-6 col-md-3\" >\n" +
                    "                            <a href=\"/goods/GoodsDetial.jsp?gid="+POJO.gid+"&thisGoodsName="+POJO.goodsName+"\" class=\"thumbnail\">\n" +
                    "                                <img src=\"/img/street.jpg\" alt=\"...\" class=\"img-rounded\" style=\"width: auto;height: 100%;\">\n" +
                    "                            </a>\n" +
                    "                        </div>\n" +
                    "                        <%--商品信息--%>\n" +
                    "                        <div style=\"height: 100%;\">\n" +
                    "                            <div style=\"margin-right: 0px\">"+POJO.description+"</div>\n" +
                    "                            <div style=\"margin-right: 0px\">"+POJO.price+"</div>\n" +
                    "                            <div style=\"margin-right: 0px\">"+POJO.online_time+"</div>\n" +
                    "                            <div  class=\"alert alert-info\">浏览次数</div>\n" +
                    "                            <div style=\"margin-right: 0px\">"+POJO.uid+"</div>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "          </td></tr>"
                );
            }
        });
    });
</script>

</html>