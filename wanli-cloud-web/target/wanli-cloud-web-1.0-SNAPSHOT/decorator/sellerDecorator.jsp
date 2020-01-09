<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title><sitemesh:write property="title"/></title>
    <%-- 页面头部样式开始----------------------------------------------------------%>
    <jsp:include page="sellerHead.jsp"/>
    <%-- 页面头部样式结束---------------------------------------------------------%>
    <sitemesh:write property="head"/>

</head>

<body>
<div class="main">
    <%--上边菜单开始-------------------------------------------------------------%>
    <jsp:include page="sellerTopMenu.jsp"/>
    <%--上边菜单结束-------------------------------------------------------------%>


    <%--正文开始-----------------------------------------------------------------%>
    <div class="perscenter-ui">
        <div class="main-layout">
            <div class="wrapper">
                <div class="content-layout">

                    <%--左边菜单开始-----------------------------------------------------%>
                    <jsp:include page="sellerLeftMenu.jsp"/>
                    <%--左边菜单结束-----------------------------------------------------%>

                    <sitemesh:write property="body"/>
                </div>
            </div>
        </div>
        <%--正文结束-----------------------------------------------------------------%>

    </div>


    <%--页脚开始   -------------------------------------------------------------------%>
    <jsp:include page="footer.jsp"/>
    <%--页脚结束   -------------------------------------------------------------------%>

    <%-- 底部js开始 --%>
    <jsp:include page="sellerBottom.jsp"/>
    <%-- 底部js结束 --%>




</body>
</html>