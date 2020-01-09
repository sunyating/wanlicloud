<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <title>资金管理</title>
    <meta name="menu" content="getSellerFinance"/>
</head>

<body>
<div>
    <div class="bg_color percent-seller percent-seller-finance-manage ng-scope">
        <div class="manage-top">
            <div class="account-part account-remain">
                <p class="item-title">
                    账户余额
                </p>
                <p class="item-mount">
												<span id="sanp01"><fmt:formatNumber
                                                        value="${sellerInfoDto.availableAssets/100}"
                                                        type="CURRENCY"></fmt:formatNumber></span>
                    <a onclick="changeValue('sanp01',1)" href="javascript:"
                       class="hide-btn"></a>
                </p>
                <div class="operate-btn">
                    <a class="withdraw-btn" href="javascript:">提现</a>
                </div>
            </div>
            <div class="account-part trade-amount">
                <p class="item-title">
                    交易额
                </p>
                <p class="item-mount">
												<span id="sanp02"><fmt:formatNumber
                                                        value="${sellerInfoDto.volumeAssets/100}"
                                                        type="CURRENCY"></fmt:formatNumber></span>
                    <a onclick="changeValue('sanp02',2)" href="javascript:"
                       class="hide-btn"></a>
                </p>
                <a href="#/sellerTradeHistory/all" class="link-btn">交易记录</a>
            </div>
        </div>
        <div class="manage-bottom">
            <div class="account-part online-trade-amount">
                <p class="item-title">
                    已到账
                </p>
                <p class="item-mount">
												<span id="sanp03" class="ng-binding"><fmt:formatNumber
                                                        value="${sellerInfoDto.withdrawAssets/100}"
                                                        type="CURRENCY"></fmt:formatNumber></span>
                    <a onclick="changeValue('sanp03',3)" href="javascript:"
                       class="hide-btn"></a>
                </p>
                <a href="#/sellerTradeHistory/all" class="link-btn">交易记录</a>
            </div>
            <div class="account-part trade-amount offline-trade-amount">
                <p class="item-title">
                    未到账
                </p>
                <p class="item-mount">
												<span id="sanp04" class="ng-binding"><fmt:formatNumber
                                                        value="0"
                                                        type="CURRENCY"></fmt:formatNumber></span>
                    <a onclick="changeValue('sanp04',4)" href="javascript:"
                       class="hide-btn"></a>
                </p>
                <a href="#/sellerTradeHistory/offline" class="link-btn">交易记录</a>
            </div>
        </div>
    </div>
</div>

</body>

</html>