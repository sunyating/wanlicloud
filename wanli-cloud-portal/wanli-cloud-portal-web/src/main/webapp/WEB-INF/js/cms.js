$(function () {
    // 土司提示初始化
    toastr.options =
        {
            "closeButton": false,//显示关闭按钮
            "debug": false,//启用debug
            "positionClass": "toast-top-center",//弹出的位置
            "showDuration": "300",//显示的时间
            "hideDuration": "1000",//消失的时间
            "timeOut": "5000",//停留的时间
            "extendedTimeOut": "1000",//控制时间
            "showEasing": "swing",//显示时的动画缓冲方式
            "hideEasing": "linear",//消失时的动画缓冲方式
            "showMethod": "fadeIn",//显示时的动画方式
            "hideMethod": "fadeOut"//消失时的动画方式

        };
    initZtree();

    portalSearch(1);


});


function initZtree() {

    var setting = {
        view: {
            selectedMulti: false
        },
        async: {

            enable: true,
            url: "/itemSearch/queryItemCategory",
            autoParam: ["id"],//点击+号时自动提交该节点的id属性，并刷新该节点下的节点
            dataFilter: filter
        },
        edit: {
            enable: false //是否可编辑
        },
        data: {
            simpleData: {enable: true}
        },
        callback: {
            beforeRemove: beforeRemove,//点击X号删除时触发的方法
            // onClick: queryContent,//点击每个节点触发的事件
            // beforeDrag: zTreeBeforeDrag//拖拽事件
        }
    };
    // 初始化树结构
    var tree = $.fn.zTree.init($("#tree"), setting);
}
function filter(treeId, parentNode, childNodes) {
    if (!childNodes) return null;
    for (var i = 0, l = childNodes.length; i < l; i++) {
        childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
    }
    return childNodes;
}
//禁止拖拽 就返回flase
function zTreeBeforeDrag(treeId, treeNodes) {
    return false;
};


//点击删除X按钮触发的事件
function beforeRemove(treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    var str = "该节点为父节点，"
    zTree.selectNode(treeNode);
    var a;
    if (treeNode.isParent) {
        a = confirm(str + "确认删除 节点 -- " + treeNode.name + " 吗？");
    } else {
        a = confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
    }
    if (a) {
        //到后台删除该节点的数据
        removeContentCatagory(treeNode.id);
        //移除该节点
        zTree.removeNode(treeNode);
    }
    return a;
}


//展现模态框
function showModalframe() {

    $("#contentCataModalFrame").modal("show");


}

//确认选择一个所属类目
function choiceContentCata2(pageNum) {
    var treeObj = $.fn.zTree.getZTreeObj("tree");
    var nodes = treeObj.getSelectedNodes();
    var productType = nodes[0].name;
    var pid = nodes[0].id;

    if (null != nodes && nodes.length != 0) {

        var flag = isParent(pid);
        if (flag) {
            var queryStr = $("#ser").val();
            $(".search-goods").html(productType);
            $("#contentCataModalFrame").modal("hide");
            itemCategorySearch(pageNum, productType, queryStr);

        }

    } else {
        toastr.warning("请选择一个类目");
        return;
    }


}

function canelChoiceContentCata() {
    $("#contentCataModalFrame").modal("hide");
}

function pageSearch(pageInfo, name) {
    var if_firstime = true;

    var serName = name;
    $('.pagination').jqPaginator({
        totalPages: pageInfo.total,
        pageSize: pageInfo.pageSize,
        visiblePages: 10,
        currentPage: pageInfo.pageNum,

        first: '<li class="first"><a href="javascript:void(0);">第一页</a></li>',
        prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
        next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
        last: '<li class="last"><a href="javascript:void(0);">最末页 </a></li>',
        page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',

        onPageChange: function (num) {
            if (if_firstime) {
                if_firstime = false;
            } else if (!if_firstime) {
                var treeObj = $.fn.zTree.getZTreeObj("tree");
                var nodes = treeObj.getSelectedNodes();
                var productType;
                if(nodes[0]!=undefined){
                    productType = nodes[0].name;
                }else {
                    productType="";
                }
                var searchString = $("#ser").val();
                itemCategorySearch(num,productType,searchString);

            }
        }
    });
}

function itemCategorySearch(pageNum, productType, queryStr) {
    var rows = 10;
    if (pageNum === undefined) {
        pageNum = 1;
    }
    if ("所有商品" == productType) {
        productType = "";
    }

    $.ajax({
        url: '/itemSearch/queryItem', //请求的URL
        async: true,
        timeout: 10000, //超时时间设置，单位毫秒
        type: 'post', //请求方式，get或post
        data: { //请求所传参数，json格式
            productType: productType,
            searchString: queryStr,
            pageNum: pageNum,
            rows: rows
        },
        dataType: 'json',
        success: function (data) {
            if (data.status != 200) {
                toastr.error(data.msg);
                return false;
            }
            $("#ulId li").remove();
            var itemDetails = [];
            $.each(data.data.itemList, function (i, item) {
                var itemDetail = {};
                itemDetail.Price = item.price;
                itemDetail.Id = item.id;
                itemDetail.Title = item.title;
                var firstImage;

                if(null != item.image && undefined !=item.image){
                    firstImage=item.image.split(",")[0];
                }else {
                    firstImage=item.image
                }
                itemDetail.Image =firstImage;
                itemDetail.SellPoint = item.sellPoint;
                itemDetail.CompanyName = item.companyName;
                itemDetails[i] = itemDetail;
            })
            $('#t2').tmpl(itemDetails).appendTo('#ulId');
            var pageInfo = {};
            pageInfo.total = data.data.totalPages;
            pageInfo.pageNum = pageNum;
            pageInfo.pageSize = rows;
            if (data.data.recordCount != 0) {
                pageSearch(pageInfo, name);
            }

        }
    });
}

//该ajax相应 中data请求数据 缺少调用接口数据名  需要补充


function portalSearch(pageNum) {

    var searchString = $("#ser").val();
    var productType = $(".search-goods").val();

    itemCategorySearch(pageNum, productType, searchString);


}

function isParent(pid) {

    var isParent = true;
    if (pid == 1) {
        return true;
    }
    $.ajax({
        url: '/itemSearch/isParent',
        timeout: 10000,
        type: 'post', //请求方式，get或post
        data: { //请求所传参数，json格式
            id: pid
        },
        async: false,
        dataType: 'json',
        success: function (data) {
            if (data.status == 400) {
                toastr.error(data.msg);
                isParent = false;
            }
        }
    });

    return isParent;
}