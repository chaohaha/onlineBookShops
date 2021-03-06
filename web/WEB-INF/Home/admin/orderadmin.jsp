<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/3
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            $('.orderDelete').each(function (i) {
                $(this).click(function (){
                    var order_id=$('.order_id').eq(i).text();
                    var order_status=$('.order_status').eq(i).text();
                    if (order_status.trim()=="已发货"){
                        alert("已发货收货，无法删除");
                        return false;
                    }
                    if (confirm("你确定删除吗？")) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/orderDelete",
                            type:"post",
                            data:{order_id:order_id},
                            success: function (data) {
                                if(data.code == 200){
                                    alert(data.msg);
                                    location.href="${pageContext.request.contextPath}/orderAll?orderSel="+$('[name="orderSel"]').val();
                                    return;
                                }
                            }
                        })
                    }
                })
            })

            $('.orderUpdate').each(function (i) {
                $(this).click(function () {
                    var order_status=$('.order_status').eq(i).text();
                    var order_id=$('.order_id').eq(i).text();
                    if (order_status.trim()=="已确认收货"){
                        alert("已确认收货，状态无法修改");
                        return false;
                    }
                    location.href="${pageContext.request.contextPath}/orderByIdUpdate?order_id="+order_id;
                })
            })

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
                <form action="${pageContext.request.contextPath}/orderAll" method="post">
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="" value="${orderSel}" name="orderSel" placeholder="订单编号、用户编号、订单状态其中一个来查询">
                    </div>
                    <div class="col-sm-1">
                        <button class="btn btn-success">查询</button>
                    </div>
                </form>
                <form action="${pageContext.request.contextPath}/orderAll" method="post" style="margin-top: -30px">
                    <div class="col-sm-4">
                        <input type="date" class="form-control"  name="order_create_time" placeholder="时间查询">
                    </div>
                    <div class="col-sm-1">
                        <button class="btn btn-success">查询</button>
                    </div>
                </form>
            </div>
            <div class="col-sm-12 thumbnail">
                <div class="col-sm-3 line-center" style="width: 225px;">订单编号</div>
                <div class="col-sm-2 line-center" style="width: 110px;">用户编号</div>
                <div class="col-sm-2 line-center" style="width: 135px;">生成时间</div>
                <div class="col-sm-2 line-center" style="width: 150px;">收货时间</div>
                <div class="col-sm-2 line-center" style="width: 100px;">总价</div>
                <div class="col-sm-2 line-center" style="width: 125px;">状态</div>
                <div class="col-sm-3 line-center" style="width: 125px;">操作</div>
            </div>
            <c:forEach items="${pageInfo.list}" var="o" >
                <div class="list-group">
                    <div class="col-sm-12  list-group-item" style="">
                        <div class="col-sm-3 line-center order_id" onclick="myClick(1)" style="width: 225px;margin-left: -10px;">${o.order_id}</div>
                        <div class="col-sm-2 line-center" style="width: 110px;">${o.user_id}</div>
                        <div class="col-sm-2 line-center" style="width: 135px;">${o.order_create_time}</div>
                        <div class="col-sm-2 line-center" style="width: 150px;">${o.order_complete_time}</div>
                        <div class="col-sm-2 line-center" style="width: 100px;">${o.order_totalPrice}</div>
                        <div class="col-sm-2 line-center order_status" style="width: 125px;">
                            <c:if test="${o.order_status==0}">
                                未发货
                            </c:if>
                            <c:if test="${o.order_status==1}">
                                已发货
                            </c:if>
                            <c:if test="${o.order_status==2}">
                                已确认收货
                            </c:if>
                            <c:if test="${o.order_status==4}">
                                未付款
                            </c:if>
                        </div>
                        <div class="col-sm-3 line-center" style="width: 140px;">
                            <a href="${pageContext.request.contextPath}/orderByIdAll?order_id=${o.order_id}">
                                <button class="btn btn-danger" style="padding: 5px 5px;">详情</button>
                            </a>
                            <button class="btn btn-danger orderDelete" style="padding: 5px 5px;">删</button>
                            <button class="btn btn-danger orderUpdate" style="padding: 5px 5px;">改</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${orderSel != null}">
                <nav class="center">
                    <ul class="pagination  pagination-lg">
                        <li>
                            <a href="${pageContext.request.contextPath}/orderAll?&orderSel=${orderSel}" aria-label="Previous">
                                <span aria-hidden="true">首页</span>
                            </a>
                        </li>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="${pageContext.request.contextPath}/orderAll?page=${pageNum}&size=${pageInfo.pageSize}&orderSel=${orderSel}">${pageNum}</a></li>
                        </c:forEach>
                        <li>
                            <a href="${pageContext.request.contextPath}/orderAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}&orderSel=${orderSel}" aria-label="Next">
                                <span aria-hidden="true">末页</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </c:if>
            <c:if test="${order_create_time != null}">
                <nav class="center">
                    <ul class="pagination  pagination-lg">
                        <li>
                            <a href="${pageContext.request.contextPath}/orderAll?&order_create_time=${order_create_time}" aria-label="Previous">
                                <span aria-hidden="true">首页</span>
                            </a>
                        </li>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="${pageContext.request.contextPath}/orderAll?page=${pageNum}&size=${pageInfo.pageSize}&order_create_time=${order_create_time}">${pageNum}</a></li>
                        </c:forEach>
                        <li>
                            <a href="${pageContext.request.contextPath}/orderAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}&order_create_time=${order_create_time}" aria-label="Next">
                                <span aria-hidden="true">末页</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </c:if>
            <c:if test="${orderSel == null and order_create_time == null}">
                <nav class="center">
                    <ul class="pagination  pagination-lg">
                        <li>
                            <a href="${pageContext.request.contextPath}/orderAll" aria-label="Previous">
                                <span aria-hidden="true">首页</span>
                            </a>
                        </li>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="${pageContext.request.contextPath}/orderAll?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                        </c:forEach>
                        <li>
                            <a href="${pageContext.request.contextPath}/orderAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">
                                <span aria-hidden="true">末页</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
