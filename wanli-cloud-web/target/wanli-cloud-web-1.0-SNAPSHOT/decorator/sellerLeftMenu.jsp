<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="shutiao-lt">
    <div class="fabu-link"> 合作伙伴 </div>
    <div class="tree-obj">
        <ul class="tree-pent">
            <li>
                <c:out value="${selectedMenu}"/>
                <a href="/seller/toSellerCenter" >个人中心 </a>
            </li>
            <li>
                <a href="/seller/toGoodsManagement?searchFlag=1">商品管理</a>
            </li>
            <li>
                <a href="/seller/toSellerUploadProducts" >发布货品</a>
            </li>
            <li>
                <a href="/seller/toSellerUploadGoods" >发布商品</a>
            </li>
            <li>
                <a href="/seller/getAllOrders">订单中心</a>
            </li>
            <li>
                <a href="/seller/getSellerFinance">资金管理</a>
            </li>
            <li>
                <a href="/seller/getTradeHistory">交易记录</a>
            </li>
            <li>
                <a href="/seller/getSellerAccount">信息管理</a>
            </li>
            <li>
                <a href="/seller/toAccountManage">账号管理</a>
            </li>
        </ul>

    </div>

</div>






