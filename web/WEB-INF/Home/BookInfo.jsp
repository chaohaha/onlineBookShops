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
        .center{
            text-align: center;
        }
    </style>
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
<div class="row thumbnail">
    <div class="col-sm-4">
            <img style="width: 100%; height: 500px; display: block;" src="${pageContext.request.contextPath}/upload/${book.book_image}"  data-holder-rendered="true">
            <div class="caption center">
                <h3>书名：${book.book_name}</h3>

                <p>作者：${book.book_author}</p>
                <p><a class="btn btn-primary btn-block" role="button" onclick="TAddCart(p=1)">
                    立即购买
                </a>
                    <input type="hidden" name="bookId"  value="${book.book_id}">
                    <a class="btn btn-default btn-block" role="button"  onclick="TAddCart(p=0)">加入购物车</a></p>
            </div>
    </div>
    <div class="col-sm-8">
        <div class="caption">
                <h3>图书介绍</h3>
                <p>${book.book_details}</p>

        </div>
        <div class="caption" style="margin-top: 200px">

            <p>书籍库存：${book.book_counts} 本</p>
            <p>书籍销量：${book.book_sales} 本</p>
            <h6>书籍单价：<i><font color="red">${book.book_price}</font></i> ￥</h6>
        </div>

    </div>

</div>

<!--footer-->
<div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div>
</body>
<script type="text/javascript">
    function TAddCart() {
        var id=$('[name="bookId"]').val();
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/TAddCart",
            data:{"id":id,"p":p},
            success:function (data) {
                console.log(data)
                if (data.code==333){
                    alert(data.msg)
                    location.href="${pageContext.request.contextPath}/allCart";
                }
                if (data.code==200){
                    alert(data.msg)
                    location.reload();
                }
                if(data.code==500){
                    alert(data.msg)
                    location.href="${pageContext.request.contextPath}/toLogin";
                }
                if (data.code==444){
                    alert(data.msg)
                    location.href="${pageContext.request.contextPath}/allCart";
                }
            }
        });
    }

</script>
</html>