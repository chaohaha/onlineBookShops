<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/2
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <form class="form-horizontal caption" id="formOne">
                <div class="form-group">
                    <label for="book_name" class="col-sm-3 control-label">书籍名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="book_name" name="book_name" placeholder="书籍名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="book_author" class="col-sm-3 control-label">作者</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="book_author" name="book_author" placeholder="作者">
                    </div>
                </div>
                <div class="form-group">
                    <label for="category_id" class="col-sm-3 control-label">分类</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="category_id">
                            <c:forEach items="${categoryList}" var="c">
                                <option value="${c.category_id}">${c.category_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book_price" class="col-sm-3 control-label">单价</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="book_price" name="book_price" placeholder="单价">
                    </div>

                </div>
                <div class="form-group">
                    <label for="book_counts" class="col-sm-3 control-label">库存</label>
                    <div class="col-sm-8">
                        <input type="tel" class="form-control" id="book_counts" name="book_counts" placeholder="库存">
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
                        <textarea name="book_details" rows="" cols="" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="button" class="btn btn-success btn-block">添加</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script>

        $('#myTabs a').click(function (e) {
            $(this).tab('show')
        });

        $('[type="button"]').click(function () {
            var book_name=$('[name="book_name"]').val();
            var book_author=$('[name="book_author"]').val();
            var category_id=$('[name="category_id"]').val();
            var book_price=$('[name="book_price"]').val();
            var book_counts=$('[name="book_counts"]').val();
            var book_details=$('[name="book_details"]').val();
            var book_image=$('[name="book_image"]').val();
            if(book_name==' '||book_author==''||book_counts==''||category_id==''||book_price==''||book_details==''||book_image==''){
                alert("请完善信息！");
                return false;
            }
            var form=document.getElementById("formOne");
            console.log(form)
            var formdata = new FormData(form);//表单id
            $.ajax({
                url: "${pageContext.request.contextPath}/bookAdd",
                type:"post",
                data:formdata,
                cache: false,
                dataType:'json',
                contentType: false, //不设置内容类型
                processData: false, //不处理数据
                async : false,
                success: function (data) {
                    if(data.code == 200){
                        alert(data.msg);
                        location.href="${pageContext.request.contextPath}/bookAll";
                        return;
                    }
                }
            })
        })
</script>
</html>
