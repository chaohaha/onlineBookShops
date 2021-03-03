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
            <a class="navbar-brand" href="Index.jsp">图书商城管理</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="Index.jsp">返回首页</a></li>
                <li><a href="bookadmin.html">书籍管理</a></li>
                <li><a href="UserInfo.jsp">订单管理</a></li>
                <li><a href="FriendLink.jsp">书籍分类管理</a></li>
                <li><a href="#">管理用户</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="Login.jsp">账号显示</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
</body>
</html>
