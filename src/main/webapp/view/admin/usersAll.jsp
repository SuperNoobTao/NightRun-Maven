<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zxy
  Date: 5/14/2016
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>城院夜跑系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="../../js/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="../../js/select.js" type="text/javascript"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="">管理员端</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/view/admin/main">首页</a></li>
                <li><a href="#run">夜跑管理</a></li>
                <li class="active"><a href="/view/admin/users">用户管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/view/admin/admin"> ${beanadminEntity.aname}</a></li>
                <li><a href="<c:url value="/view/admin/signout"/>">退出登录</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="btn-toolbar" role="toolbar">
    <div class="btn-group btn-group-sm" role="group">
        <a href="<c:url value="/view/admin/users"/>" class="btn btn-primary btn-lg active" role="button">隐藏注销学生</a>
    </div>
</div>

<div class="html-editor-align-center">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>学号</th>
            <th>姓名</th>
            <th>年级</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${viewJsAsEntities}" var="viewJsAsEntity" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${viewJsAsEntity.sno}</td>
                <td>${viewJsAsEntity.sname}</td>
                <td>${viewJsAsEntity.sgrade}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
