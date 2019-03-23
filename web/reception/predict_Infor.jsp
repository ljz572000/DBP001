<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
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
            <li class="nav-item active">
                <a class="nav-link" href="#">预约服务<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="checkIn.jsp">入住服务</a>
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
                <h1>预约住房信息确认与费用支付</h1>
                <br>
                <h3>身份证号：${idCard}</h3>
                <h3>是否是VIP用户：${vip}</h3>
                <h3>酒店号：${hotelId}</h3>
                <h3>房间号：${rno}</h3>
                <c:if test="${vip==true}">
                    <h3>押金金额：￥ 0 </h3>
                </c:if>
                <c:if test="${vip==false}">
                    <h3>押金金额：￥ ${rTypePrice}</h3>
                </c:if>
                <h3>住宿费：￥ ${rTypePrice*totalDay}</h3>
                <h3>入住时间：${check_inTime}</h3>
                <h3>离店时间：${leftTime}</h3>
                <h3>入住总天数：${totalDay}</h3>
                <h3 class="text-danger">需支付总金额：￥ ${rTypePrice*(totalDay+1)}</h3>
                <a class="btn btn-primary" href="../ReceptionServlet?opttype=predict">确认</a>
                &nbsp;&nbsp;&nbsp;
                <a class="btn btn-primary" href="reception_index.jsp">取消</a>
                <hr>
                <small>押金金额 = 当前房间的一天的价格</small>
                <br>
                <small>住宿费 = 当前房间价格 X 入住天数</small>
                <hr>
            </div>
        </div>
    </div>
</main>
</body>
</html>

