<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>问卷信息详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"wenjuanxinxi");
     %>
  问卷信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%'>问题：</td><td width='39%'><%=m.get("wenti")%></td>
<td width='11%'>选项A：</td><td width='39%'><%=m.get("xuanxiangA")%></td></tr><tr>
<td width='11%'>选项B：</td><td width='39%'><%=m.get("xuanxiangB")%></td>
<td width='11%'>选项C：</td><td width='39%'><%=m.get("xuanxiangC")%></td></tr><tr>
<td width='11%'>选项D：</td><td width='39%'><%=m.get("xuanxiangD")%></td>
<td width='11%'>票数A：</td><td width='39%'><%=m.get("piaoshuA")%></td></tr><tr>
<td width='11%'>票数B：</td><td width='39%'><%=m.get("piaoshuB")%></td>
<td width='11%'>票数C：</td><td width='39%'><%=m.get("piaoshuC")%></td></tr><tr>
<td width='11%'>票数D：</td><td width='39%'><%=m.get("piaoshuD")%></td>
<td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



