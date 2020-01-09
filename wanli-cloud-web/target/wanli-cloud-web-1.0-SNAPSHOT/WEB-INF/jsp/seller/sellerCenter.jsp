<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>卖家中心</title>
    <meta name="menu" content="toSellerCenter"/>
</head>

<body>
    <div>
        <div class="bg_color percent-seller percent-seller-new">
            <div class="seller_center">
                <div class="center">
                    <img src="${sellerInfoDto.images}" class="img_pic">
                    <div class="content">
                        <div class="seller_number">
                            <div class="info_menu">
                                <span class="info_tit">商家名称：</span>
                                <span class="info_con"> ${sellerInfoDto.companyName}</span>

                            </div>
                            <div class="info_menu">
                                <span class="info_tit fl">商家资质：</span>
                                <c:forEach begin="1" end="${sellerInfoDto.starLevel}">
                                    <img src="/img/order/gold.png" class="gold"/>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="seller_number">
                            <div class="info_menu">
                                <img src="/img/order/sell.png" class="sell_pic">
                                <span class="num_info">在售：${sellerInfoDto.sellingCount}件</span>
                            </div>
                            <div class="info_menu">
                                <img src="/img/order/time.png" class="time_pic">
                                <span class="num_info">注册时间：${sellerInfoDto.createTime.toLocaleString()}</span>
                            </div>
                        </div>
                    </div>
                    <a href="#/accountManange" class="fr setting-btn">设置</a>
                </div>

                <div class="seller_manage">
                    <div class="menu_1">
                        <div class="menu_title">
                            <img class="menu_pic" src="/img/order/menu_logo_1.png">
                            <span class="menu_title_name">商品管理</span>
                        </div>
                        <div class="menu_content">
                            <ul>
                                <li class="content content_1">
                                    <a href="/seller/toSellerUploadGoods">
                                        <i></i> 发布商品
                                    </a>
                                </li>
                                <li class="content content_2">
                                    <a href="/seller/toGoodsManagement?searchFlag=3">
                                        <i></i> 已上架商品
                                    </a>
                                </li>
                                <li class="content content_3">
                                    <a href="/seller/getAllOrders">
                                        <i></i> 订单中心
                                    </a>
                                </li>
                                <li class="content content_4">
                                    <a href="/seller/toGoodsManagement?searchFlag=2">
                                        <i></i> 待上架商品
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="menu_2">
                        <div class="menu_title">
                            <img class="menu_pic" src="/img/order/menu_logo_2.png">
                            <span class="menu_title_name">资金管理</span>
                        </div>
                        <div class="menu_content">
                            <ul class="sale_content">
                                <li class="sale_menu sale_menu_1"><span class="sale_tit">余额：</span>
                                    <span id="sanp01" class="sale"><fmt:formatNumber value="${sellerInfoDto.availableAssets/100}" type="CURRENCY"></fmt:formatNumber></span>
                                    <img class="sale_pic" src="/img/order/eye.png"
                                         onclick="changeStar(this,${sellerInfoDto.availableAssets/100})">
                                    <a href="javascript:" class="sale_btn">提现</a>
                                </li>
                                <li class="sale_menu sale_menu_2"><span class="sale_tit">交易额：</span>
                                    <span id="sanp02" class="sale">
                                        <fmt:formatNumber value="${sellerInfoDto.volumeAssets/100}" type="CURRENCY"></fmt:formatNumber>
                                    </span>
                                    <img class="sale_pic" src="/img/order/eye.png"
                                         onclick="changeStar(this,${sellerInfoDto.volumeAssets/100})">
                                    <a href="" class="sale_record">交易记录</a>
                                </li>
                                <li class="sale_menu sale_menu_3"><span class="s_tit">已到账：</span>
                                    <span id="sanp03" class="s_sale ng-binding">
                                        <fmt:formatNumber value="${sellerInfoDto.withdrawAssets/100}" type="CURRENCY"></fmt:formatNumber>
                                    </span>
                                    <img class="sale_pic" src="/img/order/eye.png" onclick="changeStar(this,${sellerInfoDto.withdrawAssets/100})">
                                    <a href="" class="sale_record">交易记录</a>
                                </li>
                                <li class="sale_menu sale_menu_4">
                                    <span class="s_tit">未到账：</span>
                                    <span id="sanp04" class="s_sale">
                                       *****
                                    </span>
                                    <img class="sale_pic" src="/img/order/eye.png" onclick="">
                                    <a href="" class="sale_record">交易记录</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>