<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
    <title>订单中心</title>
    <meta name="menu" content="getAllOrders"/>
</head>

<body>
<div>
    <form id="frm" action="/seller/getAllOrders" method="post" >
    <div class="order bg_color order-center-new" style="width: 824px">
        <div class="wrapper_pc">
            <div class="order_query">
                <ul class="clearfix">

                    <li><label>商品名称:</label>
                        <input type="text" id="prodName" name="prodName" value="${sellerOrdersSelConDto.prodName}">
                    </li>
                    <li>
                        <label>成交时间:</label>

                        <input type="text"
                               onclick="WdatePicker({el:'startTime', dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                               name="startTime" id="startTime"
                               value="<fmt:formatDate value='${sellerOrdersSelConDto.startTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"
                               placeholder="开始时间" readonly/>
                    </li>
                    <li>
                        <label>成交时间:</label>

                        <input type="text"
                               onclick="WdatePicker({el:'endTime', dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                               name="endTime" id="endTime"
                               value="<fmt:formatDate value='${sellerOrdersSelConDto.endTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"
                               placeholder="结束时间" readonly/>

                    </li>
                    <li><label>买家昵称:</label>
                        <input type="text" id="custName" name="custName"
                               value="${sellerOrdersSelConDto.custName}">
                    </li>
                    <li>
                        <label>买家单号:</label>
                        <input type="text" id="custOrdersSeq" name="custOrdersSeq" value="${sellerOrdersSelConDto.custOrdersSeq}">
                    </li>
                    <li>
                        <label>商家单号:</label>
                        <input type="text" id="sellerOrdersSeq" name="sellerOrdersSeq" value="${sellerOrdersSelConDto.sellerOrdersSeq}">
                    </li>
                </ul>
                <div class="filter-btn">
                    <button class="btn btn-warning"  onclick="doItemSearchForm()">搜索订单</button>
                    <button class="btn btn-success"  onclick="getHistoryOrders()">导出/下载历史订单</button>
                </div>
            </div>

            <div class="text-slide">
                <input type="hidden" id="searchFlag" name="searchFlag" value="${sellerOrdersSelConDto.searchFlag}" readonly>
                <div class="hd">
                    <ul>
                        <li id="liflag0" >
														<span onclick="changeserachFlag(0)"> 近3个月订单
															<em>(${ordersCountDto.nearlyThreeMonth})</em>
                                                        </span>

                        </li>
                        <li id="liflag1">
														<span onclick="changeserachFlag(1)">等待买家付款
                            								<em>(${ordersCountDto.waitPay})</em>
                       									</span>
                        </li>
                        <li id="liflag2">
														<span onclick="changeserachFlag(2)">等待发货
															<em>(${ordersCountDto.waitHandle})</em>
                       									 </span>
                        </li>
                        <li id="liflag3">
														<span onclick="changeserachFlag(3)">已完成订单
                            								<em>(${ordersCountDto.isDone})</em>
                        								</span>
                        </li>
                        <li id="liflag4" >
														<span onclick="changeserachFlag(4)">三个月前订单
															<em>(${ordersCountDto.threeMonthAgo})</em>
														</span>
                        </li>
                    </ul>
                </div>
                <div class="bd">
                    <ul>
                        <li>

                            <table cellspacing="0" cellpadding="0" class="tablesorter" id="tablesorter">
                                <thead>
                                <tr>
                                    <th class="tbl-0"
                                        style="pointer-events:none;text-align:left;text-indent:228px;width: 750px;">
                                        <div>商品</div>
                                    </th>

                                    <th class="tbl-1">
                                        <div>价格</div>
                                    </th>
                                    <th class="tbl-2">
                                        <div>买家</div>
                                    </th>
                                    <th class="tbl-2">
                                        <div>详情</div>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="6">
                                        <table cellspacing="0" cellpadding="0" class="moyig-ui">
                                            <tbody>
                                            <c:forEach items="${pageInfo.list}" var="sellerOrderDto">
                                                <tr class="head-tr">
                                                    <td colspan="6">
                                                        <div class="fl">
                                                            <span>订单流水:${sellerOrderDto.sellerOrdersSeq}</span>
                                                            <input type="hidden" value="${sellerOrderDto.sellerOrdersSeq}" id="sellerSeq">
                                                            <span>买家电话:${sellerOrderDto.costomerPhoneNum}</span>
                                                            <span id="${sellerOrderDto.status}" name="sName"></span>
                                                            <input type="hidden" value="${sellerOrderDto.custOrdersSeq}" id="custSeq">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <c:forEach items="${sellerOrderDto.sellerOrderList}" var="sellerOrderListDto" begin="0" end="0">
                                                    <tr class="content-tr"
                                                        style="border-bottom: 1px solid #e8e8e8;">
                                                        <td>
                                                            <div class="check-box"
                                                                 style="height: 27px;"></div>
                                                        </td>
                                                        <td class="tbl-0">
                                                            <div class="goods clearfix">
                                                                <img class="fl"
                                                                     src="${sellerOrderListDto.image}">
                                                                <div class="goods_detail fl">
                                                                    <h3>${sellerOrderListDto.title}</h3>
                                                                    <p>${sellerOrderListDto.sellPoint}</p>
                                                                </div>
                                                            </div>
                                                        </td>

                                                        <td class="tbl-1">
                                                            <div>
                                                                <em><fmt:formatNumber value='${sellerOrderListDto.price/100}'
                                                                                      type='CURRENCY'></fmt:formatNumber>/个</em>
                                                            </div>
                                                        </td>
                                                        <td class="tbl-2"
                                                            rowspan="${fn:length(sellerOrderDto.sellerOrderList)}">
                                                            <p>
                                                                <font>${sellerOrderListDto.customerName}</font>
                                                            </p>
                                                        </td>
                                                        <td class="tbl-2" rowspan="${fn:length(sellerOrderDto.sellerOrderList)}">
                                                            <div>
                                                                <p>
                                                                    <a target="_blank"
                                                                       class="view-order clearfix"
                                                                       href="${ctx}/seller/toSellerOrderDetail" id="orderDetail">订单详情</a>
                                                                </p>
                                                            </div>
                                                        </td>
                                                    </tr>
                                            <c:forEach items="${sellerOrderDto.sellerOrderList}" var="sellerOrderListDto" begin="1" end="${fn:length(sellerOrderDto.sellerOrderList)}">
                                            <tr class="content-tr"
                                                style="border-bottom: 1px solid #e8e8e8;">
                                                <td>
                                                    <div class="check-box"
                                                         style="height: 27px;"></div>
                                                </td>
                                                <td class="tbl-0">
                                                    <div class="goods clearfix">
                                                        <img class="fl"
                                                             src="${sellerOrderListDto.image}">
                                                        <div class="goods_detail fl">
                                                            <h3>${sellerOrderListDto.title}</h3>
                                                            <p>${sellerOrderListDto.sellPoint}</p>
                                                        </div>
                                                    </div>
                                                </td>

                                                <td class="tbl-1">
                                                    <div>
                                                        <em><fmt:formatNumber value='${sellerOrderListDto.price/100}'
                                                                              type='CURRENCY'></fmt:formatNumber>/个</em>
                                                    </div>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                                </c:forEach>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </td>
                                </tr>


                                </tbody>
                            </table>

                            <!--分页-->
                            <script type="text/javascript">
                                var if_firstime = true;
                                function doItemSearchForm() {
                                    $("#searchFlag").val("");
                                    $("#frm").submit();
                                }

                                window.onload = function () {
                                    $('.pagination').jqPaginator({
                                        totalPages: ${pageInfo.pages},
                                        visiblePages: 10,
                                        currentPage: ${pageInfo.pageNum},

                                        first:'<li class="first"><a href="javascript:void(0);">第一页</a></li>',
                                        prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                                        next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                                        last: '<li class="last"><a href="javascript:void(0);">最末页 </a></li>',
                                        page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',

                                        onPageChange: function (num) {
                                            if(if_firstime){
                                                if_firstime = false;
                                            }else if(!if_firstime){
                                                changePage(num);
                                            }

                                        }
                                    });
                                }
                                function  changePage(num){
                                    window.location.href = "getAllOrders?"+$("#frm").serialize()+"&pageNum="+num;
                                }
                            </script>
                            <div class="pagination-layout">
                                <div class="pagination">
                                    <ul class="pagination" total-items="pageInfo.totalRows" max-size="10"
                                        boundary-links="true">

                                    </ul>
                                </div>
                            </div>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </form>
</div>

<script src="/js/jquery-1.11.2.min.js"></script>
<script type="application/javascript" >

        $(function(){
            var status={
                "1":"已删除",
                "2":"已超时",
                "3":"未支付",
                "4":"已支付(待发货)",
                "5":"已发货",
                "6":"确认收货",
                "7":"申请退货",
                "8":"同意退货",
                "9":"不同意退货",
                "0":"待支付"
            }


           var spans= $("span[name='sName']")
            spans.each(function(){
                var id=this.id +'';
                $(this).html("订单状态:"+status[id]);
            })

            //传买家订单号的参数到后台
            var custOrdersSeq=$("#custSeq").val();
            var sellerOrdersSeq=$("#sellerSeq").val();
            $("#orderDetail").attr("href","/seller/getOrdersDetail?custOrdersSeq="+custOrdersSeq+"&sellerOrdersSeq="+sellerOrdersSeq)


        });

        function changeserachFlag(status) {
            $("#searchFlag").val(status);
            $("#frm").submit();
            //submit form
        };


        function getHistoryOrders() {
            $("#frm").attr("action", "/seller/getHistoryOrders");
            $("#frm").submit();
        }





</script>
</body>

</html>