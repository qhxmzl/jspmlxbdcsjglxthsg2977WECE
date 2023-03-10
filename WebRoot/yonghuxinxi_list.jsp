<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>用户信息</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
    <link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
  </head>
  <body >
  <p>已有用户信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  账号：<input name="zhanghao" type="text" id="zhanghao" class="form-control2" />  姓名：<input name="xingming" type="text" id="xingming" class="form-control2" />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="35" height="50" align="center" bgcolor="#E6E6E6">序号</td>
    <td bgcolor='#E6E6E6'>账号</td>
    <td bgcolor='#E6E6E6'>密码</td>
    <td bgcolor='#E6E6E6'>姓名</td>
    <td bgcolor='#E6E6E6' width='40' align='center'>性别</td>
    <td bgcolor='#E6E6E6'>年龄</td>
    <td bgcolor='#E6E6E6'>地区</td>
    <td bgcolor='#E6E6E6'>手机号</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>头像</td>
    
	
    <td width="138" height="50" align="center" bgcolor="#E6E6E6">添加时间</td>
    
    <td width="220" height="50" align="center" bgcolor="#E6E6E6">操作</td>
  </tr>
  <% 

  	 new CommDAO().delete(request,"yonghuxinxi"); 
    String url = "yonghuxinxi_list.jsp?1=1"; 
    String sql =  "select * from yonghuxinxi where 1=1";
	
if(request.getParameter("zhanghao")=="" ||request.getParameter("zhanghao")==null ){}else{sql=sql+" and zhanghao like '%"+request.getParameter("zhanghao")+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="35" height="50" align="center"><%=i %></td>
    <td><%=map.get("zhanghao") %></td>
    <td><%=map.get("mima") %></td>
    <td><%=map.get("xingming") %></td>
    <td align='center'><%=map.get("xingbie") %></td>
    <td><%=map.get("nianling") %></td>
    <td><%=map.get("diqu") %></td>
    <td><%=map.get("shoujihao") %></td>
    <td width='90' align='center'><a  href='<%=map.get("touxiang") %>' target='_blank'><img src='<%=map.get("touxiang") %>' width=88 height=99 border=0 /></a></td>
    
	
    <td width="138" height="50" align="center"><%=map.get("addtime") %></td>
    <td width="220" height="50" align="center">
      <a class="btn btn-info btn-small" href="yonghuxinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>
      <a class="btn btn-info btn-small" href="yonghuxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>
      <a class="btn btn-info btn-small" href="yonghuxinxidetail.jsp?id=<%=map.get("id")%>" target="_blank">详细</a>
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

