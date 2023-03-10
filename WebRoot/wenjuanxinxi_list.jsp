<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>问卷信息</title>
	<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
  </head>


  <body >
  <p>已有问卷信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  问题：<input name="wenti" type="text" id="wenti" class="form-control2" />  选项A：<input name="xuanxiangA" type="text" id="xuanxiangA" class="form-control2" />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" />
    <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='wenjuanxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3"  class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="35" height="50" align="center" bgcolor="#E6E6E6">序号</td>

    <td bgcolor='#E6E6E6'>问题</td>
    <td bgcolor='#E6E6E6'>选项A</td>
    <td bgcolor='#E6E6E6'>选项B</td>
    <td bgcolor='#E6E6E6'>选项C</td>
    <td bgcolor='#E6E6E6'>选项D</td>
    <td bgcolor='#E6E6E6'>票数A</td>
    <td bgcolor='#E6E6E6'>票数B</td>
    <td bgcolor='#E6E6E6'>票数C</td>
    <td bgcolor='#E6E6E6'>票数D</td>
    
	
    <td width="138" height="50" align="center" bgcolor="#E6E6E6">添加时间</td>
    
    <td width="220" height="50" align="center" bgcolor="#E6E6E6">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"wenjuanxinxi"); 
    String url = "wenjuanxinxi_list.jsp?1=1"; 
    String sql =  "select * from wenjuanxinxi where 1=1";
	
if(request.getParameter("wenti")=="" ||request.getParameter("wenti")==null ){}else{sql=sql+" and wenti like '%"+request.getParameter("wenti")+"%'";}
if(request.getParameter("xuanxiangA")=="" ||request.getParameter("xuanxiangA")==null ){}else{sql=sql+" and xuanxiangA like '%"+request.getParameter("xuanxiangA")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr >
    <td width="35" height="50" align="center"><%=i %></td>

    <td><%=map.get("wenti") %></td>
    <td><%=map.get("xuanxiangA") %></td>
    <td><%=map.get("xuanxiangB") %></td>
    <td><%=map.get("xuanxiangC") %></td>
    <td><%=map.get("xuanxiangD") %></td>
    <td><%=map.get("piaoshuA") %></td>
    <td><%=map.get("piaoshuB") %></td>
    <td><%=map.get("piaoshuC") %></td>
    <td><%=map.get("piaoshuD") %></td>
    
	
    <td width="138" height="50" align="center"><%=map.get("addtime") %></td>
    <td width="220" height="50" align="center">
      <a class="btn btn-info btn-small" href="wenjuanxinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>
      <a class="btn btn-info btn-small" href="wenjuanxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>
    </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
<p class="fy">${page.info }</p>


  </body>
</html>

