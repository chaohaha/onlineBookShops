<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/2
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍管理</title>
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

            $('.bookDelete').each(function (i) {
                $(this).click(function (){
                    var book_id=$('.book_id').eq(i).text();
                    if (confirm("你确定删除吗？")) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/bookDelete",
                            type:"post",
                            data:{book_id:book_id},
                            success: function (data) {
                                if(data.code == 200){
                                    alert(data.msg);
                                    location.href="${pageContext.request.contextPath}/bookAll";
                                    return;
                                }
                            }
                        })
                    }
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
                    <h3 class="text-center" style="margin-bottom: 30px">书籍管理</h3>
                </div>
                <div class="col-sm-12" style="margin-bottom: 10px">
                    <form action="${pageContext.request.contextPath}/bookAll" method="post">
                        <div class="col-lg-6">
                            <input type="text" class="form-control" value="${bookname}" name="bookname" placeholder="书名、分类、编号其中一个来查询">
                        </div>
                        <div class="col-lg-1">
                            <button class="btn btn-success">查询</button>
                        </div>
                    </form>
                </div>
                <div class="col-sm-12 thumbnail">
                    <div class="col-sm-3 line-center" style="width: 110px;">编号</div>
                    <div class="col-sm-2 line-center" style="width: 110px;">书名</div>
                    <div class="col-sm-2 line-center" style="width: 110px;">分类</div>
                    <div class="col-sm-2 line-center" style="width: 110px;">单价</div>
                    <div class="col-sm-2 line-center" style="width: 110px;">库存</div>
                    <div class="col-sm-2 line-center" style="width: 110px;">销量</div>
                    <div class="col-sm-2 line-center" style="width: 110px;">图片</div>
                    <div class="col-sm-2 line-center" style="width: 110px;">状态</div>
                    <div class="col-sm-3 line-center" style="width: 125px;">操作</div>
                </div>
                <c:forEach var="b" items="${pageInfo.list}">
                    <div class="list-group">
                        <div class="col-sm-12  list-group-item" style="">
                            <div class="col-sm-3 line-center book_id" onclick="myClick(1)" style="width: 110px;margin-left: -10px;">${b.book_id}</div>
                            <div class="col-sm-2 line-center" style="width: 110px;">${b.book_name}</div>
                            <div class="col-sm-2 line-center" style="width: 110px;">${b.category.category_name}</div>
                            <div class="col-sm-2 line-center" style="width: 110px;">${b.book_price}</div>
                            <div class="col-sm-2 line-center" style="width: 110px;">${b.book_counts}</div>
                            <div class="col-sm-2 line-center" style="width: 110px;">${b.book_sales}</div>
                            <div class="col-sm-2 line-center" style="width: 110px;"><img src="${pageContext.request.contextPath}/upload/${b.book_image}" width="80px" height="60px"/></div>
                            <div class="col-sm-2 line-center" style="width: 110px;">
                                <c:if test="${b.book_type==0}">
                                    <font color="green"><i>上架</i></font>
                                </c:if>
                                <c:if test="${b.book_type==1}">
                                    <font color="red"><i>下架</i></font>
                                </c:if>
                            </div>
                            <div class="col-sm-3 line-center" style="width: 125px;">
                                <a href="${pageContext.request.contextPath}/bookAddOne">
                                    <button class="btn btn-danger" style="padding: 5px 5px;">增</button>
                                </a>
                                <button class="btn btn-danger bookDelete" style="padding: 5px 5px;">删</button>
                                <a href="${pageContext.request.contextPath}/bookUpdateOne?book_id=${b.book_id}">
                                    <button class="btn btn-danger" style="padding: 5px 5px;">改</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <%--<div class="list-group">
                    <div class="col-sm-12  list-group-item" style="">
                        <div class="col-sm-3 line-center" onclick="myClick(1)" style="width: 110px;margin-left: -10px;">编号</div>
                        <div class="col-sm-2 line-center" style="width: 110px;">未付款</div>
                        <div class="col-sm-2 line-center" style="width: 110px;">未付款</div>
                        <div class="col-sm-2 line-center" style="width: 110px;">未付款</div>
                        <div class="col-sm-2 line-center" style="width: 110px;">未付款</div>
                        <div class="col-sm-2 line-center" style="width: 110px;">未付款</div>
                        <div class="col-sm-2 line-center" style="width: 110px;">未付款</div>
                        <div class="col-sm-2 line-center" style="width: 110px;">未付款</div>
                        <div class="col-sm-3 line-center" style="width: 125px;">
                            <button class="btn btn-danger" style="padding: 5px 5px;">增</button>
                            <button class="btn btn-danger" style="padding: 5px 5px;">删</button>
                            <button class="btn btn-danger" style="padding: 5px 5px;">改</button>
                        </div>
                    </div>
                </div>--%>
                <nav class="center">
                    <ul class="pagination  pagination-lg">
                        <li>
                            <a href="${pageContext.request.contextPath}/bookAll?bookname=${bookname}" aria-label="Previous">
                                <span aria-hidden="true">首页</span>
                            </a>
                        </li>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="${pageContext.request.contextPath}/bookAll?page=${pageNum}&size=${pageInfo.pageSize}&bookname=${bookname}">${pageNum}</a></li>
                        </c:forEach>
                        <li>
                            <a href="${pageContext.request.contextPath}/bookAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}&bookname=${bookname}" aria-label="Next">
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
