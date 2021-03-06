<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表</title>
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
                    <small>我的订单</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/cart/allCart">返回</a>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>下单时间</th>
                    <th>订单状态</th>
                    <th>订单总价</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="order" items="${requestScope.get('list')}">
                    <tr>
                        <td>${order.getOrder_create_time()}</td>
                        <td>${order.getOrder_status()==0?'未发货':'已发货'}</td>
                        <td>${cart.getOrder_totalPrice()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/orderItem/allOrderItem?order_id=${order.getOrder_id()}">详情</a> |
                            <a href="${pageContext.request.contextPath}/cart/minusCart?order_id=${order.getOrder_id()}">撤销</a>
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
