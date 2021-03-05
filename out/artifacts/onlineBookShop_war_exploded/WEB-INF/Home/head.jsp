<%--
  Created by IntelliJ IDEA.
  User: Crazy
  Date: 2021/3/2
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">这什么东西</span>
            </button>
            <a class="navbar-brand" href="Index">图书商城</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="Index">首页</a></li>
                <li><a href="allUserOrder">我的订单</a></li>
                <li><a href="UserInfo">个人中心</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <c:if test="${empty user}">
                    <li><a href="toLogin">登录</a></li>
                    <li><a href="toRegister">注册</a></li>
                </c:if>
                <c:if test="${!empty user}">
                    <li><div style="margin-top: 3px"><a href="#"><img style="border-radius: 180px ;width: 50px;height: 45px;" src="${pageContext.request.contextPath}/upload/${photo}"></a></div></li>
                    <li><a href="#" style="text-decoration: underline" >${user.user_name},已登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">注销</a></li>
                </c:if>
                <li>
                    <a href="allCart"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
</body>
</html>
