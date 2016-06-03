<%--
  Created by IntelliJ IDEA.
  User: zxy
  Date: 5/28/2016
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>城院夜跑系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-2.2.4.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../../js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="../../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script src="../../js/select.js" type="text/javascript"></script>
    <script src="../../js/search.js" type="text/javascript"></script>
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
                <li class="active"><a href="/view/admin/main">首页</a></li>
                <li><a href="#run">夜跑管理</a></li>
                <li><a href="/view/admin/users">用户管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/view/admin/admin"> ${beanadminEntity.aname}</a></li>
                <li><a href="<c:url value="/view/admin/signout"/>">退出登录</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="btn-toolbar" role="toolbar">
    <div class="btn-group btn-group-sm">
        <input id="stime" size="16" type="text" value="" readonly class="form_date" onchange="timeChange()" placeholder = "起始时间">
        <input id="etime" size="16" type="text" value="" readonly class="form_date" onchange="timeChange()" placeholder = "终止时间">
    </div>
    <div class="btn-group btn-group-sm">
        <button id="time" type="button" onclick="timeQuery()" class="btn btn-primary disabled">查询</button>
    </div>
    <script type="text/javascript">
        $(".form_date").datetimepicker({
            format: 'yyyy-mm-dd',
            minView: "month",
            todayBtn: true,
            autoclose: true,
            todayHighlight: true
        });
    </script>
    <div class="btn-group btn-group-sm" role="group">
        <input type="text" class="form-control" placeholder="请输入学号或姓名" id="ksearch"
               onkeydown="if(event.keyCode == 13) fuzzyQuery()">
    </div>
</div>
<div class="html-editor-align-center">
    <table class="table table-striped" id="runtable">
        <thead>
        <tr>
            <th>#</th>
            <th>学号</th>
            <th>姓名</th>
            <th>跑步用时</th>
            <th>跑步时间(开始时间)</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${runSearchResult}" var="result" varStatus="status">
            <c:if test="${runSearchResult != null}">
                <tr>
                    <td>${status.count}</td>
                    <td>${result.sno}</td>
                    <td>${result.sname}</td>
                    <td>
                        <fmt:formatNumber type="number" value="${(result.time-result.time%60)/60}"
                                          maxFractionDigits="0"/>分
                        <fmt:formatNumber type="number" value="${result.time%60}" minIntegerDigits="2"/>秒
                    </td>
                    <td>${result.starttime}</td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
