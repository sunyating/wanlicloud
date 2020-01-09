<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <title>订单详情</title>
    <meta name="menu" content="toSellerOrderCenter"/>
</head>

<body>
<div class="perscenter-ui">
    <div>
        <div class="order order-detail-new seller-detail-new grey">
            <div class="wrapper">
                <div class="text-slide">
                    <div class="orderStatus">
                        <div class="order-status-part order-status-part-padding">
                            当前订单状态：
                            <span class="status" id="status"></span>
                        </div>
                        <div class="order-status-part">
                            <div class="notice">中小微企业商城提醒您：<span class="red">交易成功后，如果买家提出售后要求，请积极与买家协商，做好售后服务。</span>
                            </div>
                        </div>
                    </div>
                    <div class="bd orderInfo">
                        <div class="tit">订单信息</div>
                        <div class="con">
                            <div class="sellerTit">
                                买家信息
                            </div>
                            <div class="arrow"></div>
                            <div class="infoSection clearfix" style="text-align: left;">
                                <div class="item fl">
                                    联系人：<span
                                        class="sellerName">${custInfo.name}</span>
                                </div>

                                <div class="item fl">
                                    联系电话：<span
                                        class="sellerPhone">${custInfo.iphone}</span>
                                </div>

                                <div class="item fl">
                                    地址：<span
                                        class="sellerPhone">${custInfo.address}</span>
                                </div>
                            </div>
                            <ul>
                                <li>
                                    <table cellspacing="0" cellpadding="0" class="tablesorter" id="tablesorter">
                                        <thead>
                                        <tr>
                                            <th class="tbl-0" style="pointer-events:none;">
                                                <div>商品</div>
                                            </th>
                                            <th class="tbl-1">
                                                <div>卖点</div>
                                            </th>
                                            <th class="tbl-2">
                                                <div>价格</div>
                                            </th>
                                            <th class="tbl-3">
                                                <div>数量</div>
                                            </th>
                                            <th class="tbl-4">
                                                <div>订单状态</div>
                                            </th>
                                        </tr>

                                        </thead>

                                        <tbody class="moyig-ui">
                                        <c:forEach items="${ordersDetailDto}" var="ordersDetail" begin="0" end="0">
                                            <tr class="content-tr" style="border-bottom: 1px solid #e6e6e6">
                                                <td class="tbl-0">
                                                    <div class="goods clearfix">
                                                        <img class="fl" src="${ordersDetail.images}">

                                                        <div class="goods_detail fl">
                                                            <h3>${ordersDetail.title}</h3>
                                                        </div>
                                                    </div>

                                                </td>
                                                <td class="tbl-1">
                                                    <div>
                                                        <p>${ordersDetail.sellPoint}</p>
                                                    </div>
                                                </td>
                                                <td class="tbl-2">
                                                    <div>
                                                        <em><fmt:formatNumber value="${ordersDetail.price/100}"
                                                                              type="CURRENCY"></fmt:formatNumber></em>
                                                        <input type="hidden" class="totalPrice"
                                                               value="${ordersDetail.transactionPrice}">
                                                    </div>
                                                </td>
                                                <td class="tbl-3" style="border-right: 1px solid #e8e8e8">
                                                    <p>
                                                        <font>${ordersDetail.quantity}</font>
                                                    </p>
                                                </td>
                                                <td class="tbl-4" rowspan="${fn:length(ordersDetailDto)}">
                                                    <p>
                                                        <span class="status" id="${ordersDetail.status}"></span>
                                                    </p>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:forEach items="${ordersDetailDto}" var="ordersDetail" begin="1">
                                            <tr class="content-tr" style="border-bottom: 1px solid #e6e6e6">
                                                <td class="tbl-0">
                                                    <div class="goods clearfix">
                                                        <img class="fl" src="${ordersDetail.images}">

                                                        <div class="goods_detail fl">
                                                            <h3>${ordersDetail.title}</h3>
                                                        </div>
                                                    </div>

                                                </td>
                                                <td class="tbl-1">
                                                    <div>
                                                        <p>${ordersDetail.sellPoint}</p>
                                                    </div>
                                                </td>
                                                <td class="tbl-2">
                                                    <div>
                                                        <em><fmt:formatNumber value="${ordersDetail.price}"
                                                                              type="CURRENCY"></fmt:formatNumber></em>
                                                        <input type="hidden" class="totalPrice"
                                                               value="${ordersDetail.transactionPrice}">
                                                    </div>
                                                </td>
                                                <td class="tbl-3" style="border-right: 1px solid #e8e8e8">
                                                    <p>
                                                        <font>${ordersDetail.quantity}</font>
                                                    </p>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </li>
                            </ul>
                            <div class="infoSection clearfix" style="margin-top: 30px">
                                <div class="fr clearfix">
                                    <div id="orderStatus2" style="font-size: 16px;color: #333333;text-align: right">
                                        等待付款
                                    </div>
                                    <div id="totalPrice" class="price-info">应收价格：0.01元</div>
                                </div>
                            </div>
                            <div class="infoSection clearfix" style="margin-top: 30px">
                                <div class="fl infoOne">
                                    <div class="">
                                        商家订单编号：<span class="storeName">${sellerOrdersSeq}</span>
                                    </div>
                                    <div class="">
                                        买家订单编号：<span class="storeName">${custInfo.custOrderSeq}</span>
                                    </div>
                                    <div class="">
                                        下单时间：<span class="storeName"><fmt:formatDate value="${custInfo.createTime}"
                                                                                     pattern="yyyy-MM-dd"/> </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var status = {
            "1": "已删除",
            "2": "已超时",
            "3": "未支付",
            "4": "已支付(待发货)",
            "5": "已发货",
            "6": "确认收货",
            "7": "申请退货",
            "8": "同意退货",
            "9": "不同意退货",
            "0": "待支付"
        }

        var spans= $("span[class='status']")
        spans.each(function(){
            var id=this.id +'';
            $(this).html(status[id]);
            $("#status").html(status[id])
        })

        //计算总价
        var totalPrice=0;
        $(".totalPrice").each(function () {
            totalPrice+=parseInt($(this).val())
        })
        $("#totalPrice").html("应收价格："+totalPrice/100+"元");
    })


</script>

</body>

</html>