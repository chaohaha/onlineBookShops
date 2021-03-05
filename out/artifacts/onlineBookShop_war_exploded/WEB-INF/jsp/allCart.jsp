<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>购物车列表</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allGoods">返回</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/order/toAddOrder">结算购物车</a>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书名</th>
                    <th>数量</th>
                    <th>单价</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="cart" items="${requestScope.get('list')}">
                    <tr>
                        <td>${cart.getBook_id()}</td>
                        <td>${cart.getBook_name()}</td>
                        <td>${cart.getCart_counts()}</td>
                        <td>${cart.getCart_price()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/cart/plusCart?cart_id=${cart.getCart_id()}">+</a> |
                            <a href="${pageContext.request.contextPath}/cart/minusCart?cart_id=${cart.getCart_id()}">-</a> |
                            <a href="${pageContext.request.contextPath}/cart/delAll/${cart.getUser_id()}">清空购物车</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>
</div>
</body>
</html>
