<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Flat-UI-master/dist/css/flat-ui.min.css"/>
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
        .list-group-item:hover{
            background: #27ae60;

        }
        .list-group-item div:first-child:hover{

            cursor: pointer;
        }
        th{
            text-align: right;
            width: 10%;;
            padding: 10px;
        }
        td{
            text-align: left;
            width: 30%;;
            padding: 10px;
        }
        .table th{
            text-align: center;
        }
        .table td{
            text-align: center;
        }
    </style>
    <script>
        function myClick(n){
            location.href = "OrderInfo.html";
        }
        function btnClick(){
            alert("btn");
            return false;
        }
        $(function(){

        })
    </script>
    <script>
        $(function(){
            $('#myTabs a').click(function (e) {

                $(this).tab('show')
            });
        })
    </script>
</head>
<body>
<!-- Static navbar -->
<%--<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">这什么东西</span>
            </button>
            <a class="navbar-brand" href="Index.jsp">图书商城</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="Index.jsp">首页</a></li>
                <li><a href="Order.jsp">我的订单</a></li>
                <li><a href="UserInfo.jsp">个人中心</a></li>
                <li><a href="FriendLink.jsp">友情链接</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="Login.jsp">登录</a></li>
                <li><a href="Register.jsp">注册</a></li>
                <li>
                    <a href="Cart.jsp"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>--%>
<jsp:include page="head.jsp"></jsp:include>
<!--content-->
<div class="container">
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">个人中心</h1>
        </div>

        <ul class="nav nav-tabs nav-justified" id="myTabs">
            <li class="active"><a href="#userHome" >个人信息</a></li>
            <li><a href="#editInfo">信息修改</a></li>
            <li><a href="#editPassword">密码修改</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="userHome">
              <table style="margin-left: 40px; width: 300px">
                  <tr>
                      <td>头像: </td>
                      <td><img style="border-radius: 180px ;width: 50px;height: 45px;" src="${pageContext.request.contextPath}/upload/${users.user_image}"></td>
                  </tr>
                  <tr>
                      <td>用户名: </td>
                      <td>${users.user_name}</td>
                  </tr>
                  <tr>
                      <td>手机号: </td>
                      <td>${users.user_phone}</td>
                  </tr>
                  <tr>
                      <td>邮箱: </td>
                      <td>${users.user_email}</td>
                  </tr>
                  <tr>
                      <td>状态: </td>
                      <c:if test="${users.user_status==0}">
                       <td>禁用</td>
                      </c:if>
                      <c:if test="${users.user_status==1}">
                          <td>正常</td>
                      </c:if>

                  </tr>
                  <tr>
                      <td>地址: </td>
                      <td>${users.user_address}</td>
                  </tr>
              </table>


            </div>
            <div role="tabpanel" class="tab-pane" id="editInfo">
                <form class="form-horizontal caption"  id="ajaxform">
                    <div class="form-group">
                        <label for="username" class="col-sm-4 control-label">用户名</label>
                        <div class="col-sm-4">
                            <input style="width: 300px;" type="text"  readonly="readonly" name="user_name" value="${users.user_name}" class="form-control" id="username" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inlineRadio1" class="col-sm-4 control-label">更换头像</label>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input  style="width: 300px;" type="file" name="user_image" id="inlineRadio1" value="">
                            </label>

                        </div>

                    </div>

                    <div class="form-group">
                        <label for="address" class="col-sm-4 control-label">地址</label>
                        <div class="col-sm-4">
                            <input  style="width: 300px;" type="text"  name="user_address" value="${users.user_address}"  class="form-control" id="address" placeholder="地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-4 control-label">邮箱</label>
                        <div class="col-sm-4">
                            <input  style="width: 300px;" type="email" name="user_email" value="${users.user_email}"  class="form-control" id="email" placeholder="邮箱">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="telephone" class="col-sm-4 control-label">手机号</label>
                        <div class="col-sm-4">
                            <input  style="width: 300px;" type="tel" name="user_phone" value="${users.user_phone}"  class="form-control" id="telephone" placeholder="电话号码">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-5 col-sm-2">
                            <button type="button" class="btn btn-success btn-block">修改</button>
                        </div>
                    </div>
            </div>

           </form>
            <div role="tabpanel" class="tab-pane" id="editPassword">
                <form class="form-horizontal caption"  id="updataPassword">
                    <input type="hidden" name="user_name" value="${users.user_name}">
                    <div class="form-group">
                        <label for="password" class="col-sm-4 control-label">原密码</label>
                        <div class="col-sm-4">
                            <input style="width: 300px" type="password" name="user_pwd" class="form-control" id="ypassword" placeholder="原密码">
                        </div>
                    </div>

                <div class="form-group">
                    <label for="password" class="col-sm-4 control-label">新密码</label>
                    <div class="col-sm-4">
                        <input  style="width: 300px" type="password" name="user_pwds" class="form-control" id="password" placeholder="密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-4 control-label">确认密码</label>
                    <div class="col-sm-4">
                        <input  style="width: 300px" type="password" name="newuser_pwd" class="form-control" id="password2" placeholder="确认密码">
                    </div>
                </div>
                    <div class="form-group">
                        <div class="col-sm-offset-5 col-sm-2">
                            <button type="button" class="btn updataPassword btn-block">修改</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>


</body>

<script>

    $(".updataPassword").on("click",function () {

        var pwd1 = document.getElementById("password").value;
        var pwd2 = document.getElementById("password2").value;
        var pwd3 = document.getElementById("ypassword").value;
        <!-- 对比两次输入的密码 -->
        if(pwd1 != pwd2) {
            alert('两次密码不一致')
            return;
        }
        if (pwd2==pwd3){
            alert('不能与原密码相同')
            return;
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/changePassword",
            type: "post",
            data:$("#updataPassword").serialize(),
            datatype:"json",
            success:function (data) {
                if (data.code==200){
                    alert("修改成功")
                    location.href="${pageContext.request.contextPath}/toLogin";
                    return;
                }
                alert(data.msg)
            },
            error:function (data) {
                alert("系统错误")
            }
        })
    })

    $(".btn-success").on("click", function(){



        var form=document.getElementById("ajaxform");
        console.log(form)
        var formData = new FormData(form);//表单id


        $.ajax({
            url: "${pageContext.request.contextPath}/modification",
            async : false,
            type: "post",
            cache: false,
            data:formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if(data.code == 200){
                    alert(data.msg);
                  location.reload();
                    return;
                }
                alert(data.msg);
            },
            error: function (data) {
                alert("系统错误")
            }

        })
    })

</script>

</html>