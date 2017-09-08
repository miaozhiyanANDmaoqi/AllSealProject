<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>买买买！</title>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
     <!--  Bootstrap 核心 JavaScript 文件 -->
    <script src="js/bootstrap.min.js"></script>
    <!-- 本地Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
</head>

<body style="background: url(img/woodenbg.jpg);  text-align:center">
<!--导航栏-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">买买买网</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">用户名<span class="sr-only">(current)</span></a></li>
                <li><a href="#">我的账户</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">登录</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--导航栏结束-->

<a href="test">跳转页面</a>

<select id="select1">
    <option  value="1">111</option>
    <option  value="2">222</option>
    <option  value="3">333</option>
</select>
<select id="select2">
    <option value="1">1111111</option>
    <option value="2">2222222</option>
    <option value="3">3333333</option>
</select>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
</body>
<script type="text/javascript">

    var se1 = document.getElementById("select1");
    var se2 = document.getElementById("select2");
    se1.onchange=function() {
        switch (se1.value){
            case '1':
                se2.innerHTML="<option>议一议</option><option>议一111议</option>";
                break;
            case '2':
                se2.innerHTML="";
                break;
            case'3':
                se2.innerHTML="<option>议3333议</option><option>33议</option>";
                break;
            default:
                alert("error");
        }
//        if(se1.value == 1){
//            se2.innerHTML="<option>议一议</option><option>议一111议</option>";
//        }else if(se1.value == 2){
//            se2.innerHTML="";
//        }else if(se1.value == 3){
//            se2.innerHTML="<option>议3333议</option><option>33议</option>";
//        }
    }
</script>