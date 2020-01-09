<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="public/head.jsp"></jsp:include>

</head>

<body ng-controller="indexCtrl" class="index ng-scope">

<jsp:include page="public/menu.jsp"></jsp:include>


<div ng-view="" id="page-container" class="ng-scope">
    <div class="advantage">
    </div>
</div>
<jsp:include page="public/footerBefore.jsp"></jsp:include>
<jsp:include page="public/footer.jsp"></jsp:include>
<jsp:include page="public/bottomjs.jsp"></jsp:include>

<script>
    $(function () {
        $.ajax({
            type: "get",
            url: "/toindex/toProductAdvantage",
            success: function (result) {
                console.log(result);


                $.each(result.object, function (index, ele) {

                    //创建一个section完整的标签
                    var $section = $("<section>");

                    var $div1 = $("<div>", {
                        class: "section-main-img"
                    });
                    var $h3 = $("<h3>", {
                        text: ele.name
                    });
                    var $div2 = $("<div>", {
                        class: "type-desc"
                    });
                    var $img1 = $("<img>", {
                        src: ele.iconUrl
                    })
                    var $p = $("<p>", {
                        text: ele.typeDetail

                    })
                    var $div3 = $("<div>", {
                        class: "type-prod"
                    });

                    $.each(ele.productInfoDtos, function (i, e) {
                        if (i < 2) {
                            var $a = $("<a>", {
                                class: "prod-item",
                                href: "/toindex/toProductDetail?productId=" + e.productId
                            });
                            var $img2 = $("<img>", {
                                src: e.picsUrl
                                //src:"../files/1489559173709.jpg"
                            });
                            var $span = $("<span>", {
                                text: e.productName
                            });
                            $a.append($img2).append($span);
                            $div3.append($a);
                        }
                    });

                    /*超过8个显示更多*/
                    if (ele.productInfoDtos.length > 2) {
                        var $aMore = $("<a>", {
                            class: "prod-item",
                            href: "/toindex/toMarketMenu?productTypeCd=" + ele.productTypeId
                        });
                        var $spanMore = $("<span>", {
                            text: "...更多"
                        });
                        $aMore.append($spanMore);
                        $div3.append($aMore);
                    }
                    $div2.append($img1).append($p)
                    $div1.append($h3).append($div2).append($div3);
                    $section.append($div1);
                    $(".advantage").append($section);
                });

            },
            error: function () {
                alert("请求失败!");
            }

        });
    });


</script>

</body>
</html>