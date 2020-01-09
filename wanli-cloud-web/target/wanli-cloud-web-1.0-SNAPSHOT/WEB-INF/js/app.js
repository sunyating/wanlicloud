//改变金额为星
function changeStar(obj, assets) {
    var $preObj = $(obj).prev();
    if ($preObj.text().indexOf("*") >= 0) {
        $preObj.text("￥" + assets);
    } else {
        $preObj.text("*****");
    }
}
//获取所有商品类型============================================================
var setting = {
    view: {
        //addHoverDom: addHoverDom,
        //removeHoverDom: removeHoverDom,
        selectedMulti: false
    }, callback: {
        onClick: zTreeOnClick
    },
    check: {
        enable: false
    },
    data: {
        simpleData: {
            //是否使用简单数据模式
            enable: true,
            //当前节点id属性
            idKey: "id",
            //当前节点的父节点id属性
            pIdKey: "parentId"
        }
    },
    edit: {
        enable: false
    }
};

function zTreeOnClick(event, treeId, treeNode) {
    $(".ibox-content").hide();
    $("#productType").val(treeNode.name);
    $("#cid").val(treeNode.tId.slice(9));
    $('#myModal').modal('hide');
};

$.getJSON("/seller/ajaxItemCategory", function (json) {

    $.fn.zTree.init($("#category"), setting, json.data);

});

var newCount = 1;
function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
        + "' title='add node' onfocus='this.blur();'></span>";
    sObj.after(addStr);
    var btn = $("#addBtn_" + treeNode.tId);
    if (btn) btn.bind("click", function () {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.addNodes(treeNode, {id: (100 + newCount), pId: treeNode.id, name: "new node" + (newCount++)});
        return false;
    });
};
function removeHoverDom(treeId, treeNode) {
    $("#addBtn_" + treeNode.tId).unbind().remove();
};
//=============================================================================-->


// 规格操作==========================================================================================================
// 添加规格
$("#confirmElementId").click(function () {
    var elements = $("#elementName").val().split(/[，,]/);
    $("#saleElementAttrDivId").empty();
    if (elements.length == 1 && elements[0] == "") {
        return;
    }
    if (elements.length > 3) {
        alert("最多只能输入三个元素！");
        return;
    }
    $('#template1').tmpl(elements).appendTo('#saleElementAttrDivId');
    var $button = $("<button>", {
        class: "btn btn-primary text-right",
        text: "添加",
        onClick: "showTable()"
    });
    $("#saleElementAttrDivId").append($button);
    return false;
});

//  增加规则
function showTable() {
    var divsLength = $("#saleElementAttrDivId").find("label").length;
    var attrName = new Array();
    var attrValue = new Array();
    var pId = $('#pName').val();
    for (var i = 0; i < divsLength; i++) {
        attrName.push($("#saleElementAttrDivId").find("label").eq(i).text());
        attrValue.push($("#saleElementAttrDivId").find("input").eq(i).val().split(/[，,]/));
    }
    if (pId.length == 0) {
        alert("请先选择货品");
        return;
    }
    $.ajax({
        type: "GET",
        url: "/seller/addProductElement",
        dataType: "json",
        data: "pId=" + pId + "&attrName=" + attrName.join("@") + "&attrValue=" + attrValue.join("@"),
        success: function () {
            $.getJSON("/seller/ajaxProdcuts", function (json) {
                guige = json;
                changeProduct(pId);
                $("#saleElementAttrDivId").empty();
                $("#elementName").val('');
                $("#guigeId").hide();
            });
        },
        error: function (msg) {
            alert('error' + msg);
        }
    });
}

//加载规则
function loadGuize(data) {
    //规则模板
    $('.sys_item_specpara').remove();
    $('#templateGuige').tmpl(data.productsElements).appendTo('.iteminfo_buying');

    //相关特效
    $("ul.sys_spec_text>li").first().addClass("selected");
    $("ul.sys_spec_text").each(function (i, item) {
        $(item).find("li:first-child").addClass("selected");
    });

    $("ul.sys_spec_text>li").click(function () {
        $(this).addClass("selected").siblings("li").removeClass("selected");
    });
}
//获得当前用户的所有货品
function changeProduct(id) {
    var product = {};
    product.id = id;
    $.getJSON("/seller/ajaxProdcuts", product, function (json) {
        loadGuize(json.data);
    });
}

// 显示规格开始================================================================================
//商品规格选择
$(".sys_item_spec .sys_item_specpara").each(function () {
    var i = $(this);
    var p = i.find("ul.sys_spec_text>li");
    p.click(function () {
        if (!!$(this).hasClass("selected")) {
            $(this).removeClass("selected");
            i.removeAttr("data-attrval");
        } else {
            $(this).addClass("selected").siblings("li").removeClass("selected");
            i.attr("data-attrval", $(this).attr("data-aid"))
        }
    })
});
//显示规格结束======================================================================================================

// 选中货品开始======================================================================================================
function selectProduct() {
    var eleAttrs = "";
    $.each($("li.selected"), function (index, ele) {
        eleAttrs += $(ele).attr("data-aid") + ",";
    })
    $("#eleAttrs").val(eleAttrs.substr(0,eleAttrs.length-1));

    $("#productId").val($("#pName").val());
    $("#productName").val($("#pName").find("option:selected").text() + " " + $(".sys_spec_text>li.selected").text());
    $("#aId").val($(".sys_spec_text>li.selected").data("aid"));
    $("#eId").val($(".sys_spec_text>li.selected").data("eid"));
}
// 选中货品结束======================================================================================================


// --菜单变色开始----------------------------------------------------
var menu = $('meta[name="menu"]')[0].content;

var as = $(".tree-obj>.tree-pent a");
as.each(function (i, val) {
    if (val.href.toString().includes(menu)) {
        $(as[i]).attr("class", "hover");
    }
});

// --菜单变色结束----------------------------------------------------


// uediotr开始============================================================
//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
/*var ue = UE.getEditor('editor');

 var myEditor = new UE.ui.Editor;
 myEditor.render('btnFileUpLoader');
 myEditor.ready(function() {
 myEditor.setDisabled();
 myEditor.hide();
 myEditor.addListener('beforeInsertImage', function(t, arg) {
 //因为可以上传多张,所以就用arg[0]
 var res = [];
 for (var i = 0; i < arg.length; i++) {
 res.push(arg[i].src);
 }
 $("#txtImgurl").attr("value", res);
 console.log(res);
 });
 myEditor.addListener('afterUpfile', function(t, arg) { //这里这个事件需要到 dialogs\attachment\attachment.html 中                        　　                 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　  //在editor.execCommand("insertHTML",str);前面添加
 $("#txtAttachments").attr("value", arg[0].url); //editor.fireEvent('afterUpfile', filesList);
 });
 });
 function upImage() {
 var m;
 m = myEditor.getDialog("insertimage");
 m.render();
 m.open();
 }
 function upFile() {
 var f;
 f = myEditor.getDialog("attachment");
 f.render();
 f.open();
 }*/
//在使用ueditor单独附件上传功能的时候点击"上传"按钮时不会出现 文件上传对话框,
//Uncaught TypeError: Cannot read property 'render' of undefined 这是因为在ueditor.config.js
//中对toolbars 配置是把 'attachment' 工具去掉了,只要添加上去就可以了
// ueditor结束=============================================================





