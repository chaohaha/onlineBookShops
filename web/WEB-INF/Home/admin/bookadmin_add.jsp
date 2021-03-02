<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/2
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍添加</title>
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
            <h3 class="text-center" style="margin-bottom: 30px">书籍添加</h3>
        </div>
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <form class="form-horizontal caption">
                <div class="form-group">
                    <label for="bookname" class="col-sm-3 control-label">书籍名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="bookname" name="bookname" placeholder="书籍名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="bookauthor" class="col-sm-3 control-label">作者</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="bookauthor" name="bookauthor" placeholder="作者">
                    </div>
                </div>
                <div class="form-group">
                    <label for="categoryid" class="col-sm-3 control-label">分类</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="categoryid">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="bookprice" class="col-sm-3 control-label">单价</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="bookprice" name="bookprice" placeholder="单价">
                    </div>

                </div>
                <div class="form-group">
                    <label for="bookcounts" class="col-sm-3 control-label">库存</label>
                    <div class="col-sm-8">
                        <input type="tel" class="form-control" id="bookcounts" name="bookcounts" placeholder="库存">
                    </div>
                </div>
                <div class="form-group">
                    <label for="bookimage" class="col-sm-3 control-label">图片</label>
                    <div class="col-sm-8">
                        <input type="file" class="form-control" id="bookimage" name="bookimage" placeholder="上传图片">
                    </div>
                </div>
                <div class="form-group">
                    <label for="bookdetails" class="col-sm-3 control-label">书籍详情</label>
                    <div class="col-sm-8">
                        <textarea name="bookdetails" rows="" cols="" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="submit" class="btn btn-success btn-block">添加</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
