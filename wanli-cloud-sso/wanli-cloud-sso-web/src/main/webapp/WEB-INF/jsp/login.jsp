<%--
  Created by sapling
  User: sapling
  Date: 2017-12-02
  Time: 14:10
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="common.jsp"></jsp:include>
    <title>登陆页面</title>
</head>
<body class="media_screen_1200">
<div id="body_wrap">
    <div class="login_wrap">
        <div class="logo_wrap">
            <div class="logo">
                <a title="" href="#" class="mainlogo logo_mgj_img"></a>
            </div>
        </div>
        <div class="content clearfix" style="background:url(${ctx}/img/bg_login.png) no-repeat center center;">
            <div class="lg_banner">
                <a href="#" target="_blank" class="banner1"></a>
            </div>

            <div class="lg_left ui-option-main-box" id="lg_content">
                <div class="login_mod_tab">
                    <div class="fl mod">
                        <a class="lo_mod tab_on" lo-mod="normal" href="javascript:void(0)">登录</a>
                    </div>
                </div>

                <div id="signform" class="formbox">
                    <!--<p class="error_tip">登录名或密码错误</p>-->
                    <div class="lg_form">
                        <form method="post">
                            <!-- 登录 start -->
                            <div class="mod_box lo_mod_box">
                                <div class="ui-sign-item ui-name-item lg_item lg_name">
                                    <input id="username" type="text" maxlength="32" class="ui-input pwd_text" name="username"
                                           placeholder="用户名">
                                </div>
                                <div class="ui-sign-item ui-sign-common-item lg_item lg_pass">
                                    <input id="password" type="password" maxlength="32" class="ui-input pwd_text" name="password"
                                           placeholder="密码">
                                </div>
                                <div class="lg_login clearfix">
                                    <input id="toLoginCheck" type="submit" value="登录" class="sub" onclick="return false">
                                </div>
                                <div  class="lg_login clearfix" onclick="toRegister()">
                                        <input type="submit"  value="还没有账号?去注册" class="sub" onclick="return false">
                                </div>
                                <div class="lg_reg">
                                    <input id="abutton" type="button" value="百度账号登录"	onclick="clickme()" />
                                    <a class="findpwd" href="javascript:void(0)">忘记密码</a>
                                </div>
                            </div>
                            <!-- 登录 end -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>

<script>
    //没有账号，去注册页面
     function toRegister(){
        window.location.href="${ctx}/user/toRegister";
     }
    //百度登录按钮
    function clickme() {
        window.location.href = "/user/toOauth";
    };

    //页面加载后
    $(function(){
            // 登录前验证
        $("#toLoginCheck").click(function(){
            var username=$("#username").val()
            var password=$("#password").val()
            if(username=='' || username==undefined || password=='' || password==undefined){
                alert("用户名或者密码不能为空")
            }else{
                var data={}
                data.userName=username
                data.password=password
               $.ajax({
                   type:"post",
                   url:"${ctx}/user/login",
                   data:data,
                   dataType:"json",
                   success:function(result){
                       if(result.status==200){
                            toastr.success("登录成功");
                           window.location.href="http://localhost:8078/portal/toMain"
                           // window.location.href="http://localhost:8088/seller/toSellerCenter"
                       }else if(result.status==400){
                           toastr.error(result.msg)
                       }
                   },
                   error:function(){
                       toastr.error("请求失败404")
                   }
               })
            }
        })
    })
</script>
</html>