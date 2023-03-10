<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<header class="header clearfix" id="header-sec">
    <nav class="navbar navbar-default navbar-fixed-top" id="main-nav">
        <div class="navbar-header">
            <a class="navbar-toggle mmenu-btn" href="#mmenu">
                            <span class="icon-bar">
                            </span>
                <span class="icon-bar">
                            </span>
                <span class="icon-bar">
                            </span>
            </a>
            <a class="navbar-brand" href="index.jsp">
                <img alt="Logo" src="qtimages/logo.png" />&nbsp;流行病调查数据管理系统
            </a>
            <%
                if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
            %>
            <a style="margin-top:5px; margin-left: 10px; cursor:pointer; display: inline-block;" href="userlog.jsp" >登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a style="margin-top:5px; cursor:pointer;display: inline-block;" href="yonghuxinxiadd.jsp" >注册</a>
            <%}else{ %>
            <%=request.getSession().getAttribute("username")%>,[ <%=request.getSession().getAttribute("cx")%>]&nbsp; <a style="margin-top:5px; margin-left: 10px; cursor:pointer; display: inline-block;" href="logout.jsp" onclick="return confirm('确定要退出？')" >退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a style="margin-top:5px; margin-left: 10px; cursor:pointer; display: inline-block;" href="main.jsp" >后台</a>
            <%} %>
        </div>
        <div class="navbar-collapse collapse" id="navigation">
            <ul class="nav navbar-nav navbar-right">
                <li class="Lev1" id="nav_12"><a href="index.jsp" class="menu1">首页</a></li>

                <li class="Lev1 drop" id="nav_4">
                    <a style="cursor:pointer" class="menu1">资讯信息 <i class="fa fa-caret-down"></i></a>
                    <ul class="drop-down sub-menu2">
                        <li class="Lev2"><a href="news.jsp?lb=流行病知识" class="menu2">流行病知识</a></li> <li class="Lev2"><a href="news.jsp?lb=症状及预防" class="menu2">症状及预防</a></li>
                    </ul>
                </li><li class="Lev1 drop" id="nav_4">
                <a style="cursor:pointer" class="menu1">公告信息 <i class="fa fa-caret-down"></i></a>
                <ul class="drop-down sub-menu2">
                    <li class="Lev2"><a href="dx_detail.jsp?lb=公告信息" class="menu2">公告信息</a></li>
                </ul>
            </li><li class="Lev1 drop" id="nav_4">
                <a style="cursor:pointer" class="menu1">问卷信息 <i class="fa fa-caret-down"></i></a>
                <ul class="drop-down sub-menu2">
                    <li class="Lev2"><a href="diaocha.jsp" class="menu2">问卷信息</a></li>
                </ul>
            </li>
                <li class="Lev1" id="nav_12"><a href="login.jsp" class="menu1">后台管理</a></li><%--后台登陆--%>
            </ul>
        </div>
    </nav>
</header>
<script type="text/javascript">
    <%
   String error = (String)request.getAttribute("error");
   if(error!=null)
   {
    %>
    alert("用户名或密码错误");
    <%}%>
    <%
  String random = (String)request.getAttribute("random");
  if(random!=null)
  {
   %>
    alert("验证码错误");
    <%}%>
</script>
