<%--
  Created by IntelliJ IDEA.
  User: MQ
  Date: 2017/9/18
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
</head>
<body>
<%@include file="head.jsp"%>


<form action="updatePwd" method="post" onsubmit="return check()" >
    <div class="form-group">
        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
        <label for="oldPwd">旧的密码</label>
            <div class="col-sm-3">
             <input type="password" class="form-control" id="oldPwd"  placeholder="请输入旧密码">
            </div>
      <span id="oldpwdSpan"></span>
    </div>

    <div class="form-group">
        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
        <label for="newPwd">新密码</label>
        <div class="col-sm-3">
            <input type="password" class="form-control" id="newPwd"  placeholder="请输入新密码,至少6位" name="pwd">
        </div>
        <span id="pwdSpan"></span>
    </div>


    <div class="form-group">
        <span class="glyphicon glyphicon-check" aria-hidden="true"></span>
        <label for="confirmPwd">确认新密码</label>
            <div class="col-sm-3">
                <input type="password" class="form-control" id="confirmPwd"  placeholder="请确认新密码">
            </div>
        <span id="pwdCheckSpan"></span>
    </div>

    <input type="hidden" name="id" value="${sessionScope.Account.id}"/>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-3">
            <button type="submit" class="btn btn-default" id ="submitButton">确认修改</button>
        </div>
    </div>

</form>
</body>



<script type="text/javascript">
    var pwd = ${sessionScope.Account.pwd};
    var oldPwd = document.getElementById("oldPwd");
    var  newPwd = document.getElementById("newPwd");
    var confirmPwd = document.getElementById("confirmPwd");

    var pwdRight = false;
    var newPwdRight = false;
    var newPwdCheckRight = false;
    var  oldSpan = document.getElementById("oldpwdSpan");
   oldPwd.onblur = function () {
        if(oldPwd.value==null || oldPwd.value==""){
            oldSpan.innerHTML = "";
            pwdRight = false;
        }else{
            if (oldPwd.value==pwd){
                oldSpan.innerHTML = "密码正确";
                oldSpan.className="text-success";
                pwdRight = true;
            }else{
                oldSpan.innerHTML = "密码错误";
                oldSpan.className="text-danger";
                pwdRight = false;
            }
        }
    }

    var newPwdSpan = document.getElementById("pwdSpan");
    newPwd.onblur = function () {
        if(pwdRight == false ) {
            newPwdSpan.innerHTML = "旧密码错误";
            newPwdSpan.className="text-danger";
            newPwdRight = false;
        }else{
            if (newPwd.value == oldPwd.value ) {
                newPwdSpan.innerHTML = "新旧密码不能一样";
                newPwdRight = false;
                newPwdSpan.className="text-danger";
            }else if (newPwd.value.length >= 6 && newPwd.value.length <= 22) {
                newPwdSpan.innerHTML = "密码可以使用";
                newPwdSpan.className="text-success";
                newPwdRight = true;
            } else if (newPwd.value.length == 0 ) {
                newPwdSpan.innerHTML = "";
                newPwdRight = false;
            } else {
                newPwdSpan.innerHTML = "密码至少6位,至多22位";
                newPwdSpan.className="text-danger";
                newPwdRight = false;
            }
            confirmPwd.onmouseout();
        }
    }


    var span = document.getElementById("pwdCheckSpan");
    confirmPwd.onmouseout = function () {
        if(confirmPwd.value.length == 0){
            span.innerHTML = "";
            newPwdCheckRight = false;
        }else if (confirmPwd.value == newPwd.value) {
            span.innerHTML = "密码一致";
            span.className="text-success";
            newPwdCheckRight = true;
        } else {
            span.innerHTML = "密码不一致";
            span.className="text-danger";
            newPwdCheckRight = false;
        }
    }


    function check(){
        if(pwdRight&& newPwdRight&&newPwdCheckRight)
            return true;
        else{
            alert("emmm~ 填写信息错误!");
            return false;
        }
    }

</script>

</html>