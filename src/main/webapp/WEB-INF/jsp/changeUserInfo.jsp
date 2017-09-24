<%--
  Created by IntelliJ IDEA.
  User: MQ
  Date: 2017/9/23
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
</head>
<body>
<%@include file="head.jsp"%>

<!--左半部分-->
<div class="col-xs-2">
    <div class="thumbnail">
        <img src="${pageContext.request.contextPath}/upload/userIcon/${Account.id}.jpg" alt="暂无头像">
        <div class="caption">
            <h4>基本信息</h4>
            <h5>账户:${Account.account}</h5>
            <p>
            <form action="/uploadIcon" method="post" enctype="multipart/form-data">
                <input type="file" name="${Account.id}" class="btn btn-default col-sm-7"/>
                <input type="submit" value="上传头像" class="btn btn-primary"/>
            </form>
            </p>
        </div>
    </div>
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="/myInfo">我的信息</a></li>
        <li role="presentation"><a href="/communication">聊天消息<span class="badge">14</span></a></li>
        <li role="presentation"><a href="/transaction">交易记录</a></li>
        <li role="presentation"><a href="/changePwd">修改密码</a></li>
    </ul>
</div>

<!--右半部分-->
<div class="panel panel-info col-xs-10">
    <div class="panel-heading">
        <h3 class="panel-title">交易记录</h3>
    </div>

    <div class="panel-body">
        <form action="gggg" method="post">
            <div class="form-group">
                <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                <label for="inputTel" class="col-sm-2 control-label">手机号码</label>
                <div class="col-sm-3">
                    <input name="Ntel" type="text" class="form-control" id="inputTel" placeholder="输入手机号码"><span id="telSpan"></span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-3">
                    <button type="submit" class="btn btn-default" id ="submitButton">确定</button>
                </div>
            </div>
        </form>
    </div>

</div>
</body>

<script type="text/javascript">

    var newTel = document.getElementById("inputTel");
    var telSpan = document.getElementById("telSpan");
    var telRight = false ;
    var reg=/^1+[35678]+[0-9]{9}$/;
    newTel.onblur = function () {
        var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        if (newTel.value.length == 0) {
                            telSpan.innerHTML = "";
                            telRight = false;
                        } else if (reg.test(newTel.value)) {
                            if (xhr.responseText == -2) {
                                telSpan.innerHTML = "该号码已经注册";
                                telSpan.className = "text-warning";
                                telRight = false ;
                            } else {
                                telSpan.innerHTML = "该号码可以使用";
                                telSpan.className = "text-success";
                                telRight = true ;
                            }
                        } else {
                            telSpan.innerHTML = "该号码格式不正确";
                            telSpan.className = "text-warning";
                            telRight = false ;
                        }
                    }
                }
            }
            xhr.open("get","signInCheckAccAndTel?&tel="+newTel.value);
            xhr.send(null);
    }


</script>


</html>
