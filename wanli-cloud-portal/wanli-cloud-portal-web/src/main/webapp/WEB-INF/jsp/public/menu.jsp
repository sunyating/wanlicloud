<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="qq_contact">
    <div id="open_im" class="open-im"></div>
    <div class="im_main" id="im_main">
        <div id="close_im" class="close-im">
            <a href="javascript:void(0);" title="点击关闭">&nbsp;</a>
        </div>
        <a href="#" target="_blank" class="im-qq qq-a" title="在线QQ客服">
            <div class="qq-container"></div>
            <div class="qq-hover-c"><img class="img-qq" src="/img/index/qq2.png"></div>
            <span> QQ在线咨询</span>
        </a>

        <div class="im-footer" style="position:relative">
            <div style="clear:both;width: 100%;font-size: 12px;text-align: center;padding-top: 5px;padding-bottom: 3px;background: #0484cd;color: #fff;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;margin-top: 2px;">
                咨询电话<br>0871-68891764
            </div>
        </div>
    </div>
</div>

<div id="header" class="fixed">
    <div class="login_tag clearfix">
        <div class="am_tag">
            <a href="#/introducePlantform" class="index_help">帮助中心</a>
            <span id="goods" class="fl orange hidden " style="line-height:50px;margin-left:20px;">
                <a href="http://localhost:7085/seller/toGoodsManagement" style="color:#6a6a6a;">我的商品</a>
            </span>

            <div class="notLoginBtns login-items fr">
                <span class="logined-show" id="userInfo"></span>
                <input type="hidden" id="userId" name="userId">
                <a id="needLogin" class="login" href="http://localhost:8098/user/toLogin">你好，请登录 </a>
                <a id="register" class="register logined-hide " href="http://localhost:8098/user/toRegister">用户注册</a>
                <a class="my-order show" href="http://localhost:8089/buyer/toCar">购物车</a>

                <a id="buyerCenter" class="my-center logined-show sr-only"
                   href="http://localhost:8089/buyer/orders">买家个人中心</a>

                <a id="sellerCenter" class="my-center logined-show  sr-only" href="http://localhost:8088/seller/toSellerCenter">卖家个人中心</a>

                <a class="fr login logined-show personal logout show" onclick="loginOut()">退出</a>
            </div>
        </div>
    </div>

    <div class="wrapper clearfix">
        <a href="#" class="fl site-logo"></a>
        <ul class="fr index_content">
            <li class="focus">
                <a href="/portal/toMain">首页</a>
            </li>
            <li>
                <a href="/portal/toMarketMenu">应用超市</a>
            </li>
            <li>
                <a href="/portal/toCloudResource">云资源服务</a>
            </li>
            <li>
                <a href="/portal/toCommerec">电子商务服务</a>
            </li>
            <li>
                <a href="/portal/toGoverEnterprise">政企服务</a>
            </li>
            <li>
                <a href="/portal/toSolution">解决方案</a>
            </li>
        </ul>
    </div>


</div>

<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="/js/sso.js" type="text/javascript"></script>







