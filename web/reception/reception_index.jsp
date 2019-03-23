<%--
  Created by IntelliJ IDEA.
  User: 20160
  Date: 2018/12/25
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

            <div class="row">
                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <a href="../ReceptionServlet?opttype=redirect&rTypeno=001">
                            <img class="card-img-top" src="../hotelPicture/roomtype_1.jpg" alt="Card image cap">
                        </a>
                        <div class="card-body">
                            <p class="card-text">
                                <a href="../ReceptionServlet?opttype=redirect&rTypeno=001">
                                    豪华海景家庭套房
                                </a>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">火爆</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <a href="../ReceptionServlet?opttype=redirect&rTypeno=002">
                            <img class="card-img-top" src="../hotelPicture/roomtype_2.jpg" alt="Card image cap">
                        </a>
                        <div class="card-body">
                            <p class="card-text">
                                <a href="../ReceptionServlet?opttype=redirect&rTypeno=002">
                                    高级海景家庭套房
                                </a>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">火爆</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <a href="../ReceptionServlet?opttype=redirect&rTypeno=003">
                            <img class="card-img-top" src="../hotelPicture/roomtype_3.jpg" alt="Card image cap">
                        </a>
                        <div class="card-body">
                            <p class="card-text">
                                <a href="../ReceptionServlet?opttype=redirect&rTypeno=003">
                                    豪华海滩别墅
                                </a>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">火爆</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <a href="../ReceptionServlet?opttype=redirect&rTypeno=004">
                            <img class="card-img-top" src="../hotelPicture/roomtype_4.jpg" alt="Card image cap">
                        </a>
                        <div class="card-body">
                            <p class="card-text">
                                <a href="../ReceptionServlet?opttype=redirect&rTypeno=004">
                                    池畔房
                                </a>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">火爆</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <a href="../ReceptionServlet?opttype=redirect&rTypeno=005">
                            <img class="card-img-top" src="../hotelPicture/roomtype_5.jpg" alt="Card image cap">
                        </a>

                        <div class="card-body">
                            <p class="card-text">
                                <a href="../ReceptionServlet?opttype=redirect&rTypeno=005">
                                    豪华房
                                </a>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">火爆</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <a href="../ReceptionServlet?opttype=redirect&rTypeno=006">
                            <img class="card-img-top" src="../hotelPicture/roomtype_6.jpg" alt="Card image cap">
                        </a>
                        <div class="card-body">
                            <p class="card-text">
                                <a href="../ReceptionServlet?opttype=redirect&rTypeno=006">景观房</a>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">火爆</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <a href="../ReceptionServlet?opttype=redirect&rTypeno=007"><img class="card-img-top"
                                                                                        src="../hotelPicture/roomtype_7.jpg"
                                                                                        alt="Card image cap"></a>

                        <div class="card-body">
                            <p class="card-text">
                                <a href="../ReceptionServlet?opttype=redirect&rTypeno=007">豪华景观房</a>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">火爆</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <a href="../ReceptionServlet?opttype=redirect&rTypeno=008"> <img class="card-img-top"
                                                                                         src="../hotelPicture/roomtype_8.jpg"
                                                                                         alt="Card image cap"></a>
                        <div class="card-body">
                            <p class="card-text">
                                <a href="../ReceptionServlet?opttype=redirect&rTypeno=008">豪华海景房</a>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">火爆</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <a href="../ReceptionServlet?opttype=redirect&rTypeno=009"><img class="card-img-top"
                                                                                        src="../hotelPicture/roomtype_9.jpg"
                                                                                        alt="Card image cap"></a>

                        <div class="card-body">
                            <p class="card-text"><a href="../ReceptionServlet?opttype=redirect&rTypeno=009">全海景房</a></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">火爆</small>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</main>
</body>
</html>

