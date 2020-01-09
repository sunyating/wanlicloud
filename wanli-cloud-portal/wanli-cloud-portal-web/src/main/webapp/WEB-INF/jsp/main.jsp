<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="public/head.jsp"></jsp:include>
</head>

<body class="index">

<jsp:include page="public/menu.jsp"></jsp:include>

<div id="page-container">
    <div id="container">
        <!-- 轮播图片 -->
        <div id="myCarousel" class="carousel slide">
            <div id="bannerdiv" class="carousel-inner">
                <%--<div class="item active">--%>
                <%--<img src="/tempFiles/1489055567872.png" alt="First slide" class="imgClass">--%>
                <%--</div>--%>

            </div>
            <!-- 轮播（Carousel）指标 -->
            <div class="hd">
                <ol id="bannerol" class="carousel-indicators clearfix onClass">
                    <%--<li data-target="#myCarousel" data-slide-to="0" class="active"></li>--%>
                </ol>
            </div>
        </div>

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-left: 20%;">

            <div class="wrapper wrapper_menu">
                <div class="index_products_tit">推荐产品</div>
                <div id="hotdiv" class="con clearfix carousel-inner" role="listbox">
                    <div class="item fl item active">
                        <img class="home-item-img" src="/tempFiles/1496209504176.jpg"><br>

                        <div class="title ng-binding">小米手机</div>
                        <button type="button" class="b2Btn btn" onclick="productDetail()">查看详情</button>
                    </div>
                    <div class="item fl item active">
                        <img class="home-item-img" src="/tempFiles/1496209504176.jpg"><br>

                        <div class="title ng-binding">小米手机</div>
                        <button type="button" class="b2Btn btn" onclick="productDetail()">查看详情</button>
                    </div>
                    <div class="item fl item active">
                        <img class="home-item-img" src="/tempFiles/1496209504176.jpg"><br>

                        <div class="title ng-binding">小米手机</div>
                        <button type="button" class="b2Btn btn" onclick="productDetail()">查看详情</button>
                    </div>
                    <div class="item fl item active">
                        <img class="home-item-img" src="/tempFiles/1496209504176.jpg"><br>

                        <div class="title ng-binding">小米手机</div>
                        <button type="button" class="b2Btn btn" onclick="productDetail()">查看详情</button>
                    </div>
                    <div class="item fl item active">
                        <img class="home-item-img" src="/tempFiles/1496209504176.jpg"><br>

                        <div class="title ng-binding">小米手机</div>
                        <button type="button" class="b2Btn btn" onclick="productDetail()">查看详情</button>
                    </div>
                    <div class="item fl item active">
                        <img class="home-item-img" src="/tempFiles/1496209504176.jpg"><br>

                        <div class="title ng-binding">小米手机</div>
                        <button type="button" class="b2Btn btn" onclick="productDetail()">查看详情</button>
                    </div>
                    <div class="item fl item active">
                        <img class="home-item-img" src="/tempFiles/1496209504176.jpg"><br>

                        <div class="title ng-binding">小米手机</div>
                        <button type="button" class="b2Btn btn" onclick="productDetail()">查看详情</button>
                    </div>

                    <div class="item fl item active">
                        <img class="home-item-img" src="/tempFiles/1496209504176.jpg"><br>

                        <div class="title ng-binding">小米手机</div>
                        <button type="button" class="b2Btn btn" onclick="productDetail()">查看详情</button>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

<jsp:include page="public/footerBefore.jsp"></jsp:include>
<jsp:include page="public/footer.jsp"></jsp:include>
<jsp:include page="public/bottomjs.jsp"></jsp:include>
<script type="text/javascript">

    $(function () {
        $('.carousel').carousel({
            interval: 1000
        });

        var json = [
            {
                "id": 1,
                "categoryId": 5,
                "title": "标题",
                "subTitle": "子标题",
                "description": "描述",
                "url": "https://www.jd.com/",
                "picture": "https://img1.360buyimg.com/da/jfs/t15391/340/525129259/155104/523ef4fd/5a309136Nc1f93051.jpg",
                "status": 1
            },
            {
                "id": 2,
                "categoryId": 5,
                "title": "标题",
                "subTitle": "子标题",
                "description": "描述",
                "url": "https://www.jd.com/",
                "picture": "https://img10.360buyimg.com/babel/jfs/t15574/285/525833415/194778/8d6930c5/5a33c0b8N079b3616.jpg",
                "status": 1
            },
            {
                "id": 3,
                "categoryId": 5,
                "title": "标题",
                "subTitle": "子标题",
                "description": "描述",
                "url": "https://www.jd.com/",
                "picture": "https://img30.360buyimg.com/da/jfs/t16156/354/403464945/97503/a0c34b9/5a31015fN8a68e955.jpg",
                "status": 1
            }
        ];

        $.each(json, function (i, contentCategory) {
            if (i == 0) {
                var $div = $("<div>", {
                    class: "item active",
                    onclick: "show('" + contentCategory.url + "')",
                })

                var $image = $("<img>", {
                    src: contentCategory.picture,
                    class: "imgClass"
                })
                $div.append($image);

                $("#bannerdiv").append($div);
                var $li = $("<li>", {
                    "data-target": "#myCarousel",
                    "data-slide-to": i,
                    class: "active"
                })
                $("#bannerol").append($li);

            } else {
                var $div = $("<div>", {
                    class: "item",
                    onclick: "show('" + contentCategory.url + "')",
                })

                var $image = $("<img>", {
                    src: contentCategory.picture,
                    class: "imgClass"
                })
                $div.append($image);

                $("#bannerdiv").append($div);
                var $li = $("<li>", {
                    "data-target": "#myCarousel",
                    "data-slide-to": i
                })
                $("#bannerol").append($li);
            }

        });

    })

    function show(url) {
        alert(url);
        location.href = url;
    }
</script>
</body>


<%--超链接--%>
<%--<a href="${'${'}linkurl}"> </a>--%>

</html>