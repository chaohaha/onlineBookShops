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
    <div class="row thumbnail">
        <div class="col-sm-12">
             <h1 class="text-center" style="margin-bottom: 30px">用户注册</h1>
        </div>
        <div class="col-sm-12">
            <form class="form-horizontal caption"  id="ajaxform">
                <div class="form-group">
                    <label for="username" class="col-sm-4 control-label">用户名</label>
                    <div class="col-sm-4">
                        <input type="text" name="user_name" class="form-control" id="username" placeholder="用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-4 control-label">密码</label>
                    <div class="col-sm-4">
                        <input type="password" name="user_pwds" class="form-control" id="password" placeholder="密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-4 control-label">确认密码</label>
                    <div class="col-sm-4">
                        <input type="password" name="user_pwd" class="form-control" id="password2" placeholder="确认密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inlineRadio1" class="col-sm-4 control-label">头像</label>
                    <div class="col-sm-4">
                        <label class="radio-inline">
                            <input type="file" name="user_image" id="inlineRadio1" value="">
                        </label>
                    </div>

                </div>

                <div class="form-group">
                    <label for="address" class="col-sm-4 control-label">地址</label>
                    <div class="col-sm-4">
                        <input type="text"  name="user_address" class="form-control" id="address" placeholder="地址">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-4 control-label">邮箱</label>
                    <div class="col-sm-4">
                        <input type="email" name="user_email" class="form-control" id="email" placeholder="邮箱">
                    </div>
                </div>

                <div class="form-group">
                    <label for="telephone" class="col-sm-4 control-label">手机号</label>
                    <div class="col-sm-4">
                        <input type="tel" name="user_phone" class="form-control" id="telephone" placeholder="电话号码">
                    </div>
                </div>

                <div class="form-group " >
                    <label  style="display: inline-block" class="col-sm-4 control-label">验证码</label>
                    <div class="col-sm-4">
                        <input style="display: inline-block;width: 100px" type="text" name="verifyCode" class="form-control" id="verificationCode" placeholder="验证码">
                        <button type="button" name="sendVerifyCode" class="sendVerifyCode">获取</button>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-5 col-sm-2">
                        <button type="button" class="btn btn-success btn-block">注册</button>
                    </div>
                </div>
            </form>
        </div>


        </div>

    </div>
</div>


<!--footer-->
<%--<div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div>--%>
</body>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
    var status =0
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
            var $mobile = $("input[name=user_phone]");
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
                url: "${pageContext.request.contextPath}/sendSmsRegister",
                async : true,
                type: "post",

                data:{mobile:data.mobile},
                success: function (data) {
                    var code =data.code;
                /*    alert(data.code)*/
                    if(code== "200"){
                        status=1;
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
            data.user_name = $.trim($("input[name=user_name]").val());
            data.user_pwd = $.trim($("input[name=user_pwd]").val());
            data.user_phone = $.trim($("input[name=user_phone]").val());
            var verifyCode = $.trim($("input[name=verifyCode]").val());
            data.user_email = $.trim($("input[name=user_email]").val());
            data.user_file = $.trim($("input[name=user_image]").val());
            data.address = $.trim($("input[name=user_address]").val());





            if(data.user_name == ''){
                   alert("请输入账号");
                return;
               }
            if(data.user_pwd == ''){
                alert("请输入密码");
                return;
            }

            var pwd1 = document.getElementById("password").value;
            var pwd2 = document.getElementById("password2").value;
            <!-- 对比两次输入的密码 -->
            if(pwd1 != pwd2) {
                alert('两次密码不一致')
                return;
            }
            if(data.user_file == ''){
                alert("请上传头像");
                return;
            }
            if(data.address == ''){
                alert("请输入地址");
                return;
            }
            if(data.user_email == ''){
                alert("请输入邮箱");
                return;
            }
            if(data.user_phone == ''){
                alert("请输入手机号");
                return;
            }
            if(verifyCode == ''){
                alert("请输入验证码");
                return;
            }
            if(data.user_name == ''){
                alert("请输入账号");
                return;
            }
            if (status==0){
                alert("请发送验证码")
                return;
            }
            var form=document.getElementById("ajaxform");
            console.log(form)
            var formData = new FormData(form);//表单id


            $.ajax({
                url: "${pageContext.request.contextPath}/register",
                async : false,
                type: "post",
                cache: false,
                data:formData,
                contentType: false,
                processData: false,
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
</script>

</html>