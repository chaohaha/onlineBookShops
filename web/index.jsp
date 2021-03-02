<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Flat-UI-master/dist/css/flat-ui.min.css"/>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <title></title>
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
<!-- Static navbar -->
<%--<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">这什么东西</span>
            </button>
            <a class="navbar-brand" href="index.jsp">图书商城</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">首页</a></li>
                <li><a href="order/allUserOrder">我的订单</a></li>
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
<jsp:include page="WEB-INF/Home/head.jsp"></jsp:include>
<!--content-->
<div class="container">
    <div class="jumbotron">
        <h1>图书商城</h1>
        <p>...</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">了解更多</a></p>
    </div>

    <ul class="nav nav-tabs" id="myTabs">
        <li class="active"><a href="#" >计算机</a></li>
        <li><a href="#">都市言情</a></li>
        <li><a href="#">军事科技</a></li>
        <li><a href="#">历史人文</a></li>
        <li><a href="#">都市言情</a></li>
        <li><a href="#">军事科技</a></li>
        <li><a href="#">历史人文</a></li>
    </ul>
    <div class="row">
        <div class="col-sm-4 col-md-3">
            <div class="thumbnail" >
                <a href="BookInfo.jsp">
                    <img style="width: 100%; height: 200px; display: block;" alt="100%x200" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-src="holder.js/100%x200" data-holder-rendered="true">
                </a>
                <div class="caption center">
                    <h3>书名</h3>
                    <p><span>价格:</span><span>100.00</span></p>
                    <p><a class="btn btn-primary btn-block" role="button" href="${pageContext.request.contextPath}/BookInfo">查看详情</a></p>
                </div>
            </div>
        </div>
        <div class="col-sm-4 col-md-3">
        <div class="thumbnail" >
            <a href="BookInfo.jsp">
                <img style="width: 100%; height: 200px; display: block;" alt="100%x200" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-src="holder.js/100%x200" data-holder-rendered="true">
            </a>
            <div class="caption center">
                <h3>书名</h3>
                <p><span>价格:</span><span>100.00</span></p>
                <p><a class="btn btn-primary btn-block" role="button" href="#">查看详情</a></p>
            </div>
        </div>
    </div>
        <div class="col-sm-4 col-md-3">
            <div class="thumbnail" >
                <a href="BookInfo.jsp">
                    <img style="width: 100%; height: 200px; display: block;" alt="100%x200" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-src="holder.js/100%x200" data-holder-rendered="true">
                </a>
                <div class="caption center">
                    <h3>书名</h3>
                    <p><span>价格:</span><span>100.00</span></p>
                    <p><a class="btn btn-primary btn-block" role="button" href="#">查看详情</a></p>
                </div>
            </div>
        </div>
        <div class="col-sm-4 col-md-3">
            <div class="thumbnail" >
                <a href="BookInfo.jsp">
                    <img style="width: 100%; height: 200px; display: block;" alt="100%x200" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-src="holder.js/100%x200" data-holder-rendered="true">
                </a>
                <div class="caption center">
                    <h3>书名</h3>
                    <p><span>价格:</span><span>100.00</span></p>
                    <p><a class="btn btn-primary btn-block" role="button" href="#">查看详情</a></p>
                </div>
            </div>
        </div>
        <div class="col-sm-4 col-md-3">
        <div class="thumbnail" >
            <a href="BookInfo.jsp">
                <img style="width: 100%; height: 200px; display: block;" alt="100%x200" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-src="holder.js/100%x200" data-holder-rendered="true">
            </a>
            <div class="caption center">
                <h3>书名</h3>
                <p><span>价格:</span><span>100.00</span></p>
                <p><a class="btn btn-primary btn-block" role="button" href="#">查看详情</a></p>
            </div>
        </div>
    </div>
        <div class="col-sm-4 col-md-3">
        <div class="thumbnail" >
            <a href="BookInfo.jsp">
                <img style="width: 100%; height: 200px; display: block;" alt="100%x200" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-src="holder.js/100%x200" data-holder-rendered="true">
            </a>
            <div class="caption center">
                <h3>书名</h3>
                <p><span>价格:</span><span>100.00</span></p>
                <p><a class="btn btn-primary btn-block" role="button" href="#">查看详情</a></p>
            </div>
        </div>
    </div>
    </div>


    <nav class="center">
        <ul class="pagination  pagination-lg">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">首页</span>
                </a>
            </li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">末页</span>
                </a>
            </li>
        </ul>
    </nav>

</div>

<!--footer-->
<div class="navbar navbar-default navbar-static-bottom">
版权声明区
</div>
</body>
</html>