$(function () {
    function getCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg))
            return decodeURI(arr[2]);
        else
            return null;
    }
    var token = getCookie("USER_TOKEN");
    //alert(token)
    $.ajax({
        type: "get",
        dataType: "json",
        url: "http://localhost:8098/user/token/" + token,
        data: {},

        success: function (data) {
            $("#needLogin").addClass("sr-only")
            if (data!=null){
                $("#userInfo").html(data.userName + ',' + " 欢迎您！");
            }else {
                return false
            }
            if(data.roleId == 1) {
                $("#buyerCenter").removeClass("sr-only")
            }else if(data.roleId == 2){
                $("#sellerCenter").removeClass("sr-only")
                $("#goods").removeClass("hidden")
            }


        }

    });


})

function loginOut() {
    $.ajax({
        type: "get",
        dataType: "jsonp",
        url: "http://localhost:8098/user/loginOut",
        data: {},
        success: function (data) {
            console.info(data)
            if(data.status==200){
                window.location.href="http://localhost:8078/portal/toMain"
            }
        }
    });
}