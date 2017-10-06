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
<body style="background: url(/img/cloth2.jpg);  text-align:center">
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
        <form action="updateUserAllInfo" method="post">
            <div class="panel-body">
                <span class="input-group-addon" id="basic-info">基本信息:</span>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-acc">昵称</span>
                    <label class="form-control" aria-describedby="basic-addon1">${Account.account}</label>
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-tel">电话</span>
                    <input name="Ntel" type="text" aria-describedby="basic-addon1" class="form-control" id="inputTel" placeholder="输入手机号码" value="${Account.tel}"><span id="telSpan"></span>
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
                    <input name="Email" type="text" aria-describedby="basic-addon1" class="form-control" id="inputEmail" placeholder="输入邮箱" value="${Account.sign_in_date}"><span id="EmailSpan"></span>
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="detailed-EXP">经验值</span>
                    <div class="progress">
                        <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                            40% Complete (success)
                        </div>
                    </div>
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="detailed-allseal">出售总额</span>
                    <label class="form-control" aria-describedby="basic-addon1">${Account.sign_in_date}</label>
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="detailed-purchase">购买总额</span>
                    <label class="form-control" aria-describedby="basic-addon1">${Account.sign_in_date}</label>
                </div>
                <span class="input-group-addon" id="detailed-signature">签名介绍</span>
                <div class="input-group">
                    <span class="input-group-addon">-</span>
                    <input name="signature" type="textarea" aria-describedby="basic-addon1" class="form-control" id="signature" placeholder="输入签名介绍" value="${Account.sign_in_date}"><span id="signatureSpan">还可以输入170个文字</span>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-3">
                        <button type="submit" class="btn btn-success" id ="submitButton">保存</button>
                    </div>
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
                            telSpan.innerHTML = "请输入电话";
                            telRight = false;
                            telSpan.className = "text-warning";
                        } else if(newTel.value == ${sessionScope.Account.tel}){
                            telSpan.innerHTML = "电话未修改";
                            telRight = true;
                            telSpan.className = "text-success";
                        }else if (reg.test(newTel.value)) {
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
