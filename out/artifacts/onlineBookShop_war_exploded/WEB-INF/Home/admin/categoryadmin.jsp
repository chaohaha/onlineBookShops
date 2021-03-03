<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/3
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍分类管理</title>
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
                <h3 class="text-center" style="margin-bottom: 30px">书籍分类管理</h3>
            </div>
            <div class="col-sm-12 thumbnail">
                <div class="col-sm-4 line-center">分类编号</div>
                <div class="col-sm-4 line-center">分类名</div>
                <div class="col-sm-4 line-center">操作</div>
            </div>
            <div class="list-group">
                <div class="col-sm-12  list-group-item" >
                    <div class="col-sm-4 line-center" onclick="myClick(1)">分类编号</div>
                    <div class="col-sm-4 line-center">分类名</div>
                    <div class="col-sm-4 line-center">
                        <button class="btn btn-danger" style="padding: 5px 5px;">新增</button>
                        <button class="btn btn-danger" style="padding: 5px 5px;">删除</button>
                        <button class="btn btn-danger" style="padding: 5px 5px;">修改</button>
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
