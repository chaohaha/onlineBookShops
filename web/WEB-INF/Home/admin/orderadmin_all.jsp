<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/3
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Flat-UI-master/dist/css/flat-ui.min.css"/>
    <script src="${pageContext.request.contextPath}/Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <title></title>
    <style>
        .row{
            margin-left: 20px;
            margin-right: 20px;;
        }
        .line-center{
            line-height:50px;
            text-align: center;
        }
        .row input{
            width: 50px;
        }
        .list-group-item:hover{
            background: #27ae60;

        }
        .list-group-item div:first-child:hover{

            cursor: pointer;
        }
        th{
            text-align: right;
            width: 200px;;
        }
        td{
            text-align: left;
            padding: 10px;
        }
        .table th{
            text-align: center;
        }
        .table td{
            text-align: center;
        }
    </style>
    <script>
        function myClick(n){
            location.href = "OrderInfo.html";
        }
        function btnClick(){
            alert("btn");
            return false;
        }
        $(function(){

        })
    </script>
</head>
<body>
<jsp:include page="head.jsp"/>
<!--content-->
<div class="container">
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h3 class="text-center" style="margin-bottom: 30px">订单详情</h3>
        </div>

        <div class="col-sm-12 ">
            <div class="col-sm-3"></div>
            <table>
                <tr>
                    <th>订单编号：</th><td>${orders.order_id}</td>
                </tr>
                <tr>
                    <th>订单状态：</th><td>
                    <c:if test="${orders.order_status==0}">
                        未发货
                    </c:if>
                    <c:if test="${orders.order_status==1}">
                        已发货
                    </c:if>
                    <c:if test="${orders.order_status==2}">
                        已确认收货
                    </c:if>
                </td>
                </tr>
                <tr>
                    <th>收货人姓名：</th><td>${orders.users.user_name}</td>
                </tr>
                <tr>
                    <th>收货人地址：</th><td>${orders.users.user_address}</td>
                </tr>
                <tr>
                    <th>收货人电话：</th><td>${orders.users.user_phone}</td>
                </tr>
                <tr>
                    <th>书名：</th><td>${orders.orderItems.book_name}</td>
                </tr>
                <tr>
                    <th>数量：</th><td>${orders.orderItems.orderItem_num}</td>
                </tr>
                <tr>
                    <th>小计：</th><td>${orders.orderItems.orderItem_price}</td>
                </tr>
                <tr>
                    <th></th><td></td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
