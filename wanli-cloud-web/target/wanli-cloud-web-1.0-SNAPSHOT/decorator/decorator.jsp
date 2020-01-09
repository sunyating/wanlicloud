<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><sitemesh:write property="title"/></title>
    <style type="text/css">
        body {
            font-size: 12px;
        }
    </style>
    <sitemesh:write property="head"/>
</head>
<body>
我是装饰器 : title的内容在这里 ~ <sitemesh:write property='title'/><br/>

我是装饰器 : body的内容在这里 ~ <sitemesh:write property='body'/><br/>

我是装饰器 : myTag的内容在这里 ~ <sitemesh:write property='sellerTopMenu'/><br/>
</body>
</html>