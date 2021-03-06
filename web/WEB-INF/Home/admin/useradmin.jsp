<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/3/3
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
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
                <h3 class="text-center" style="margin-bottom: 30px">用户管理</h3>
            </div>
            <div class="col-sm-12" style="margin-bottom: 10px">
                <form action="${pageContext.request.contextPath}/userAdmin" method="post">
                    <div class="col-lg-6">
                        <input type="text" class="form-control" id="" name="userSearch" placeholder="用户名、编号其中一个来查询">
                    </div>
                    <div class="col-lg-1">
                        <button class="btn btn-success" type="submit">查询</button>
                    </div>
                </form>
            </div>
            <div class="col-sm-12 thumbnail">
                <div class="col-sm-3 line-center" style="width: 80px;">编号</div>
                <div class="col-sm-3 line-center" style="width: 130px;">用户名</div>
                <div class="col-sm-4 line-center" style="width: 200px;">邮箱</div>
                <div class="col-sm-4 line-center" style="width: 160px;">手机号码</div>
                <div class="col-sm-2 line-center" style="width: 125px;">头像</div>
                <div class="col-sm-2 line-center" style="width: 125px;">状态</div>
                <div class="col-sm-2 line-center" style="width: 125px;">权限</div>
              <%--  <div class="col-sm-2 line-center" style="width: 125px;">操作</div>--%>

            </div>
            <div class="list-group">
                <c:forEach items="${pageInfo.list}" var="user">
                <div class="col-sm-12  list-group-item" style="">

                    <div class="col-sm-3 line-center" onclick="myClick(1)" style="width: 80px;margin-left: -10px;">${user.user_id}</div>
                    <div class="col-sm-3 line-center" style="width: 130px;">${user.user_name}</div>
                    <div class="col-sm-4 line-center" style="width: 200px;">${user.user_email}</div>
                    <div class="col-sm-4 line-center" style="width: 160px;">${user.user_phone}</div>
                    <div class="col-sm-2 line-center" style="width: 125px;"><img style="width: 50px;height: 45px;" src="${pageContext.request.contextPath}/upload/${user.user_image}"></div>
                    <c:if test="${user.user_status==1}">
                        <div class="col-sm-2 line-center" style="width: 125px;">
                        <button type="button"  onclick="forbidden(${user.user_id})" class="btn  btn-danger">禁用</button>
                    </div>
                    </c:if>
                        <c:if test="${user.user_status==0}">
                            <div class="col-sm-2 line-center" style="width: 125px;">
                                <button type="submit" style="background-color: green" onclick="enable(${user.user_id})" class="btn  btn-danger">启用</button>
                            </div>
                        </c:if>
                        <c:if test="${user.user_limit==0}">
                            <div class="col-sm-2 line-center" style="width: 125px;">
                                <button type="button" class="btn btn-success ">普通用户</button>
                            </div>
                        </c:if>

                       <%-- <c:if test="${user.user_limit==1}">
                            <div class="col-sm-2 line-center" style="width: 125px;">
                                <button type="button" class="btn btn-success ">管理员</button>
                            </div>
                        </c:if>--%>
                    <%--   <c:if test="${user.user_limit==0}">
                           <div class="col-sm-2 line-center" style="width: 125px;">
                               <button type="button" onclick="empower(${user.user_id})" class="btn btn-success ">赋权</button>
                           </div>
                       </c:if>--%>
                   <%-- <c:if test="${user.user_limit==1}">
                        <div class="col-sm-2 line-center" style="width: 125px;">
                            <button type="button" style="background-color: red"  class="btn btn-success ">赋权</button>
                        </div>
                    </c:if>--%>


                </div>
                </c:forEach>
            </div>
            <nav class="center">
                <ul class="pagination  pagination-lg">
                    <li>
                        <a href="${pageContext.request.contextPath}/userAdmin" aria-label="Previous">
                            <span aria-hidden="true">首页</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                        <li><a href="${pageContext.request.contextPath}/userAdmin?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                    </c:forEach>
                    <li>
                        <a href="${pageContext.request.contextPath}/userAdmin?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">
                            <span aria-hidden="true">末页</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
<script>
    function forbidden(id) {

        var msg = "您确定要禁用吗？";
        if (confirm(msg)==true){
            $.ajax({
                url: "${pageContext.request.contextPath}/userStatus",
                type:"post",
                data:{'user_id':id,'status':0},
                success:function (data) {
                    alert(data.msg)
                    location.reload();
                },
                error:function (data) {
                    alert("系统错误")
                }
            })
        }else{
            return false;
        }
    }
    function enable(id) {

        var msg = "您确定要启用吗？";
        if (confirm(msg)==true){
            $.ajax({
                url: "${pageContext.request.contextPath}/userStatus",
                type:"post",
                data:{'user_id':id,'status':1},
                success:function (data) {
                    alert(data.msg)
                    location.reload();
                },
                error:function (data) {
                    alert("系统错误")
                }
            })
        }else{
            return false;
        }
    }

    function empower(id) {

        var msg = "您确定将此用户添加为管理员吗？";
        if (confirm(msg)==true){
            $.ajax({
                url: "${pageContext.request.contextPath}/empower",
                type:"post",
                data:{'user_id':id,'limit':1},
                success:function (data) {
                    alert(data.msg)
                    location.reload();
                },
                error:function (data) {
                    alert("系统错误")
                }
            })
        }else{
            return false;
        }
    }
</script>
</html>
