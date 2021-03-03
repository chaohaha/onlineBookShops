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
<jsp:include page="head.jsp"></jsp:include>
<!--content-->

<div class="container">
    <div class="jumbotron">
        <h1>图书商城</h1>
        <p>...</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">了解更多</a></p>
    </div>

    <ul class="nav nav-tabs" id="myTabs">
        <c:forEach items="${clist}" var="c">
            <li class="active"><a href="BookClass?category_id=${c.category_id}" >${c.category_name}</a></li>
        </c:forEach>

    </ul>
    <div class="row">
        <c:forEach  items="${list}" var="l">
        <div class="col-sm-4 col-md-3">
            <div class="thumbnail" >
                <a href="BookInfo?book_id=${l.book_id}">

                    <img style="width: 100%; height: 200px; display: block;" alt="100%x200" src="data:image/${l.book_image}" data-src="holder.js/100%x200" data-holder-rendered="true">
                </a>
                <div class="caption center">
                    <h3>${l.book_name}</h3>
                    <p><span>价格:</span><span>${l.book_price}</span></p>
                    <p><a class="btn btn-primary btn-block" role="button" href="${pageContext.request.contextPath}/BookInfo?book_id=${l.book_id}">查看详情</a></p>
                </div>
            </div>
        </div>
        </c:forEach>
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