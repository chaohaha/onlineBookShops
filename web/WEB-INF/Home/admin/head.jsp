<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/2
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台头部</title>
</head>
<body>
<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">这什么东西</span>
            </button>
            <a class="navbar-brand">图书商城管理</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/bookAll">书籍管理</a></li>
                <li><a href="${pageContext.request.contextPath}/orderAll">订单管理</a></li>
                <li><a href="${pageContext.request.contextPath}/category/categoryAll">书籍分类管理</a></li>
                <li><a href="${pageContext.request.contextPath}/userAdmin">管理用户</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="${pageContext.request.contextPath}/adminLogout">注销</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
</body>
</html>
