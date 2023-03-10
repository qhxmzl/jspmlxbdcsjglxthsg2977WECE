<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>流行病调查数据管理系统</title>
    <link rel="stylesheet" href="images/layui/css/layui.css" media="all">
    <script src="images/layui/layui.js"></script>
    <script src="images/js/jquery-1.9.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">流行病调查数据管理系统</div>
        <ul class="layui-nav layui-layout-left">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="images/touxiang.jpg" class="layui-nav-img">
                    <%=request.getSession().getAttribute("username")%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a>权限：[<%=request.getSession().getAttribute("cx")%>]</a></dd>
                    
                </dl>
            </li>
            <li class="layui-nav-item"><a href="logout.jsp">退出登录</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
		 <ul class="layui-nav layui-nav-tree" lay-filter="test">
					                        <%
if (request.getSession().getAttribute("cx").equals("超级管理员") || request.getSession().getAttribute("cx").equals("普通管理员")){%><%@ include file="left_guanliyuan.jsp"%><%}
if (request.getSession().getAttribute("cx").equals("用户")){%><%@ include file="left_yonghu.jsp"%><%}

%>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div style="padding: 0px;height: 100%;width: 100%;">
            <iframe src="sy.jsp" name="hsgmain" style="border: 0px solid blue;height: 100%;width: 100%;scrolling:auto;"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        @ 流行病调查数据管理系统 欢迎使用本系统
    </div>
</div>

<script>
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>
