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
            console.info(data)
            $("#userInfo").html("用户：<em>" + data.userName + "</em>");
        }
    });
})
function loginOut() {
    $.ajax({
        type: "get",
        dataType: "jsonp",
        url: "http://localhost:8081/user/loginOut",
        data: {},
        success: function (data) {
            console.info(data)
            if(data.status==200){
                window.location.href="http://localhost:8087/portal/toMain"
            }
        }
    });
}

