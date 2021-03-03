<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/3
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <table>
                <tr>
                    <th>订单编号：</th><td>123-131-4234-1314-131</td>
                </tr>
                <tr>
                    <th>订单状态：</th><td>未付款</td>
                </tr>
                <tr>
                    <th>收货人姓名：</th><td>侯龙超</td>
                </tr>
                <tr>
                    <th>收货人地址：</th><td>内蒙古科技大学</td>
                </tr>
                <tr>
                    <th>收货人电话：</th><td>12345678901</td>
                </tr>
            </table>
        </div>
        <div class="col-sm-12">
            <table class="table table-striped table-condensed">
                <tr>
                    <th>书名</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <tr>
                    <td>书名</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>小计</td>
                </tr>
                <tr>
                    <td>书名</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>小计</td>
                </tr>
                <tr>
                    <td>书名</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>小计</td>
                </tr>
                <tr></tr>
            </table>
        </div>

        <div class="col-sm-12 ">
            <table>
                <tr>
                    <th> </th><th></th> <th>商品总数：</th><td>12</td> <th>订单总价：</th><td><label><span class="text-danger">123.0元</span></label></td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
