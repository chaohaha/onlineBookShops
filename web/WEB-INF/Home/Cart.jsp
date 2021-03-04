<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../Flat-UI-master/dist/css/flat-ui.min.css"/>
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
    </style>
</head>
<body>
<!-- Static navbar -->

<jsp:include page="head.jsp"></jsp:include>
<!--content-->
<div class="container">
    <div class="row thumbnail center">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">购物车</h1>
        </div>
        <div class=" list-group">

            <in class="col-sm-12 thumbnail">

                <div class="col-sm-4 line-center">全选<input type="checkbox" id="selall">图书</div>
                <div class="col-sm-1 line-center">单价</div>
                <div class="col-sm-4 line-center">数量 </div>
                <div class="col-sm-2 line-center">小计</div>
                <div class="col-sm-1 line-center">操作</div>
        </div>
            <c:forEach items="${list}" var="l">
                <div class="col-sm-12  list-group-item">
                    <div class="col-sm-1 line-center" style="width: 50px;height: 50px;">

                        <img src="../Flat-UI-master/dist/img/icons/png/Book.png" style="height: 100%;" alt=""/>
                    </div>
                    <div class="col-sm-3 line-center"><input type="checkbox" name="${l.book_id}" class="tesi">  ${l.book_name}</div>
                    <div class="col-sm-1 line-center">${l.cart_price}￥</div>
                    <div class="col-sm-4 line-center">
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                        </button>
                        <input type="text" class="small" value="123"/>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </button>
                    </div>
                    <div class="col-sm-2 line-center">小计</div>
                    <div class="col-sm-1 line-center"><button class="btn btn-danger">删除</button></div>
                </div>
            </c:forEach>
        <div class="col-sm-offset-7 col-sm-5" style="padding: 30px;">
            <a href="${pageContext.request.contextPath}/Index"><div class="col-sm-6 btn btn-success btn-block">继续购物</div></a>
            <div class="col-sm-6  btn btn-success btn-block" onclick="booksBuy()"> 提交订单</div>
        </div>
    </div>
</div>


<!--footer-->
<div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div>
<script>
    $("#selall").click(function () {
        var clicks = $(this).is(':checked');
        if (!clicks) {
            $(".tesi").prop('checked',false);
        } else {
            $(".tesi").prop('checked',true);
        }
        $(this).data("clicks", !clicks);
    });
    var ids=[];
    function booksBuy(){
        var length=0;
        var inputs = $("input:checked");
        for (var i = 0; i <inputs.length; i++) {
            if ("selall"!=inputs[i].id){
                ids.push(inputs[i].name);
                length++;
            }
        }
        if (length>1){
            alert(ids)
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/booksBuy",
                data:ids,
                success:function (data) {
                    console.log(data)
                    if (data.code==200){
                        alert(data.msg)
                        location.reload();
                    }
                    if(data.code==500){
                        alert(data.msg)
                        location.href="${pageContext.request.contextPath}/toLogin";
                    }
                }
            })
        }else {
            alert("至少选择一个商品！")
        }

    }
</script>
</body>
</html>