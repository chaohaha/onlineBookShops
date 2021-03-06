<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">

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
        .paofu{
            display: none;
            position: fixed;
            background: rgb(238,238,238);
            width: 500px;
            height: 400px;
            z-index: 1;
            top: 50%;
            margin-top: -200px;
            left: 50%;
            margin-left: -250px;
            border-radius:20px ;
            text-align: center;
            line-height: 320%;
            font-size: 20px;
        }
    </style>
    <%--<script>
        function myClick(n){
           location.href = "OrderInfo.jsp";
        }
        function btnClick(){
            alert("btn");
            return false;
        }
        $(function(){

        })
    </script>--%>
</head>
<body>
<!-- Static navbar -->

<jsp:include page="head.jsp"></jsp:include>
<!--content-->
<div class="container">
    <div class="row thumbnail center">
        <div class="col-sm-12">

            <h1 class="text-center" style="margin-bottom: 30px">我的订单</h1>
        </div>
        <div class="col-sm-12 thumbnail">
            <div class="col-sm-3 line-center">订单编号<font color="#778899" size="1px">长按订单编号显示详情</font></div>
            <div class="col-sm-2 line-center">订单状态</div>
            <div class="col-sm-2 line-center">商品创建时间 </div>
            <div class="col-sm-2 line-center">订单总价</div>
            <div class="col-sm-3 line-center">操作</div>
        </div>

        <div class="list-group">

        <c:forEach items="${list}" var="l">
            <div class="col-sm-12  list-group-item" >
                <div class="col-sm-3 line-center clickid">${l.order_id}</div>
                <c:if test="${l.order_status == 0}">
                    <div class="col-sm-2 line-center">未发货</div>
                </c:if>
                <c:if test="${l.order_status == 4}">
                    <div class="col-sm-2 line-center">未付款</div>
                </c:if>
                <c:if test="${l.order_status == 1}">
                    <div class="col-sm-2 line-center">已发货</div>
                </c:if>
                <c:if test="${l.order_status == 2}">
                    <div class="col-sm-2 line-center">用户已确认收货</div>
                </c:if>
                <div class="col-sm-2 line-center">${l.order_create_time} </div>
                <div class="col-sm-2 line-center">${l.order_totalPrice}</div>
                <div class="col-sm-3 line-center">

                    <c:if test="${l.order_status == 2 || l.order_status == 4}">
                        <a href="${pageContext.request.contextPath}/deleteOrderByOrderId?orderId=${l.order_id}">
                            <button class="btn btn-danger" onclick="return confirm('确定删除?');">删除订单</button>
                        </a>
                    </c:if>
                    <c:if test="${l.order_status != 2 && l.order_status != 4}">
                        <button class="btn btn-danger" onclick="deleteOrder(p=3)">
                            删除订单
                        </button>
                    </c:if>
                    <c:if test="${l.order_status == 0 }" >
                        <button class="btn btn-success" onclick="deleteOrder(p=0)">提醒发货</button>
                    </c:if>
                    <c:if test="${l.order_status == 4 }" >
                        <input type="hidden" value="${l.order_totalPrice}" id="orderTotalPrice">
                        <a href="${pageContext.request.contextPath}/toPay1?sumMoney=${l.order_totalPrice}&id=${l.order_id}" onclick="return confirm('确定支付?')">
                            <button class="btn btn-success" >立即支付</button>
                        </a>
                    </c:if>
                    <c:if test="${l.order_status == 1 }" >
                        <input type="hidden" value="${l.order_id}" id="orderIds">

                        <button class="btn btn-success" onclick="deleteOrder(p=2)">确认收货</button>
                    </c:if>
                    <c:if test="${l.order_status == 2}">
                        <button class="btn btn-success">交易已完成</button>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="paofu" >

</div>
<!--footer-->

</body>
<script>
    function deleteOrder() {
        if (p==3){
            alert("用户未确认收货，该订单不可删除！")
        }
        if (p==0){
            alert("提醒发货成功！")
        }
        if (p==2){
            var orderId = $('#orderIds').val()
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/updateOrderComplete",
                data:{"orderId":orderId},
                success:function (data) {
                    alert("收货成功！");
                    location.reload();
                },error:function () {
                    alert("凑了")
                }
            })
        }
        /*if (p==4){
            var orderId = $('#orderIds').val()
            var orderTotalPrice  = $('#orderTotalPrice').val();
            alert(orderTotalPrice)
            location.href="${pageContext.request.contextPath}/toPay1?sumMoney="+orderTotalPrice+"&id="+orderId;

        }*/


    }
    // function myClick(obj){
    //     alert("xxx")
    //     alert(obj)
    //     location.href = "OrderInfo.html";
    // }

    $('.clickid').each(function () {
        $(this).mousedown(function () {
            $('.paofu').css("display","block");
            var order_id = $(this).text();
            $.ajax({
                type:"post",
                data:{"order_id":order_id},
                url:"${pageContext.request.contextPath}/orderItemById",
                success:function (data) {
                    var str="";
                    $('.paofu:first').empty();
                    if (data.code == 200){
                        str="<h3>订单详情</h3>详情id："+data.data.orderItem_id+"<br/>数目："+data.data.orderItem_num+"<br/>" +
                            "书名："+data.data.book_name+"<br/>总价："+data.data.orderItem_price;
                    }
                    $('.paofu').append(str);
                }
            })
        })
        $(this).mouseup(function () {
            $('.paofu').css("display","none");

        })
    })

</script>
</html>