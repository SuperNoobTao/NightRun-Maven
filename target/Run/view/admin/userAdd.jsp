<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zxy
  Date: 6/3/2016
  Time: 8:26 PM
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
    <meta name="HandheldFriendly" content="True"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- Buttons 库的核心文件 -->
    <link rel="stylesheet" href="/css/buttons.css">
    <!-- 当需要使用带下拉菜单的按钮时才需要加载下面的 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript" src="/js/buttons.js"></script>
    <!-- 只有使用字体图标时才需要加载 Font-Awesome -->
    <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="../../js/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="../../js/userAdd.js" type="text/javascript"></script>
</head>
<body>
<%@include file="head.jsp"%>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <form action="/view/admin/add" method="post" class="form-horizontal">
                <fieldset>
                    <legend>添加学生</legend>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 control-label" for="no">学号&nbsp;&nbsp;</label>
                        <div class="input-group">
                            <input class="form-control" type="text" id="no" value="" name="no" onchange="check()"/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 control-label" for="name">姓名&nbsp;&nbsp;</label>
                        <div class="input-group">
                            <input class="form-control" type="text" id="name" value="" name="name" onchange="check()"/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <button type="submit" class="btn btn-primary disabled" id="submit">确定</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>
</body>
</html>
