<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/3
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单状态修改</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Flat-UI-master/dist/css/flat-ui.min.css"/>
    <script src="${pageContext.request.contextPath}/Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <style>
        .row{
            margin-top: 20px;;
        }
        .center{
            text-align: center;
        }
        .pagination{
            background: #cccccc;
        }
    </style>
    <script>
        $(function(){
            $('#myTabs a').click(function (e) {
                $(this).tab('show')
            });
        })
    </script>
</head>
<body>
<jsp:include page="head.jsp"/>
<!--content-->
<div class="container">
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h3 class="text-center" style="margin-bottom: 30px">订单状态修改</h3>
        </div>

        <div class="col-sm-12 ">
            <div class="col-lg-4"></div>
           <form action="${pageContext.request.contextPath}/orderUpdate" method="post">
               <table  border="0px">
                   <tr style="height: 50px">
                       <th>订单编号：</th><td style="width: 250px;text-align: center" >
                       <input type="hidden" name="order_id" value="${orders.order_id}">
                       ${orders.order_id}</td>
                   </tr>
                   <tr style="height: 50px">
                       <th>订单状态：</th>
                       <td>
                           <div class="col-lg-2"></div>
                           <div class="col-lg-8">
                               <select name="order_status" class="form-control">
                                   <c:if test="${orders.order_status==0}">
                                       <option value="0">未发货</option>
                                   </c:if>
                                   <c:if test="${orders.order_status==1}">
                                       <option value="1">已发货</option>
                                   </c:if>
                                   <c:if test="${orders.order_status==2}">
                                       <option value="2">确认收货</option>
                                   </c:if>
                                   <option value="0">未发货</option>
                                   <option value="1">已发货</option>
                                   <option value="2">确认收货</option>
                               </select>
                           </div>
                       </td>
                   </tr>
                   <tr style="height: 50px">
                       <th>收货人姓名：</th><td style="width: 250px;text-align: center">${orders.users.user_name}</td>
                   </tr>
                   <tr style="height: 50px">
                       <th>订单生成时间</th><td style="width: 250px;text-align: center">${orders.order_create_time}</td>
                   </tr>
                   <tr style="height: 50px">
                       <th></th>
                       <td>
                           <div class="col-lg-8">
                            <button type="submit" class="btn btn-success btn-block">修改</button>
                           </div>
                       </td>
                   </tr>
               </table>
           </form>
        </div>
        <div class="col-lg-12"></div>
    </div>
</div>
</body>
</html>
