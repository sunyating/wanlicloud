<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <title>商品管理</title>
    <meta name="menu" content="toGoodsManagement"/>
</head>
<body>
<div>
    <div class="bg_color percent-seller percent-seller-goods" id="searchCondition">
        <div class="goods-status">
            <ul class="status-btn">
                <li class="fl status-btn-each <c:if test="${itemDto.searchFlag=='1'}">on </c:if>">
                    <a href="/seller/toGoodsManagement?searchFlag=1">全部商品</a>
                </li>
                <li class="fl status-btn-each <c:if test="${itemDto.searchFlag=='2'}">on </c:if>">
                    <a href="/seller/toGoodsManagement?searchFlag=2">待上架商品</a>
                </li>
                <li class="fl status-btn-each <c:if test="${itemDto.searchFlag=='3'}">on </c:if>">
                    <a href="/seller/toGoodsManagement?searchFlag=3">已上架商品</a>
                </li>
                <li class="fl status-btn-each <c:if test="${itemDto.searchFlag=='4'}">on </c:if>">
                    <a href="/seller/toGoodsManagement?searchFlag=4">已下架商品</a>
                </li>
                <li class="fl status-btn-each <c:if test="${itemDto.searchFlag=='5'}">on </c:if>">
                    <a href="/seller/toGoodsManagement?searchFlag=5">审批未通过商品</a>
                </li>
                <li class="fl status-btn-each <c:if test="${itemDto.searchFlag=='6'}">on </c:if>">
                    <a href="/seller/toGoodsManagement?searchFlag=6">已删除商品</a>
                </li>
            </ul>
        </div>
        `
        <form id="itemSearchForm" action="/seller/toGoodsManagement">
            <div class="top-filter">
                <div class="filter-row">
                    <label class="filter-item">商品名称： <input class="filter-input-filed" name="title" id="title"
                                                            value="${itemDto.title}" type="text"></label>
                    <label class="filter-item">商品类型：<input class="filter-input-filed " readonly id="productType"
                                                           value="${itemDto.productType}"
                                                           data-toggle="modal" data-target="#myModal" type="text">
                        <input class="filter-input-filed " readonly id="cid" name="cid" type="hidden">
                    </label>

                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">请选择商品类型</h4>
                                </div>
                                <div class="modal-body">
                                    <%-- <div id="treeview12" class="test" style="height:300px; overflow:scroll;"></div>--%>
                                    <ul id="category" class="ztree" style="height:400px; overflow:scroll;"></ul>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>


                <div class="filter-row">
                    <label class="filter-item">商品价格：<input class="filter-input-filed filter-input-filed-small"
                                                           name="beginPrice" type="text" value="${itemDto.beginPrice}">
                        <span class="split-line"></span><input class="filter-input-filed filter-input-filed-small"
                                                               type="text" name="endPrice" value="${itemDto.endPrice}">
                    </label>
                    <label class="filter-item">总销量：<input name="beginSellCount"
                                                          class="filter-input-filed filter-input-filed-small"
                                                          type="text" value="${itemDto.beginSellCount}">
                        <span class="split-line"></span>
                        <input class="filter-input-filed filter-input-filed-small" name="endSellCount"
                               value="${itemDto.endSellCount}" type="text">
                    </label>
                </div>
                <div class="filter-btn">
                    <a href="javascript:;" class="search-goods" onclick="doItemSearchForm()">搜索商品</a>
                    <a href="javascript:;" class="clear-condition">清空条件</a>
                </div>
            </div>
        </form>
        <table class="table table-bordered table-striped">
            <tr>
                <th>商品</th>
                <th>标题</th>
                <th>价格</th>
                <th>库存</th>
                <th>总销量</th>
                <th>发布时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="itemDto">
                <tr>
                    <td>
                        <img width="108" height="108" src=" ${ fn:split(itemDto.images, ',')[0] } "
                             style="float: left;">
                    </td>
                    <td width="300px" style="vertical-align: top">
                        <h2><a href="#">${fn:substring(itemDto.title,0,16)}</a></h2>
                        <p>${fn:substring(itemDto.sellPoint,0,16)} </p>
                    </td>
                    <td class="text-center"><fmt:formatNumber value="${itemDto.price/100}"
                                                              type="CURRENCY"></fmt:formatNumber></td>
                    </td>
                    <td class="text-center">${itemDto.stock}</td>
                    <td class="text-center">0
<%--                            ${itemDto.sellCount}--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${itemDto.sellCount==null}">--%>
<%--                                0--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                ${itemDto.sellCount}--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
                    </td>
                    <td class="text-center">${itemDto.onTime.toLocaleString()}</td>
                    <td class="text-center"><a href="/seller/xiajia?itemId=${itemDto.id}" class="delete-good">下架</a>
                    </td>
                </tr>
            </c:forEach>
        </table>


        <%--分页--%>
        <script type="text/javascript">
            var if_firstime = true;
            function doItemSearchForm() {
                // debugger;
                // $("#itemSearchForm").submit();

                var newhref = "/seller/toGoodsManagement?searchFlag=1" + "&" + $("#itemSearchForm").serialize();
                window.location.href = newhref;
            }

            window.onload = function () {
                $('.pagination').jqPaginator({
                    totalPages: ${pageInfo.pages},
                    visiblePages: 10,
                    currentPage: ${pageInfo.pageNum},

                    first: '<li class="first"><a href="javascript:void(0);">第一页</a></li>',
                    prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                    next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                    last: '<li class="last"><a href="javascript:void(0);">最末页 </a></li>',
                    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',

                    onPageChange: function (num) {
                        if (if_firstime) {
                            if_firstime = false;
                        } else if (!if_firstime) {
                            changePage(num);
                        }

                    }
                });
            }
            function changePage(num) {
                var newhref = "/seller/toGoodsManagement?searchFlag=1" + "&" + $("#itemSearchForm").serialize() + "&pageNum=" + num;
                window.location.href = newhref;
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
</body>
</html>