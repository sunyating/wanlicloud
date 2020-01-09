<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="top">
    <div class="wrapper">
        <div class="fl">
            <span>用户：<em>${customer.customerName}</em></span>
        </div>
        <div class="fr">
            <span><a href="/index/toMain">退出</a></span>
        </div>
        <div class="fr">
            <span><a href="/index/toMain">首页</a></span>
            <span><a href="/buyer/toCar">购物车</a></span>
            <span><a href="#">联系客服</a></span>
            <span><a href="#">帮助中心</a></span>
        </div>
    </div>
</div>

<div class="header">
    <div class="wrapper">
        <h2 class="fl"><span>中小微企业商城</span><em>|</em><em>个人中心</em></h2>
    </div>
</div>
