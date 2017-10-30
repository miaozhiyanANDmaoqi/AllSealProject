<%@ page import="java.util.UUID" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-10-15
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传商品</title>
    <%response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expires", 0);
        response.flushBuffer();%>
</head>
<body style="background: url(/img/cloth.jpg);  text-align:center">
<%@include file="head.jsp"%>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">
    function submitIMG(){
        var uploadData = {
            type:'POST',
            url:'${pageContext.request.contextPath}/Goods/uploadGoodsIMG',
            dataType:'text',
            data:{
                fileName:'file'
            },
            success:function (data) {
                $("#IMG").attr("src","${pageContext.request.contextPath}/upload/Goods/"+data);
            }
        };
        $("#itemForm").ajaxSubmit(uploadData);
    }
</script>
<!--左半部分-->
<div class="col-xs-2">
    <div class="thumbnail">
        <img src="${pageContext.request.contextPath}/upload/userIcon/${Account.id}.jpg" alt="暂无头像">
        <div class="caption">
            <h4>基本信息</h4>
            <h5>账户:${Account.account}</h5>
            <p>
            <form action="/User/uploadIcon" method="post" enctype="multipart/form-data">
                <input type="file" name="${Account.id}" class="btn btn-default col-sm-7"/>
                <input type="submit" value="上传头像" class="btn btn-primary"/>
            </form>
            </p>
        </div>
    </div>
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation"><a href="/User/myInfo">我的信息</a></li>
        <li role="presentation"><a href="/User/communication">聊天消息<span class="badge">14</span></a></li>
        <li role="presentation" class="active"><a href="/User/transaction">交易记录</a></li>
        <li role="presentation"><a href="/User/changePwd">修改密码</a></li>
    </ul>
</div>

<!--右半部分-->
<div class="panel panel-info col-xs-10">
    <div class="panel-heading">
        <h3 class="panel-title">交易记录</h3>
    </div>

    <div class="panel-body" id="panelBody">
        <form id="itemForm" class="form-horizontal" action="/Goods/addGoods"  method="post" <%--enctype="multipart/form-data"--%>>
            <div class="form-group">
                <span class="glyphicon glyphicon-tower" aria-hidden="true"></span>
                <label for="goodsName" class="col-sm-2 control-label">商品名称</label>
                <div class="col-sm-3">
                    <input name="goodsName" type="text" class="form-control" id="goodsName" placeholder="请填写商品名称"><span id="goodsNameSpan"></span>
                </div>
            </div>
            <div class="form-group">
                <span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
                <label for="goodsPrice" class="col-sm-2 control-label">商品价格</label>
                <div class="col-sm-3">
                    <input name="price" type="text" class="form-control" id="goodsPrice" placeholder="请填写商品价格"><span id="goodsPriceSpan"></span>
                </div>
            </div>
            <div class="form-group">
                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                <label for="goodsDes" class="col-sm-2 control-label">商品描述</label>
                <div class="col-sm-3">
                    <input name="description" type="text" class="form-control" id="goodsDes" placeholder="请填写商品描述"><span id="goodsDesSpan"></span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-3">
                    <div class="checkbox">
                        <label>
                            <input type="radio" name="goodstype" value="1" checked="checked"> 书籍
                            <input type="radio" name="goodstype" value="2"> 衣物
                            <input type="radio" name="goodstype" value="3"> 电子产品
                            <input type="radio" name="goodstype" value="4"> 其他物品
                        </label>
                        <div class="alert alert-warning" role="alert"><label>请根据您的商品给它正确的分类</label></div>
                    </div>
                </div>
            </div>
            <div>
                <%--上传商品图片--%>
                <input type="file" name="file" onchange="submitIMG()"/>
               <img id="IMG" src="${pageContext.request.contextPath}/img/addFile.jpg" width="100px" height="100px" style="left: 10px"/>
            </div>
            <input type="hidden" name="uid" value="${sessionScope.Account.id}"/>
            <input type="submit" value="ok">
        </form>
        <button id="Btn_uploadGoodsConfirm" class="btn btn-success">确认上货</button>
        <button id="Btn_uploadGoodsCancel" class="btn btn-danger">取消上货</button>
        </div>
    </div>
</div>
</body>
</html>
