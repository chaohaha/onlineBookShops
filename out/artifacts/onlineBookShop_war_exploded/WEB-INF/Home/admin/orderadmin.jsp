<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/3
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理</title>
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
    <div class="jumbotron" style=" text-align: center;">
        <div class="row thumbnail center">
            <div class="col-sm-12">
                <h3 class="text-center" style="margin-bottom: 30px">订单管理</h3>
            </div>
            <div class="col-sm-12" style="margin-bottom: 10px">
                <form action="#" method="post">
                    <div class="col-lg-6">
                        <input type="text" class="form-control" id="" name="" placeholder="订单编号、用户编号、订单转态其中一个来查询">
                    </div>
                    <div class="col-lg-1">
                        <button class="btn btn-success">查询</button>
                    </div>
                </form>
            </div>
            <div class="col-sm-12 thumbnail">
                <div class="col-sm-3 line-center" style="width: 125px;">订单编号</div>
                <div class="col-sm-2 line-center" style="width: 125px;">用户编号</div>
                <div class="col-sm-2 line-center" style="width: 125px;">生成时间</div>
                <div class="col-sm-2 line-center" style="width: 125px;">收货时间</div>
                <div class="col-sm-2 line-center" style="width: 125px;">总价</div>
                <div class="col-sm-2 line-center" style="width: 125px;">状态</div>
                <div class="col-sm-2 line-center" style="width: 125px;">备注</div>
                <div class="col-sm-3 line-center" style="width: 125px;">操作</div>
            </div>
            <div class="list-group">
                <div class="col-sm-12  list-group-item" style="">
                    <div class="col-sm-3 line-center" onclick="myClick(1)" style="width: 125px;margin-left: -10px;">编号</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-3 line-center" style="width: 140px;">
                        <button class="btn btn-danger" style="padding: 5px 5px;">详情</button>
                        <button class="btn btn-danger" style="padding: 5px 5px;">删</button>
                        <button class="btn btn-danger" style="padding: 5px 5px;">改</button>
                    </div>
                </div>
            </div>
            <div class="list-group">
                <div class="col-sm-12  list-group-item" style="">
                    <div class="col-sm-3 line-center" onclick="myClick(1)" style="width: 125px;margin-left: -10px;">编号</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-2 line-center" style="width: 125px;">未付款</div>
                    <div class="col-sm-3 line-center" style="width: 140px;">
                        <button class="btn btn-danger" style="padding: 5px 5px;">详情</button>
                        <button class="btn btn-danger" style="padding: 5px 5px;">删</button>
                        <button class="btn btn-danger" style="padding: 5px 5px;">改</button>
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
    </div>
</div>
</body>
</html>