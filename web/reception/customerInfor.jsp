<%--
  Created by IntelliJ IDEA.
  User: 20160
  Date: 2018/12/25
  Time: 19:09
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

    <script type="text/javascript">
        function reconfirm() {
            var Name = document.getElementById("Name").value;
            var idCard = document.getElementById("idCard").value;
            var age = document.getElementById("age").value;
            var addr = document.getElementById("addr").value;
            var workplace = document.getElementById("workplace").value;
            var comefrom = document.getElementById("comefrom").value;
            if (confirm("姓名:" + Name + " , 身份证号: " + idCard + " , 年龄: " +
                age + " , 家庭地址:" + addr + " , 工作单位:" + workplace + " , 来自地:" + comefrom)) {
                return true;
            } else {
                window.location.href = 'customerInfor.jsp';
                return false;
            }

        }
    </script>

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
            <li class="nav-item active">
                <a class="nav-link" href="#">客人信息录入<span class="sr-only">(current)</span></a>
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


<div class="container">

    <div class="row">

        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">客人信息填写</h4>
            <form class="needs-validation" action="../ReceptionServlet?opttype=customerInfor" method="post" role="form"
                  onsubmit="return reconfirm()">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="Name">姓名</label>
                        <input type="text" class="form-control" id="Name" value="" name="Name" required>
                        <div class="invalid-feedback">
                            需要有效的名字
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="idCard">身份证号</label>
                        <input type="text" class="form-control" id="idCard" placeholder="" value="" name="idCard"
                               required>
                        <div class="invalid-feedback">
                            需要有效的身份证号
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="age">年龄<span class="text-muted">(非必填项)</span></label>
                        <input type="text" class="form-control" id="age" name="age">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="addr">家庭住址<span class="text-muted">(非必填项)</span></label>
                        <input type="text" class="form-control" id="addr" name="addr">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="workplace">工作单位<span class="text-muted">(非必填项)</span></label>
                        <input type="text" class="form-control" id="workplace" name="workplace">
                    </div>
                </div>


                <div class="mb-3">
                    <label for="comefrom">来自地<span class="text-muted">(非必填项)</span></label>
                    <input type="text" class="form-control" id="comefrom" name="comefrom">
                </div>

                <div class="mb-3">
                    <label for="vip">是否是VIP</label>
                    <br>
                    <input type="radio" name="vip" value="0" checked>No
                    <input type="radio" name="vip" id="vip" value="1">Yes
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
