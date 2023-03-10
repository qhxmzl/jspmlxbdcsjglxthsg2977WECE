<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=yonghuxinxi.xls");
%>
<html>
  <head>
    <title>用户信息</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
  </head>

  <body >
  <p>已有用户信息列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="cccccc" >  
  <tr>
    <td width="30" align="center" bgcolor="cccccc">序号</td>
    <td bgcolor='#cccccc'>账号</td>
    <td bgcolor='#cccccc'>密码</td>
    <td bgcolor='#cccccc'>姓名</td>
    <td bgcolor='#E6E6E6' width='40' align='center'>性别</td>
    <td bgcolor='#cccccc'>年龄</td>
    <td bgcolor='#cccccc'>地区</td>
    <td bgcolor='#cccccc'>手机号</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>头像</td>
    
    <td width="138" align="center" bgcolor="cccccc">添加时间</td>
    

  </tr>
  <% 

    String url = "yonghuxinxi_list.jsp?1=1"; 
    String sql =  "select * from yonghuxinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("zhanghao") %></td>
    <td><%=map.get("mima") %></td>
    <td><%=map.get("xingming") %></td>
    <td align='center'><%=map.get("xingbie") %></td>
    <td><%=map.get("nianling") %></td>
    <td><%=map.get("diqu") %></td>
    <td><%=map.get("shoujihao") %></td>
    <td width='90' align='center'><a class="btn btn-info btn-small" href='<%=map.get("touxiang") %>' target='_blank'><img src='<%=map.get("touxiang") %>' width=88 height=99 border=0 /></a></td>
    
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

