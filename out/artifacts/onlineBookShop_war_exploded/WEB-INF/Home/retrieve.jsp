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
            <h1 class="text-center" style="margin-bottom: 30px">找回密码</h1>
        </div>
        <div class="col-sm-12">
            <form class="form-horizontal caption" id="loginForm" action="##">
             <%--   <div class="form-group">
                    <label for="username" class="col-sm-4 control-label">用户名</label>
                    <div class="col-sm-4">
                        <input type="text" name="user_name" class="form-control" id="username" placeholder="用户名">
                    </div>
                </div>--%>
                 <div class="form-group">
                     <label for="password" class="col-sm-4 control-label">新密码</label>
                     <div class="col-sm-4">
                         <input type="password" name="user_pwd" class="form-control" id="password" placeholder="密码">
                     </div>
                 </div>

                <div class="form-group">
                    <label for="mobile" class="col-sm-4 control-label">手机号</label>
                    <div class="col-sm-4">
                        <input type="text" name="mobile" class="form-control" id="mobile" placeholder="手机号">
                    </div>
                </div>

                <div class="form-group " >
                    <label  style="display: inline-block" class="col-sm-4 control-label">验证码</label>
                    <div class="col-sm-4">
                        <input style="display: inline-block;width: 100px" type="text" name="verifyCode" class="form-control" id="verificationCode" placeholder="验证码">
                        <button type="button" name="sendVerifyCode" class="sendVerifyCode">获取</button>
                    </div>
                </div>

                   <%-- <button type="button" id="check-btn" class="verify-btn">确定</button>--%>
                </div>

               <%-- <button type="button" id="check-btn" class="verify-btn">确定</button>--%>

                    <div class="col-sm-offset-4 col-sm-4">
                        <button type="button" id="check-btn" style="height: 50px" class="btn btn-success btn-block verify-btn" onclick="submitForm()">提交</button>
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

        $(function(){
            //短信验证码倒计时
            var countdownHandler = function(){
                var $button = $(".sendVerifyCode");
                var number = 60;

                var countdown = function(){

                    if (number == 0) {
                        $button.attr("disabled",false);
                        $button.html("发送验证码");
                        number = 60;
                        return;
                    } else {

                        $button.attr("disabled",true);
                        $button.html(number + "秒重新发送");
                        number--;
                    }
                    setTimeout(countdown,1000);
                }
                setTimeout(countdown,1000);
            }
            //发送短信验证码
            $(".sendVerifyCode").on("click", function(){
                var $mobile = $("input[name=mobile]");
                var data = {};
                data.mobile = $.trim($mobile.val());

                if(data.mobile == ''){
                    alert('请输入手机号码');
                    return;
                }
                var reg = /^1\d{10}$/;
                if(!reg.test(data.mobile)){
                    alert('请输入合法的手机号码');
                    return ;
                }

                $.ajax({
                    url: "${pageContext.request.contextPath}/sendSms",
                    async : true,
                    type: "post",

                    data:{mobile:data.mobile},
                    success: function (data) {
                        var code =data.code

                        if(code== "200"){
                            countdownHandler();
                            return;
                        }else {
                            alert(data.msg)
                        }

                    }
                });
            })
            //提交
            $(".btn-success").on("click", function(){
                var data = {};
                data.userId = $.trim($("input[name=user_name]").val());
                data.password = $.trim($("input[name=user_pwd]").val());
                data.mobile = $.trim($("input[name=mobile]").val());
                data.verifyCode = $.trim($("input[name=verifyCode]").val());
             /*   if(data.userId == ''){
                    alert("请输入账号");
                    return ;
                }*/
                if(data.password == ''){
                    alert("请输入密码");
                    return ;
                }
                if(data.mobile == ''){
                    alert("请输入手机号");
                    return ;
                }
                if(data.verifyCode == ''){
                    alert("请输入验证码");
                    return ;
                }
                $.ajax({
                    url: "${pageContext.request.contextPath}/retrievePassword",
                    async : true,
                    type: "post",
                    data: {userId:data.userId,password:data.password,mobile:data.mobile,verifyCode:data.verifyCode},
                    success: function (data) {
                        if(data.code == 200){
                            alert(data.msg);
                            location.href="${pageContext.request.contextPath}/toLogin";
                            return;
                        }
                        alert(data.msg);
                    }
                });
            })
        });






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