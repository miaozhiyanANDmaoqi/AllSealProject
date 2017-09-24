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
    <title>修改手机号码</title>
</head>
<body>
    <form action="#" method="post">
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
</body>

<script type="text/javascript">

    var newTel = document.getElementById("inputTel");
    var telSpan = document.getElementById("telSpan");
    var telRight = false ;
    newTel.onblur = function () {
        var reg=/^1+[35678]+[0-9]{9}$/;
        if(newTel.value.length == 0){
            telSpan.innerHTML="";
            telRight = false ;
        }else if(reg.test(newTel.value) ){

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if(xhr.readyState == 4){
                    if(xhr.status == 200){
                        if(xhr.responseText == -2){
                            telSpan.innerHTML = "该号码已经注册";
                            telSpan.className="text-warning";
                        }else {
                            telSpan.innerHTML = "该号码可以使用";
                            telSpan.className = "text-success";
                        }
                    }
                }
            }
            xhr.open("get","signInCheckAccAndTel?&tel="+newTel.value);
            xhr.send(null);
            telRight = true ;
        }else{
            telSpan.innerHTML = "该号码格式不正确";
            telSpan.className="text-warning";
        }
    }


</script>


</html>
