<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <title>发布商品</title>
    <meta name="menu" content="toSellerUploadGoods"/>
</head>
<body>

<script id="template1" type="text/x-jquery-tmpl">
        <label class="control-label" style="background: no-repeat;">${'${'}$data}</label>:
        <input type="text"  class="wlong goods-title form-control"/>
</script>


<%--选择货品模态框开始===============================================================================--%>
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">货品规则</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="pName" class="col-sm-2 control-label">货品名称</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="pName" onchange="changeProduct(this.value)">
                                <option value="">请选择</option>
                                <c:forEach items="${productsDtos}" var="product">
                                    <option value="${product.id}">${product.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>

                <div class="iteminfo_buying">
                    <!--规格属性-->
                    <div class="sys_item_spec">
                        <script id="templateGuige" type="text/x-jquery-tmpl">
                           <dl class="clearfix iteminfo_parameter sys_item_specpara"  data-sid=" ${'${'}productTypeId}abc">
                                <dt>${'${'}productTypeElements} </dt>
                                <dd>
                                    <ul class="sys_spec_text">
                                        {{each productsElementsAttrs}}
                                            <li data-aid="${'${'}$value.id}"  data-eid="${'${'}$value.productsElementId}"><a href="javascript:;" title="${'${'}$value.productsElementAttrName} ">${'${'}$value.productsElementAttrName} </a><i></i></li>
                                        {{/each}}
                                    </ul>
                                </dd>
                            </dl>

                        </script>
                    </div>
                    <!--规格属性-->
                </div>
                <button class="btn btn-primary text-right" onclick="$('#guigeId').show();">增加</button>
            </div>

            <div id="guigeId" style="display: none;">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="elementName" class="col-sm-2 control-label">规格名称</label>
                        <div class="col-sm-5">
                            <input type="text" class="goods-title form-control" id="elementName" name="elementName">
                        </div>
                        <div class="col-sm-3">
                            <button class="btn" id="confirmElementId">添加规格</button>
                        </div>
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="elementName" class="col-sm-2 control-label text-left">规则属性</label>
                        <div class="col-sm-5" id="saleElementAttrDivId">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="selectProduct()">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--选择货品模态框结束=========================================================================--%>

<form id="frm" class="form-horizontal editgoods grey edit-goods-new distProduct" action="/seller/uploadGood" method="post"  onsubmit="return false">
    <h2>商品基本信息</h2>

    <div class="form-group">
        <label for="productName" class="col-sm-2 control-label">商品名称：</label>
        <div class="col-sm-6">
            <input type="hidden" readonly id="productId" name="pid"/>
            <input type="hidden" readonly id="eId"/>
            <input type="hidden" readonly id="aId"/>
            <input type="text" class="form-control" readonly id="productName" placeholder="请选择商品名称" name="title"/>
        </div>
        <div class="col-sm-3">
            <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal3">
                选择商品
            </button>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">商品类型：</label>
        <div class="col-sm-6">
            <input class="filter-input-filed" id="cid" type="hidden" name="cid">
            <input class="filter-input-filed form-control" placeholder="请选择商品类型" readonly id="productType"
                   data-toggle="modal" data-target="#myModal" type="text">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">卖点：</label>
        <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="sellPoint" placeholder="请输入卖点"
                   type="text" name="sellPoint">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">价格：</label>
        <div class="col-sm-6">
            <div class="input-group">
                <div class="input-group-addon">￥</div>
                <input type="text" class="form-control" placeholder="请输入价格" id="showPrice" name="showPrice">
                <input type="hidden" id="price" name="price">
                <div class="input-group-addon">元</div>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">库存：</label>
        <div class="col-sm-6">
            <input class="filter-input-filed form-control" placeholder="请输入库存" id="stock" type="text" name="stock">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">图片：</label>
        <div class="col-sm-6" >
            <input type="hidden" id="txtImgurl" name="images" />
            <input type="button"  class="btn btn-primary btn-lg" id="btnImageUpLoader" value="上传图片" onclick="upImage()"/>
            <textarea id="uploadEditor" style="display: block;"></textarea>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">上架时间：</label>
        <div class="col-sm-6">
            <input class="filter-input-filed form-control" placeholder="请选择上架时间" readonly id="onTime" name="onTime"
                   type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" >
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">下架时间：</label>
        <div class="col-sm-6">
            <input class="filter-input-filed form-control" placeholder="请选择下架时间" readonly id="offTime" name="offTime"
                   type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" >
        </div>
    </div>

    <input type="hidden" id="eleAttrs" name="eleAttrs" readonly>

    <div class="form-group">
        <label for="productName" class="col-sm-2 control-label">

            <button class="btn btn-primary " onclick="upload()" >
                增加商品
            </button>
        </label>
        <div class="col-sm-3">

        </div>
    </div>

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
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>


    <script type="text/javascript">
        // 实例化编辑器，这里注意配置项隐藏编辑器并禁用默认的基础功能。
        var uploadEditor = UE.getEditor("uploadEditor"                                                  );

        uploadEditor.ready(function() {
            uploadEditor.setDisabled();
            uploadEditor.hide();
            uploadEditor.addListener('beforeInsertImage', function(t, arg) {
                //因为可以上传多张,所以就用arg[0]
                var res = [];
                for (var i = 0; i < arg.length; i++) {
                    res.push(arg[i].src);
                    $("#btnImageUpLoader").attr("style","margin-top: -100px;margin-right: 20px;");
                    $("#btnImageUpLoader").after("<img style='margin: 10px' src='"+arg[i].src+"' width='100' height='100' >");
                }
                $("#txtImgurl").attr("value", res);
            });
        });

        function upImage() {
            var m;
            m = uploadEditor.getDialog("insertimage");
            m.render();
            m.open();
        }

        function checkForm() {
            var flag=true;
            $("#frm input[type='text']").each(function (i, obj) {
                if (null == this.value ||"" == this.value || undefined==this.value) {
                    toastr.error($(obj).prop("placeholder"))
                    flag=false;
                    return false;
                }
            })
            return flag;
        }

        function upload() {
            $("#frm").attr("action","/seller/uploadGood");
            with($("#frm").get(0)){
                if(checkForm())
                    submit();
                toastr.success("发布商品成功")
            }
        }


        $(function () {
            $("#showPrice").blur(function(){
                //把价格转成分存储
                $("#price").val($("#showPrice").val()*100);
            })
        })

    </script>
</form>
</body>

</html>