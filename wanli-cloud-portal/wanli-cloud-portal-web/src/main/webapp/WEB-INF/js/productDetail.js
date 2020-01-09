/**
 * Created by zhangli on 2017/12/21.
 */
$(".attr a").click(function () {
    var $as = $(this).parent().parent().find("a");
    $.each($as, function (index, item) {
        $(item).css("border", "solid black 1px");
    });
    $(this).css("border", "solid red 1px");
})

$(".add-count").click(function () {

    var a = $(".count-input-filed").val();
    if (a == 99) {
        return;
    }
    a++;
    $(".count-input-filed").val(a);

})


$(".reduce-count").click(function () {

    var a = $(".count-input-filed").val();
    if (a == 0) {
        return;
    }
    a--;
    $(".count-input-filed").val(a);
})

//获取商品的属性字符串
function getEidstr() {
    var eids = new Array();
    $(".selected_sucaihuo").each(function () {
        var eid = $(this).data("id");
        eids.push(eid)
    })
    eids.sort();
    var eidstr = '';
    $.each(eids, function (i, obj) {
        if (i == 0) {
            eidstr = obj
            return
        }
        eidstr = eidstr + "|" + obj;
    })
    return eidstr;
}


function form_check() {
    var eid = "";
    var selected_sucaihuo = "";

    $(".selected_sucaihuo").each(function () {
        eid += $(this).prev().data("id") + ",";
        selected_sucaihuo += $(this).data("id") + ",";
    })
    $("#selected_sucaihuo").val(selected_sucaihuo);
    console.log(eid, selected_sucaihuo);
    return false;
}


$(function () {
    $(".yListr ul li em").click(function () {
        $(this).addClass("selected_sucaihuo").siblings().removeClass("selected_sucaihuo");
    })
    initSelectedEleAttr();

    $("em").unbind("click").bind("click", function () {
        $(this).addClass("selected_sucaihuo").siblings().removeClass("selected_sucaihuo");
        var eidstr = getEidstr();

        if (map[eidstr]) {
            location.href = '/itemSearch/toProductDetail?itemId=' + map[eidstr];
        } else {
            toastr.warning("商品未找到");
        }

    });
})

function initSelectedEleAttr() {

    $("em").each(function () {
        var eid = $(this).data("id");
        var index = $.inArray(eid, eids);
        if (index != -1) {
            $(this).addClass("selected_sucaihuo")
        }
    })
}

function serlizedata(accepts, _data) {
    var data = {
        data: _data
    };
    var post = [];
    $.each(data.data, function(index, item) {
        var tmp = [];
        for(var i in item) {
            tmp.push(accepts + "[" + index + "]." + i + "=" + item[i]);
        }
        post.push(tmp.join("&"))
    });
    return post.join("&");
}

$("#buy").click(function () {
    var itemId=$("#itemId").val();
    var num=$("#num").val()
    var itemDtoList=[]
    var item={}
    item.itemId=itemId;
    item.quantity=num;
    itemDtoList.push(item);

    $.ajax({
        url:'/portal/createorder',
        method:'get',
        data:serlizedata("itemDtoList",itemDtoList),
        success:function (data) {
            if(data.status==200){
                toastr.success("创建订单成功");
            }else if (data.status==1){
                toastr.error("请登录");
            }else if (data.status==400){
                toastr.error(data.msg);
            }
        },error:function () {
            toastr.error("创建订单失败");
        }

    })



})

$("#addIntoShopCart").click(function () {
    var itemId=$("#itemId").val();
    var num=$("#num").val()
    $.ajax({
        url:'http://localhost:8089/cart/add/'+itemId+'/'+num,
        type:'get',
        dataType:'jsonp',
        data:{},
        success:function (data) {

            if(data.status==200){
                toastr.success("添加购物车成功");
            }
        },error:function () {
            alert(0);
            toastr.error("添加购物车失败");
        }

    })
})





