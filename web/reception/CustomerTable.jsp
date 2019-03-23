<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <li class="nav-item ">
                <a class="nav-link" href="reception_index.jsp">预约服务<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="checkIn.jsp">入住服务</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="customerInfor.jsp">客人信息录入<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="check_out.jsp">退房服务</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">信息查询服务</a>
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
                <c:set var="showhead" value="0"/>
                <c:forEach var="Customer" items="${CustomerList}">
                <c:if test="${showhead == 0}">
                <h1>顾客信息</h1>
                <table class="table table-light table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>身份证号码</th>
                        <th>姓名</th>
                        <th>年龄</th>
                        <th>家庭地址</th>
                        <th>工作单位</th>
                        <th>来自地</th>
                        <th>押金金额</th>
                        <th>住宿费</th>
                        <th>入住酒店号</th>
                        <th>入住房间号</th>
                        <c:if test="${Customer.leftTime != null}">
                        <th>离店日期</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody>
                    </c:if>
                    <tr>
                        <td>${Customer.idCard}</td>
                        <td>${Customer.cusName}</td>
                        <td>${Customer.age}</td>
                        <td>${Customer.addr}</td>
                        <td>${Customer.workplace}</td>
                        <td>${Customer.comefrom}</td>
                        <td>${Customer.deposit}</td>
                        <td>${Customer.fee}</td>
                        <td>${Customer.hotelId}</td>
                        <td>${Customer.rno}</td>
                        <c:if test="${Customer.leftTime != null}">
                            <th>${Customer.leftTime}</th>
                        </c:if>
                        <%--<td>--%>
                            <%--<a href="../ReceptionServlet?opttype=confirmCheckIn&rno=${p.rno}&idCard=${p.idCard}&pre_time=${p.pre_time}&pre_leftTime=${p.pre_leftTime}">确认入住</a>--%>
                        <%--</td>--%>
                    </tr>
                    <c:set var="showhead" value="1"/>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
</body>
</html>