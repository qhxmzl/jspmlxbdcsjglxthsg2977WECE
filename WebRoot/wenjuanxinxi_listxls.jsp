<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=wenjuanxinxi.xls");
%>
<html>
  <head>
    <title>问卷信息</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
  </head>

  <body >
  <p>已有问卷信息列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="cccccc" >  
  <tr>
    <td width="30" align="center" bgcolor="cccccc">序号</td>

    <td bgcolor='#E6E6E6'>问题</td>
    <td bgcolor='#cccccc'>选项A</td>
    <td bgcolor='#cccccc'>选项B</td>
    <td bgcolor='#cccccc'>选项C</td>
    <td bgcolor='#cccccc'>选项D</td>
    <td bgcolor='#cccccc'>票数A</td>
    <td bgcolor='#cccccc'>票数B</td>
    <td bgcolor='#cccccc'>票数C</td>
    <td bgcolor='#cccccc'>票数D</td>
    
    <td width="138" align="center" bgcolor="cccccc">添加时间</td>
    

  </tr>
  <% 

    String url = "wenjuanxinxi_list.jsp?1=1"; 
    String sql =  "select * from wenjuanxinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>

    <td><%=map.get("wenti") %></td>
    <td><%=map.get("xuanxiangA") %></td>
    <td><%=map.get("xuanxiangB") %></td>
    <td><%=map.get("xuanxiangC") %></td>
    <td><%=map.get("xuanxiangD") %></td>
    <td><%=map.get("piaoshuA") %></td>
    <td><%=map.get("piaoshuB") %></td>
    <td><%=map.get("piaoshuC") %></td>
    <td><%=map.get("piaoshuD") %></td>
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

