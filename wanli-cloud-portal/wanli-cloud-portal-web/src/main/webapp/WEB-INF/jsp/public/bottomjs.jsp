<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="/js/bootstrap.js" type="text/javascript"></script>
<script src="/js/jquery.tmpl.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/toastr.js"></script>
<script type="text/javascript" src="/js/jquery.ztree.all.js"></script>
<script type="text/javascript" src="/js/jqPaginator.js"></script>

<script type="text/javascript" src="/js/jquery.jqzoom.js"></script>
<script type="text/javascript" src="/js/jq22.js"></script>

<script type="text/javascript">
    $(function(){
        toastr.options=
            {
                "closeButton":false,//显示关闭按钮
                "debug":false,//启用debug
                "positionClass":"toast-top-center",//弹出的位置
                "showDuration":"300",//显示的时间
                "hideDuration":"1000",//消失的时间
                "timeOut":"3000",//停留的时间
                "extendedTimeOut":"1000",//控制时间
                "showEasing":"swing",//显示时的动画缓冲方式
                "hideEasing":"linear",//消失时的动画缓冲方式
                "showMethod":"fadeIn",//显示时的动画方式
                "hideMethod":"fadeOut"//消失时的动画方式
            };

    });
</script>
