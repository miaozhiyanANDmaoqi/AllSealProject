<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017-09-10
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
注册成功，<span id="second">5</span>秒后跳转到首页!
若为跳转，请点击<a href="../../index.jsp">这里</a>
</body>
</html>
<script type="text/javascript">
    var second = document.getElementById("second");
    var sec=5;
    setInterval(
        function () {
            if(sec >0){
                sec = sec-1;
                second.innerHTML=sec;
            }else{
                location.href="../../index.jsp";
            }
        }
        ,1000
    )
</script>
