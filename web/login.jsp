<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>连锁酒店管理系统</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/cover.css" rel="stylesheet">
</head>

<body class="text-center">

<div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">
        <div class="inner">
            <h3 class="masthead-brand" style="padding-top: 30px;">连锁酒店管理系统</h3>
        </div>
    </header>
    <main role="main" class="inner cover">
        <form action="LoginServlet" method="post" role="form">
            <div>
                <input type="text" placeholder="请输入账号" name="account" class="form-control" required>
                <br>
                <input type="password" placeholder="请输入密码" name="password" class="form-control" required/>
                <br>
                <select name="hotelId" class="form-control" required>
                    <option value="001">上海总店</option>
                    <option value="002">北京分店</option>
                    <option value="003">广州分店</option>
                    <option value="004">香港分店</option>
                </select>
                <br>
                <select name="user_type" class="form-control" required>
                    <option value="reception">前台服务人员</option>
                    <option value="manager">酒店经理</option>
                </select>
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="登录" class="btn btn-primary "/>
            </div>
        </form>
    </main>

    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a
                    href="https://twitter.com/mdo">@mdo</a>.</p>
        </div>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="../../../../assets/js/vendor/popper.min.js"></script>
<script src="../../../../dist/js/bootstrap.min.js"></script>
</body>
</html>

