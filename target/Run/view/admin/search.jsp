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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script type="text/javascript" src="../../js/jquery-2.2.4.min.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../../js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="../../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script src="../../js/search.js" type="text/javascript"></script>
</head>
<body>
<%@include file="head.jsp" %>
<div class="btn-toolbar right" role="toolbar">
    <div class="btn-group btn-group-sm">
        <input id="stime" size="16" type="text" value="" readonly class="form_date" onchange="timeChange()"
               placeholder="起始时间">
        <input id="etime" size="16" type="text" value="" readonly class="form_date" onchange="timeChange()"
               placeholder="终止时间">
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
</div>
</div>
<div class="html-editor-align-center" onload="searchtype()">
    <table class="table table-striped" id="runtable">
        <thead>
        <tr>
            <th>夜跑：${fn:length(runSearchResult)}条记录</th>
            <th>学号</th>
            <th>姓名</th>
            <th>跑步用时</th>
            <th>跑步时间(开始时间)</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${runSearchResult}" var="runResult" varStatus="status">
            <c:if test="${runSearchResult != null}">
                <tr>
                    <td>${status.count}</td>
                    <td>${runResult.sno}</td>
                    <td>${runResult.sname}</td>
                    <td>
                        <fmt:formatNumber type="number" value="${(runResult.time-runResult.time%60)/60}"
                                          maxFractionDigits="0"/>分
                        <fmt:formatNumber type="number" value="${runResult.time%60}" minIntegerDigits="2"/>秒
                    </td>
                    <td>${runResult.starttime}</td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <table class="table table-striped" id="usertable">
        <thead>
        <tr>
            <th>学生：${fn:length(viewJsAsEntities)}条记录</th>
            <th>学号</th>
            <th>姓名</th>
            <th>年级</th>
            <th>是否注销</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${viewJsAsEntities}" var="asResult" varStatus="status">
            <c:if test="${viewJsAsEntities != null}">
                <tr>
                    <td>${status.count}</td>
                    <td>${asResult.sno}</td>
                    <td>${asResult.sname}</td>
                    <td>${asResult.sgrade}</td>
                    <td><c:if test="${asResult.deltime == null}">否</c:if>
                        <c:if test="${asResult.deltime != null}">是</c:if>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <table class="table table-striped" id="totaltable">
        <thead>
        <tr>
            <th>统计：${fn:length(viewJsTotalEntities)}条记录</th>
            <th>学号</th>
            <th>姓名</th>
            <th>年级</th>
            <th>跑步次数</th>
            <th>跑步时长</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${viewJsTotalEntities}" var="totalResult" varStatus="status">
            <c:if test="${viewJsTotalEntities != null}">
                <tr>
                    <td>${status.count}</td>
                    <td>${totalResult.sno}</td>
                    <td>${totalResult.sname}</td>
                    <td>${totalResult.sgrade}</td>
                    <td>${totalResult.count}</td>
                    <td>
                        <fmt:formatNumber type="number" value="${(totalResult.sumtime-totalResult.sumtime%60)/60}"
                                          maxFractionDigits="0"/>分
                        <fmt:formatNumber type="number" value="${totalResult.sumtime%60}" minIntegerDigits="2"/>秒
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
