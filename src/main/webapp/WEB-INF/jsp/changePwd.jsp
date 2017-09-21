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


<form action="updatePwd" method="post">
    <div class="form-group">
        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
        <label for="User">用户名</label>
          <div class="col-sm-3">
             <input type="text" class="form-control" id="User" placeholder="请输入用户名,不超过15位"><span id="accSpan"></span>
          </div>
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-oldLock" aria-hidden="true"></span>
        <label for="oldPwd">当前密码</label>
            <div class="col-sm-3">
             <input type="password" class="form-control" id="oldPwd"  placeholder="请输入旧密码,至少6位"><span id="oldpwdSpan"></span>
            </div>
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-newLock" aria-hidden="true"></span>
        <label for="newPwd">新的密码</label>
        <div class="col-sm-3">
            <input type="password" class="form-control" id="newPwd"  placeholder="请确认新密码,至少6位" name="pwd"><span id="pwdSpan"></span>
        </div>
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-check" aria-hidden="true"></span>
        <label for="confirmPwd">确认密码</label>
            <div class="col-sm-3">
                <input type="password" class="form-control" id="confirmPwd"  placeholder="请确认新密码,至少6位"><span id="pwdCheckSpan"></span>
            </div>
    </div>
    <input type="hidden" name="id" value="${sessionScope.user.id}"/>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-3">
            <button type="submit" class="btn btn-default" id ="submitButton">确认修改</button>
        </div>
    </div>
</form>
</body>



<script type="text/javascript">
    var pwd = ${sessionScope.user.pwd};
    var User = document.getElementById("User");


    var oldPwd = document.getElementById("oldPwd");


    var  newPwd = document.getElementById("newPwd");


    var confirmPwd = document.getElementById("confirmPwd");



    var span = document.getElementById("accSpan");
    User.onblur = function () {

        if(User.value.length == 0){
            span.innerHTML = "";
        }else if(User.value.length > 15){
            span.innerHTML = "用户名太长";
            span.className="text-danger";
        }else{
            span.innerHTML = "该用户名可以使用";
            span.className="text-success";
        }
    }

    var pwdRight = false;
    var  span = document.getElementById("oldpwdSpan");
   oldPwd.onblur = function () {
        if(pwd==null || pwd==""){
            span.innerHTML = "";
        }else{
            if (oldPwd.value==pwd){
                span.innerHTML = "密码正确";
                span.className="text-success";
                pwdRight = true;
            }else{
                span.innerHTML = "密码错误";
                span.className="text-danger";
                pwdRight = false;
            }
        }
    }

    var span = document.getElementById("pwdSpan");
    newPwd.onblur = function () {
        if(pwdRight == false ) {

        }else{
            if (newPwd.value.length >= 6 && newPwd.value.length <= 15) {
                span.innerHTML = "密码可以使用";
                span.className="text-success";
            } else {
                span.innerHTML = "密码至少6位,至多15位";
                span.className="text-danger";
            }
        }
    }


    var span = document.getElementById("pwdCheckSpan");
    confirmPwd.onblur = function () {
        if(newPwd.value.length == 0){
            span.innerHTML = "请先输入新密码";
            span.className="text-danger";
        }else if (confirmPwd.value == newPwd.value) {
            span.innerHTML = "密码一致";
            span.className="text-danger";
        } else {
            span.innerHTML = "密码不一致";
            span.className="text-danger";
        }
    }


</script>

</html>
