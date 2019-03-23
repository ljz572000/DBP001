<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--width=device-width 表示宽度是设备屏幕的宽度。-->
    <!--initial-scale=1 表示初始的缩放比例。-->
    <!--shrink-to-fit=no 自动适应手机屏幕的宽度。-->
    <meta name="description" content="">
    <meta name="author" content="">
    <!--标题旁边的小icon-->
    <title>课程实验管理</title>
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/navbar-top-fixed.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="../js/bootstrap.js"></script>
</head>

<body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="reception_index.jsp">连锁酒店管理系统</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="reception_index.jsp">预约服务<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">入住服务</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customerInfor.jsp">客人信息录入</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="check_out.jsp">退房服务</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="search.jsp">信息查询服务</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../login.jsp">退出系统</a>
            </li>
        </ul>
    </div>
</nav>

<main role="main">

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="jumbotron">
                <h1>入住服务</h1>
                <form action="../ReceptionServlet?opttype=checkIn" class="bg-light" method="post" role="form">
                    <input type="hidden" name="opttype" value="checkIn">
                    <br>
                    <label for="idCard">身份证号</label>
                    &nbsp;&nbsp;
                    <small class="text-danger">入住之前需预约</small>
                    <input required id="idCard" class="form-control" type="text" name="idCard" placeholder="身份证号">
                    <br>
                    <div class="text-center">
                        <input type="submit" value="提交" class="btn btn-primary" style=" width: 30vh;
    height: 6vh;
    font-weight: bold;
    font-size: 3vh;"/>
                    </div>
                    <br>
                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>

