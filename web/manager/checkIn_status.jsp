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
    <a class="navbar-brand" href="checkIn_rate.jsp">连锁酒店管理系统</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link" href="checkIn_rate.jsp">各个酒店入住率查询<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="InCome.jsp">各个酒店客房收入查询<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">各个酒店客房入住情况查询</a>
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
            <h4 class="mb-3">酒店入住情况查询</h4>
            <form class="needs-validation" action="../ManagerServlet?opttype=checkIn_status" method="post" role="form">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="hotelId">酒店Id号</label>
                        <input type="text" class="form-control" id="hotelId" name="hotelId" required>
                        <div class="invalid-feedback">
                            需要有效的酒店Id号
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="startTime">选择开始日期</label>
                        <input type="date" class="form-control" id="startTime" name="startTime" value=""
                               required>
                        <div class="invalid-feedback">
                            需要有效的时间
                        </div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="endTime">选择结束日期</label>
                        <input type="date" class="form-control" id="endTime" name="endTime" value=""
                               required>
                        <div class="invalid-feedback">
                            需要有效的时间
                        </div>
                    </div>
                </div>


                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">确认</button>
            </form>
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
