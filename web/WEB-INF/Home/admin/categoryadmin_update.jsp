<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/3
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分类新增</title>
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
    <div class="row thumbnail">
        <div class="col-sm-12">
            <h3 class="text-center" style="margin-bottom: 30px">分类修改</h3>
        </div>
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <form class="form-horizontal caption" method="post" action="#">
                <input type="hidden" class="form-control" id="categoryid" name="categoryid" placeholder="分类名">
                <div class="form-group">
                    <label for="categoryname" class="col-sm-3 control-label">分类名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="categoryname" name="categoryname" placeholder="分类名">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="submit" class="btn btn-success btn-block">修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
