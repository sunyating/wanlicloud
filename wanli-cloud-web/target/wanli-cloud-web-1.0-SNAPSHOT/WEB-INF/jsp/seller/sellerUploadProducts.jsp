<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <title>发布货品</title>
    <meta name="menu" content="toSellerUploadProducts"/>
    <script type="text/javascript" charset="utf-8" src="/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>

<div class="form-horizontal editgoods grey edit-goods-new distProduct">
    <h2>商品基本信息</h2>

    <div class="form-group">
        <label class="col-sm-2 control-label">货品名称：</label>
        <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="prodName" placeholder="请输入货品" type="text">
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">货品描述：</label>
        <div class="col-sm-6">
<%--            <textarea id="editor" type="text/plain" style="width:664px;height:500px;">--%>
            <script id="editor" type="text/plain" style="width: 664px;height:500px;"></script>
            </textarea>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-6">
            <button class="btn btn-primary btn-lg" type="submit" onclick="getContent()">提交</button>
        </div>
    </div>

</div>





<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="/js/fwb.js"></script>


</body>


</html>