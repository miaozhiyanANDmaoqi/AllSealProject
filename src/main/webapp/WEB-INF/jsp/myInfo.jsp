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
    <title>我的信息</title>
    <%response.setHeader("Pragma","No-cache");  response.setHeader("Cache-Control","no-cache");  response.setDateHeader("Expires", 0);  response.flushBuffer();%>
</head>
<body>
<%@include file="head.jsp"%>
<!--左半部分-->
    <div class="col-xs-2">
        <div class="thumbnail">
            <img id="user_icon" src="${pageContext.request.contextPath}/upload/userIcon/${Account.id}.jpg" alt="暂无头像">
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
            <li role="presentation" class="active"><a href="/User/myInfo">我的信息</a></li>
            <li role="presentation"><a href="/User/communication">聊天消息<span class="badge">14</span></a></li>
            <li role="presentation"><a href="/User/transaction">交易记录</a></li>
            <li role="presentation"><a href="/User/changePwd">修改密码</a></li>
        </ul>
    </div>
    <!--右半部分-->
    <div class="panel panel-info col-xs-10">
        <div class="panel-heading">
            <h3 class="panel-title">个人信息</h3>
        </div>

        <div class="panel-body">
            <span class="input-group-addon" id="basic-info">基本信息:</span>
            <div class="input-group">
                <span class="input-group-addon" id="basic-acc">昵称</span>
                <label class="form-control" aria-describedby="basic-addon1">${Account.account}</label>
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="basic-tel">电话</span>
                <label class="form-control" aria-describedby="basic-addon1">${Account.tel}</label>
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="basic-gender">性别</span>
                <label class="form-control" aria-describedby="basic-addon1">${Account.gender}</label>
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="basic-signIndate">注册日期</span>
                <label class="form-control" aria-describedby="basic-addon1">${Account.sign_in_date}</label>
            </div>
            <span class="input-group-addon" id="detailed-info">详细信息:</span>
            <div class="input-group">
                <span class="input-group-addon" id="detailed-Email">邮箱</span>
                <label class="form-control" aria-describedby="basic-addon1">Account.Email</label>
            </div>
            <div class="input-group"id="out_EXP">
                <span class="input-group-addon" id="detailed-EXP">经验值</span>
                <div class="progress">
                    <div id="EXP_progress" title="exp啊！" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                        80% Complete (success)${Account.EXP}
                    </div>
                </div>
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="detailed-allseal">出售总额</span>
                <label class="form-control" aria-describedby="basic-addon1">${Account.allseal}</label>
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="detailed-purchase">购买总额</span>
                <label class="form-control" aria-describedby="basic-addon1">${Account.allpurchase}</label>
            </div>
            <span class="input-group-addon" id="detailed-signature">签名介绍</span>
            <div class="input-group">
                <span class="input-group-addon">-</span>
                <label class="form-control" aria-describedby="basic-addon1">${Account.signature}</label>
            </div>

            <div class="progress">
                <div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                    <span class="sr-only">80% Complete (danger)</span>
                </div>
            </div>
        </div>
        <button type="button" class="btn btn-warning" id="changeButton" title="点击修改个人信息">修改信息</button>
    </div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#changeButton").click(function () {
            location.href="/User/changeUserInfo";
        });

        $("#user_icon").hover(function (event) {
            var big_icon = $("<img id=\"big_icon\" src=\"${pageContext.request.contextPath}/upload/userIcon/${Account.id}.jpg\" alt=\"暂无头像\">");
            big_icon.offset({"left":event.pageX+5,"top":event.pageY-20,"height":"200px","width":"150px"});
            big_icon.appendTo("body").show();
        },
        function () {
            $("#big_icon").remove();
        }).mousemove(function (event) {
            $("#big_icon").offset({"left":event.pageX+5,"top":event.pageY-20,"height":"200px","width":"150px"});
        });
    });
</script>
</html>
