<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- Static navbar -->
<%--<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">这什么东西</span>
            </button>
            <a class="navbar-brand" href="Index.jsp">图书商城</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="Index.jsp">首页</a></li>
                <li><a href="Order.jsp">我的订单</a></li>
                <li><a href="UserInfo.jsp">个人中心</a></li>
                <li><a href="FriendLink.jsp">友情链接</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="Login.jsp">登录</a></li>
                <li><a href="Register.jsp">注册</a></li>
                <li>
                    <a href="Cart.jsp"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>--%>
<jsp:include page="head.jsp"></jsp:include>
<!--content-->
<div class="container">
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">订单详情</h1>
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

            <!--<div class="list-group">-->
                <!--<div class="col-sm-12  list-group-item" >-->
                    <!--<div class="col-sm-4 line-center">-->
                        <!--书名-->
                    <!--</div>-->
                    <!--<div class="col-sm-3 line-center">单价</div>-->
                    <!--<div class="col-sm-2 line-center">数量 </div>-->
                    <!--<div class="col-sm-3 line-center">小计</div>-->
                <!--</div>-->
                <!--<div class="col-sm-12  list-group-item" >-->
                    <!--<div class="col-sm-4 line-center">-->
                        <!--书名-->
                    <!--</div>-->
                    <!--<div class="col-sm-3 line-center">单价</div>-->
                    <!--<div class="col-sm-2 line-center">数量 </div>-->
                    <!--<div class="col-sm-3 line-center">小计</div>-->
                <!--</div>-->
                <!--<div class="col-sm-12  list-group-item" >-->
                    <!--<div class="col-sm-4 line-center">-->
                        <!--书名-->
                    <!--</div>-->
                    <!--<div class="col-sm-3 line-center">单价</div>-->
                    <!--<div class="col-sm-2 line-center">数量 </div>-->
                    <!--<div class="col-sm-3 line-center">小计</div>-->
                <!--</div>-->

            <!--</div>-->
        </div>

        <div class="col-sm-12 ">
            <table>
                <tr>
                   <th> </th><th></th> <th>商品总数：</th><td>12</td> <th>订单总价：</th><td><span class="text-danger">123.0元</span></label></td>
                </tr>
            </table>
        </div>
    </div>
    <div></div>
    <div class="col-sm-offset-7 col-sm-5" style="padding: 30px;">
        <div class="col-sm-6 btn btn-success btn-block">继续购物</div>
        <div class="col-sm-6  btn btn-success btn-block">提交订单</div>
    </div>
</div>


</body>
</html>