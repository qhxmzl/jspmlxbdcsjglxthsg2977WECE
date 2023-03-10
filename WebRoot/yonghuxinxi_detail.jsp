<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>用户信息详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"yonghuxinxi");
     %>
  用户信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%' height=44>账号：</td><td width='39%'><%=m.get("zhanghao")%></td>
<td  rowspan=7 align=center><a href=<%=m.get("touxiang")%> target=_blank><img src=<%=m.get("touxiang")%> width=228 height=215 border=0></a></td></tr><tr>
<td width='11%' height=44>密码：</td><td width='39%'><%=m.get("mima")%></td>
</tr><tr>
<td width='11%' height=44>姓名：</td><td width='39%'><%=m.get("xingming")%></td>
</tr><tr>
<td width='11%' height=44>性别：</td><td width='39%'><%=m.get("xingbie")%></td>
</tr><tr>
<td width='11%' height=44>年龄：</td><td width='39%'><%=m.get("nianling")%></td>
</tr><tr>
<td width='11%' height=44>地区：</td><td width='39%'><%=m.get("diqu")%></td>
</tr><tr>
<td width='11%' height=44>手机号：</td><td width='39%'><%=m.get("shoujihao")%></td>
</tr><tr>

<td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



