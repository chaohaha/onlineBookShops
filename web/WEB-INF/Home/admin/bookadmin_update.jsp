<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/2
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍修改</title>
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
</head>
<body>
<jsp:include page="head.jsp"/>\

<!--content-->
<div class="container">
    <div class="row thumbnail">
        <div class="col-sm-12">
            <h3 class="text-center" style="margin-bottom: 30px">书籍修改</h3>
        </div>
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <form class="form-horizontal caption" method="post" id="fromOne">
                <input type="hidden" value="${books.book_id}" name="book_id" />
                <div class="form-group">
                    <label for="book_name" class="col-sm-3 control-label">书籍名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" value="${books.book_name}" id="book_name" name="book_name" placeholder="书籍名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="book_author" class="col-sm-3 control-label">作者</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" value="${books.book_author}" id="book_author" name="book_author" placeholder="作者">
                    </div>
                </div>
                <div class="form-group">
                    <label for="category_id" class="col-sm-3 control-label">分类</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="category_id" id="sel" >
                            <option value="${books.category_id}">${books.category.category_name}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book_price" class="col-sm-3 control-label">单价</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" value="${books.book_price}" id="book_price" name="book_price" placeholder="单价">
                    </div>

                </div>
                <div class="form-group">
                    <label for="book_counts" class="col-sm-3 control-label">库存</label>
                    <div class="col-sm-8">
                        <input type="tel" class="form-control" value="${books.book_counts}" id="book_counts" name="book_counts" placeholder="库存">
                    </div>
                </div>
                <div class="form-group">
                    <label for="book_image" class="col-sm-3 control-label">图片</label>
                    <div class="col-sm-8">
                        <input type="file" class="form-control" id="book_image" name="book_image" placeholder="上传图片">
                    </div>
                </div>
                <div class="form-group">
                    <label for="book_details" class="col-sm-3 control-label">书籍详情</label>
                    <div class="col-sm-8">
                        <textarea name="book_details"  rows="" cols="" class="form-control">${books.book_details}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="button" class="btn btn-success btn-block">修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script>
    $(function() {
        $('#myTabs a').click(function (e) {
            $(this).tab('show')
        })

        $('#sel').change(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/category/categoryAllAjax",
                success:function (data) {
                    $('#sel').empty();
                    var str='';
                    for(var i=0;i<data.length;i++){
                        str+="<option value="+data[i].category_id+">"+data[i].category_name+"</option>";
                    }
                    $('#sel').append(str);
                }
            })
        })
    })

</script>
</html>
