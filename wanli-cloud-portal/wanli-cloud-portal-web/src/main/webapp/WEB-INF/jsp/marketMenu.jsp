<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <jsp:include page="public/head.jsp"></jsp:include>
</head>

<body ng-controller="indexCtrl" class="index ng-scope">

<jsp:include page="public/menu.jsp"></jsp:include>

<div id="page-container">
    <div id="container" class="market_menu">
        <div class="content">
            <a class="tag_1" href="#/">首页&gt;&gt;</a>
            <span disabled="" style="color: grey">应用超市&gt;&gt;</span>
            <a href="javascript:;" class="search-goods tag_1" style="color: red" onclick="showModalframe()">选择商品类目</a>
            <div align="right" class="searchFix">
                <div class="form-inline">
                    <div class="form-group">
                        <div class="input-group">
                            <input id="ser" type="text" class="form-control " style="border-radius:10px;"/>
                        </div>
                    </div>
                    <button id="t1" class="btn btn-danger btn-primary" onclick="portalSearch()">搜索</button>
                </div>
            </div>

            <%--商品列表start--%>
            <div class="goods-list-v2 gl-type-3 J-goods-list">
                <ul class="gl-warp" id="ulId">
                    <script id="t2" type="text/x-jquery-tmpl">
                        <li class="gl-item">
                        <div class="gl-i-wrap">
                            <div class="p-img">
                                <a target="_blank" href="/itemSearch/toProductDetail?itemId={{html Id}}">

                                  <img width="220" height="220" class="err-product" src={{html Image}}>
                                </a>
                            </div>
                            <div class="p-price">
                                <strong><em>￥</em><i>{{html Price/100}}</i></strong>
                            </div>
                            <div class="p-title" >
                             <a target="_blank" href="/itemSearch/toProductDetail?itemId={{html Id}}">
                               {{html Title}}
                            </div>
                            <div class="p-name p-name-type-2">
                               {{html SellPoint}}
                            </div>
                            <div class="p-shop" data-selfware="1" data-score="5" data-reputation="95" data-done="1">
                                <span class="J_im_icon"><a target="_blank" class="curr-shop" href="#" >{{html CompanyName}}</a></span>
                            </div>
                        </div>
                    </li>

                    </script>
                </ul>


            </div>
            <%--商品列表end--%>
            <div class="pagination-layout" style="clear: both">
                <div class="pagination">

                </div>
            </div>
        </div>

    </div>

</div>
<jsp:include page="public/footerBefore.jsp"></jsp:include>
<jsp:include page="public/footer.jsp"></jsp:include>
<jsp:include page="public/bottomjs.jsp"></jsp:include>
<!-- 模态框start -->
<div class="modal fade" id="contentCataModalFrame" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true"
     style="top: 200px">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">选择类目</h4>
            </div>
            <div class="modal-body">
                <div class="bd orderInfo">
                    <div class="shutiao-lt shutiao-lt0" style="overflow: auto">
                        <div class="tree-obj">
                            <div id="tree" class="ztree"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <strong id="failAlertStrong"></strong>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="choiceContentCata2()">确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 模态框end -->
</body>
<script src="/js/cms.js" type="text/javascript"></script>
</html>