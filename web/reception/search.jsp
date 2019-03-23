<%--
  Created by IntelliJ IDEA.
  User: 20160
  Date: 2018/12/25
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
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


<div class="container">

    <div class="row">

        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">信息查询</h4>
            <div class="row">
                <form class="needs-validation col-md-6 mb-3" action="../ReceptionServlet?opttype=search&by=Name" method="post"
                      role="form">
                    <div>
                        <label for="Name">按姓名查询客人信息</label>
                        <input type="text" class="form-control" id="Name" name="name">
                        <div class="invalid-feedback">
                            需要有效的名字
                        </div>
                        <br>
                        <button class="btn btn-primary btn-lg btn-block" type="submit">提交</button>
                    </div>
                </form>
                <form class="needs-validation col-md-6 mb-3" action="../ReceptionServlet?opttype=search&by=comefrom" method="post"
                      role="form">
                    <div >
                        <label for="comefrom">按来自地查询客人信息</label>
                        <input type="text" class="form-control" id="comefrom" name="comefrom">
                        <div class="invalid-feedback">
                            需要有效的来自地信息
                        </div>
                        <br>
                        <button class="btn btn-primary btn-lg btn-block" type="submit">提交</button>
                    </div>
                </form>
            </div>

            <div class="row">
                <form class="needs-validation col-md-6 mb-3" action="../ReceptionServlet?opttype=search&by=workplace" method="post"
                      role="form">
                    <div >
                        <label for="workplace">按工作单位查询客人信息</label>
                        <input type="text" class="form-control" id="workplace" name="workplace">
                        <div class="invalid-feedback">
                            需要有效的工作单位
                        </div>
                        <br>
                        <button class="btn btn-primary btn-lg btn-block" type="submit">提交</button>
                    </div>
                </form>
                <form class="needs-validation col-md-6 mb-3" action="../ReceptionServlet?opttype=search&by=addr" method="post"
                      role="form">
                    <div >
                        <label for="addr">按家庭地址查询客人信息</label>
                        <input type="text" class="form-control" id="addr" name="addr">
                        <div class="invalid-feedback">
                            需要有效的家庭地址信息
                        </div>
                        <br>
                        <button class="btn btn-primary btn-lg btn-block" type="submit">提交</button>
                    </div>
                </form>
            </div>
            <div class="row">
                <form class="needs-validation col-md-6 mb-3" action="../ReceptionServlet?opttype=search&by=rno" method="post"
                      role="form">
                    <div >
                        <label for="rno">按房间号查询客人信息</label>
                        <input type="text" class="form-control" id="rno" name="rno">
                        <div class="invalid-feedback">
                            需要有效的房间号
                        </div>
                        <br>
                        <button class="btn btn-primary btn-lg btn-block" type="submit">提交</button>
                    </div>
                </form>
                <form class="needs-validation col-md-6 mb-3" action="../ReceptionServlet?opttype=search&by=idcard" method="post"
                      role="form">
                    <div >
                        <label for="idSearchconsume">按身份证查询客人消费信息</label>
                        <input type="text" class="form-control" id="idSearchconsume" name="idcard">
                        <div class="invalid-feedback">
                            需要有效的家庭地址信息
                        </div>
                        <br>
                        <button class="btn btn-primary btn-lg btn-block" type="submit">提交</button>
                    </div>
                </form>
            </div>

            <div class="row">
                <div>
                    <a href="../ReceptionServlet?opttype=search&by=deadline">查询住宿时间到期的客人</a>
                </div>
            </div>

        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017-2018 xxx连锁酒店</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
</div>
</body>
</html>