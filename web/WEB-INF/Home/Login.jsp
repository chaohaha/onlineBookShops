<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/verification/css/verify.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Flat-UI-master/dist/css/flat-ui.min.css"/>
    <script src="${pageContext.request.contextPath}/Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/verification/js/verify.js" ></script>

    <title></title>
    <style>
        .row{
            margin-left: 20px;
            margin-right: 20px;;
        }
    </style>
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
    <div class="row thumbnail center">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">用户登录</h1>
        </div>
        <div class="col-sm-12">
            <form class="form-horizontal caption" id="loginForm" action="##">
                <div class="form-group">
                    <label for="username" class="col-sm-4 control-label">用户名</label>
                    <div class="col-sm-4">
                        <input type="text" name="user_name" class="form-control" id="username" placeholder="用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-4 control-label">密 &nbsp&nbsp&nbsp&nbsp码</label>
                    <div class="col-sm-4">
                        <input type="password" name="user_pwd" class="form-control" id="password" placeholder="密码">
                    </div>
                </div>
                <div class="form-group " >
                    <label  style="display: inline-block" for="password" class="col-sm-4 control-label">验证码</label>
                <div id="mpanel2" style="display: inline-block;margin-top: -35px"  class="col-sm-offset-4 col-sm-9 " >
                </div>
                   <%-- <button type="button" id="check-btn" class="verify-btn">确定</button>--%>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <div class="checkbox">
                            <label>
                                <a href="#">忘记密码？</a>
                            </label>
                        </div>
                    </div>
                </div>



               <%-- <button type="button" id="check-btn" class="verify-btn">确定</button>--%>

                    <div class="col-sm-offset-4 col-sm-4">
                        <button type="button" id="check-btn" style="height: 50px" class="btn btn-success btn-block verify-btn" onclick="submitForm()">登录</button>
                    </div>
                </div>
            </form>
        </div>
        <%--  <div class="col-sm-6">
              <div class="caption">
                  <h3>免责声明</h3>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>

              </div>

          </div>--%>

    </div>
</div>
<!--footer-->
<%--<div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div>--%>

</body>

<!--<script type="text/javascript" src="js/verify.min.js" ></script>-->


    <script type="text/javascript">
        var code;

        $('#mpanel2').codeVerify({
            type : 1,
            width : '200px',
            height : '40px',
            fontSize : '30px',
            codeLength : 4,
            btnId : 'check-btn',
            ready : function() {
            },
            success : function() {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/login",
                    data:$('#loginForm').serialize(),
                    datatype:"json",
                    success:function (data) {
                        console.log(data)
                        if (data.code==200){
                         location.href="${pageContext.request.contextPath}/index.jsp";
                        }
                        if(data.code==500){
                            alert(data.msg)
                            location.reload();
                        }
                    },
                    error:function (data) {
                        alert("系统错误")
                    }
                })
            },
            error : function() {
               alert("验证码错误")
            }
        });





</script>