<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>信息管理</title>
    <meta name="menu" content="getSellerAccount"/>
</head>

<body>
    <div class="person-details">
        <div class="require-details dingdan-details">
            <div class="text-slide">
                <div class="hd">
                    <ul>
                        <li class="on"><span>信息管理</span></li>
                    </ul>
                </div>
                <div class="bd">
                    <div class="register-layout">
                        <form id="qiyexinx" action="/seller/updateSellerAccount">
                            <ul class="reg">
                                <li class="re-address">
                                    <label>公司名称:</label>
                                    <div class="rits-ui">
                                        <input type="text" name="companyName" value="${sellerAccount.companyName}">
                                    </div>
                                </li>

                                <li class="re-address">
                                    <label><span>*</span>公司地址:</label>
                                    <div class="rits-ui">
                                        <input type="text" class="address" name="companyAddress" value="${sellerAccount.companyAddress}">
                                    </div>
                                </li>

                                <li class="re-7">
                                    <label><span>*</span>用户名:</label>
                                    <div class="rits-ui">
                                        <input type="text" name="userName" value="${sellerAccount.userName}">
                                    </div>
                                </li>

                                <li class="">
                                    <label><span>*</span>联系电话:</label>
                                    <div class="rits-ui">
                                        <input type="text" name="phone" id="phone" value="${sellerAccount.phone}">
                                    </div>
                                </li>
                                <li class="">
                                    <label>E-mail:</label>
                                    <div class="rits-ui">
                                        <input type="text" name="email" id="email" value="${sellerAccount.email}">
                                    </div>
                                </li>
                               <%-- <li class="re-people">
                                    <label><span>*</span>公司员工人数:</label>

                                    <div class="rits-ui cl-6">

                                        <div class="peopleNum fl">
                                            <input type="text" name="employeeNum" id="employeeNum" value="500" data-id="0">
                                        </div>

                                        <div class="peopleNum fl">
                                            <label class="fl"><span>*</span>研发人数:</label>
                                            <input type="text" name="researchNum" id="researchNum" value="200">
                                        </div>
                                        <div class="peopleNum fl">
                                            <label class="fl"><span>*</span>销售人数:</label>
                                            <input type="text" name="sellNum" id="sellNum" value="100">
                                        </div>

                                    </div>

                                </li>--%>

                                <%--<li class="">
                                    <label><span>*</span>产品所属行业:</label>
                                    <div class="rits-ui">
                                        <div class="btn-group">

                                            <button type="button" class="btn btn-default dropdown-toggle"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                                <input class="xz-content " id="industryNameValue" value="服装"> <span
                                                    class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li data-id="2">
                                                    <a href="javascript:;" ng-bind="item.title"
                                                       id="${productsIndustryList.dId}"
                                                       onclick="chooseIndusttry(this)">电器</a>
                                                </li>
                                                <li ng-repeat="item in manageMap" data-id="2">
                                                    <a href="javascript:;" ng-bind="item.title"
                                                       id="${productsIndustryList.dId}"
                                                       onclick="chooseIndusttry(this)">家具</a>
                                                </li>
                                                <li ng-repeat="item in manageMap" data-id="2">
                                                    <a href="javascript:;" ng-bind="item.title"
                                                       id="${productsIndustryList.dId}"
                                                       onclick="chooseIndusttry(this)">手机</a>
                                                </li>
                                                <li ng-repeat="item in manageMap" data-id="2">
                                                    <a href="javascript:;" ng-bind="item.title"
                                                       id="${productsIndustryList.dId}"
                                                       onclick="chooseIndusttry(this)">玩具</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>--%>
                          <%--      <li class="re-afterservice">
                                    <label><span>*</span>售后联系方式:</label>
                                    <div class="rits-ui">
                                        <span>电话</span>
                                        <input type="text" name="afterPhone" id="afterPhone" value="0258945428">
                                    </div>
                                    <div class="rits-ui">
                                        <span>邮箱</span>
                                        <input type="text" name="mail" id="mail" value="64435@qq.com">
                                    </div>
                                    &lt;%&ndash;<div class="rits-ui">
                                        <span>微信</span>
                                        <input type="text" name="weixin" value="weixin">
                                    </div>
                                    <div class="rits-ui">
                                        <span>微博</span>
                                        <input type="text" name="blog" value="weibo">
                                    </div>&ndash;%&gt;
                                </li>--%>
                                <li class="re-10 button-link">
                                    <label>1</label>
                                    <div class="rits-ui">
                                        <button type="submit">保存修改</button>
                                    </div>
                                </li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>