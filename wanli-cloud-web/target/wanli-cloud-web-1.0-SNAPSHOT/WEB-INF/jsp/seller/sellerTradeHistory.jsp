<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<title>交易记录</title>
		<meta name="menu" content="getTradeHistory"/>
	</head>

	<body>
	<form id="frm" class="bs-example form-horizontal" action="${ctx}/seller/getTradeHistory"
		  method="post">
		<div>
			<div class="bg_color percent-seller">
				<div class="trade-history">
					<div class="percent-seller-goods">
						<div class="filter-row">
							<label class="filter-item">
								商品名称:
								<input id="prodName" name="prodName" value="${tradeHistoryParamDto.prodName}"
									   class="filter-input-filed" type="text">
							</label>
							<label class="filter-item">
								订单号:
								<input id="ordersSeq" name="sellerOrdersSeq" value="${tradeHistoryParamDto.sellerOrdersSeq}"
									   class="filter-input-filed" type="text">
							</label>
							<label class="filter-item">
								交易状态:
								<select id="status" name="status"
										class="filter-input-filed" type="text">
									<option <c:if test="${tradeHistoryParamDto.status=='' }">selected</c:if> value="">请选择订单状态</option>
									<option <c:if test="${tradeHistoryParamDto.status=='0'}">selected</c:if> value="0">待支付</option>
									<option <c:if test="${tradeHistoryParamDto.status=='1' }">selected</c:if> value="1">已删除</option>
									<option <c:if test="${tradeHistoryParamDto.status=='2' }">selected</c:if> value="2">已超时</option>
									<option <c:if test="${tradeHistoryParamDto.status=='3' }">selected</c:if> value="3">未支付</option>
									<option <c:if test="${tradeHistoryParamDto.status=='4' }">selected</c:if> value="4">已支付(代发货)</option>
									<option <c:if test="${tradeHistoryParamDto.status=='5' }">selected</c:if> value="5">已发货</option>
									<option <c:if test="${tradeHistoryParamDto.status=='6' }">selected</c:if> value="6">确认收货</option>
									<option <c:if test="${tradeHistoryParamDto.status=='7' }">selected</c:if> value="7">申请退货</option>
									<option <c:if test="${tradeHistoryParamDto.status=='8' }">selected</c:if> value="8">同意退货</option>
									<option <c:if test="${tradeHistoryParamDto.status=='9' }">selected</c:if> value="9">不同意退货</option>
								</select>
							</label>
						</div>
						<div class="filter-row">
							<label class="filter-item">
								开始时间:
								<input type="text"
									   onclick="WdatePicker({el:'beginTime', dateFmt:'yyyy-MM-dd HH:mm:ss'})"
									   class="filter-input-filed" name="beginTime"
									   id="beginTime"
									   value="<fmt:formatDate value='${tradeHistoryParamDto.beginTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"
									   readonly/>
							</label>

							<label class="filter-item">
								结束时间:
								<input type="text"
									   onclick="WdatePicker({el:'endTime', dateFmt:'yyyy-MM-dd HH:mm:ss'})"
									   class="filter-input-filed" name="endTime"
									   id="endTime"
									   value="<fmt:formatDate value='${tradeHistoryParamDto.endTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"
									   readonly/>
							</label>
						</div>

						<div class="filter-btn">
							<button class="btn btn-warning" onclick="doOrderSearchForm()">搜索订单</button>
							<button class="btn btn-success" onclick="clear()">清空条件</button>
						</div>
					</div>
					<table class="trade-history-list" id="tradeHistory_table">
						<tbody id="tradeHistoryList">
						<tr class="trade-history-hd" id="dto">
							<th>订单流水号</th>
							<th>商品名称</th>
							<th>卖点</th>
							<th>商品成交价格</th>
							<th>查看</th>
							<th>交易状态</th>
						</tr>
						<c:forEach items="${pageInfo.list}" var="tradeHistory">
							<tr class="item">
								<td class="seq" style="font-size:12px;">${tradeHistory.sellerOrdersSeq}</td>
								<td class="product-name">${tradeHistory.title}</td>
								<td class="product-name">${tradeHistory.sellPoint}</td>
								<td class="price-info" style="font-size:12px;">
									<fmt:formatNumber value="${tradeHistory.transactionPrice/100}"
													  type="CURRENCY"></fmt:formatNumber></td>
								<td class="order-detail">
									<a target="_blank"
									   href="#">订单详情</a>
								</td>
								<td class="order-state complete" id="${tradeHistory.status}" name="tradeStatus">

								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

					<%--分页--%>
					<script src="/js/jquery-1.11.2.min.js"></script>
					<script type="text/javascript">
                        var if_firstime = true;
                        function doOrderSearchForm() {
                            $("#frm").submit();
                        }

                        window.onload = function () {
                            $('.pagination').jqPaginator({
                                totalPages: ${pageInfo.pages},
                                visiblePages: 10,
                                currentPage: ${pageInfo.pageNum},

                                first: '<li class="first"><a href="javascript:void(0);" >第一页</a></li>',
                                prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                                next: '<li class="next"><a href="javascript:void(0);" >下一页</a></li>',
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
                            console.log(num)

							window.location.href ="getTradeHistory?"+$("#frm").serialize()+"&pageNum="+num;
                        }
					</script>
					<div class="pagination-layout">
						<div class="pagination">
							<ul class="pagination" total-items="pageInfo.totalRows" max-size="10" boundary-links="true">

							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
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


            var spans= $("td[name='tradeStatus']")
            spans.each(function(){
                var id=this.id +'';
                $(this).html(status[id]);

            })
        });

		function clear() {
			$("#prodName").html();
			$("#startTime").html();
			$("#endTime").html();
			$("#ordersSeq").html();
			$("#status").html();

        }




	</script>
	</body>



</html>