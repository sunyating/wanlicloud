<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="public/head.jsp"></jsp:include>
</head>

<body class="index">

<jsp:include page="public/menu.jsp"></jsp:include>
<div id="page-container">
    <div class="prodDetail">
        <div class="wrapper margin-wrapper">
            <div class="mainCon clearfix fouthlevel" style="width:1170px;margin: 0 auto;">

                <div class="productInfo fl" style="width: 500px">
                    <c:forEach items="${item.image}" var="image" begin="0" end="0">
                    <div id="preview" class="spec-preview" style="width: 350px;"><span class="jqzoom"><img
                            jqimg="${image}" src="${image}" style="width: 350px;"/></span></div>
                    </c:forEach>
                    <!--缩图开始-->
                    <div class="spec-scroll"><a class="prev">&lt;</a> <a class="next">&gt;</a>
                        <div class="items">
                            <ul>
                                <c:forEach items="${item.image}" var="image">
                                    <li><img bimg="${image}" src="${image}" onmousemove="preview(this);">
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!--缩图结束-->


                </div>
                <%--详情属性选择--%>
                <div class="productInfo fl" style="width: 810px">
                    <div>
                        <div class="yListr">
                            <form id="form_sucaihuo" method='post' onsubmit='return form_check()'>
                                <input type="hidden" id="pid" name="pid" value="22">
                                <input type="hidden" name="stock" id="stock" value="${item.stock}">
                                <input type="hidden" name="itemId" id="itemId" value="${item.id}">

                                <h2 class="title yListr">${item.title}</h2>
                                <h4 class="yListr" style="color: #E9630A">${item.sellPoint} </h4><br/>
                                <ul id="attr">
                                    <c:forEach items="${eleAttrDetailDto.tbProductsElements}" var="tbProductsElement">
                                        <li>
                                            <span data-id="${tbProductsElement.id}">选择${tbProductsElement.productTypeElements}：</span>
                                            <c:forEach items="${tbProductsElement.tbProductsElementsAttrs}"
                                                       var="tbProductsElementsAttr">
                                                <em data-id="${tbProductsElementsAttr.id}">${tbProductsElementsAttr.productsElementAttrName}<i></i></em>
                                            </c:forEach>
                                        </li>
                                    </c:forEach>


                                </ul>
                                <p class="colorp00">
                                    <span>价格：</span> <span>￥${item.price/100} </span>
                                </p>

                                <div class="count-control " style="margin-top: 15px;">
                                    <span class="numSpan">数量：</span>
                                    <a href="javascript:;" class="reduce-count"></a>
                                    <input class="count-input-filed" id="num" value="1">
                                    <a href="javascript:;" class="add-count"></a>
                                </div>

                                <div style="clear:both">
                                    <input type="button" id="addIntoShopCart" class="YImmediatelyininstallment"
                                           value="加入购物车"/>
                                    <input type="button" id="buy" class="YImmediatelyininstallment"  value="立即购买"/>
                                </div>
                            </form>


                        </div>

                    </div>
                </div>
                <div class="clearInfo">
                </div>
                <div>${eleAttrDetailDto.description}</div>
            </div>

        </div>
        <%--详情属性选择end--%>
    </div>
</div>
</div>
</div>

<jsp:include page="public/footerBefore.jsp"></jsp:include>
<jsp:include page="public/footer.jsp"></jsp:include>
<jsp:include page="public/bottomjs.jsp"></jsp:include>
<script type="text/javascript" src="/js/productDetail.js"></script>
</body>


<script>
    var map =${relationMap};
    var eids = ${itemEIds};
</script>
</html>