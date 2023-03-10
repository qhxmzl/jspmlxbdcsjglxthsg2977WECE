
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.text.*"%> 
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.SimpleDateFormat,java.util.Date"%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  
  <body>
  <%
 

String tmp2;
String sql;

sql="select * from wenjuanxinxi  order by id desc";


for(HashMap mapp:new CommDAO().select(sql))
{
	tmp2=request.getParameter("NO"+mapp.get("id"));
	if(tmp2==null || tmp2=="")
	{}
	else
	{
		//out.print(i);
		if(tmp2.equals("A")){sql="update wenjuanxinxi set piaoshuA=piaoshuA+1 where id="+mapp.get("id");}
		if(tmp2.equals("B")){sql="update wenjuanxinxi set piaoshuB=piaoshuB+1 where id="+mapp.get("id");}
		if(tmp2.equals("C")){sql="update wenjuanxinxi set piaoshuC=piaoshuC+1 where id="+mapp.get("id");}
		if(tmp2.equals("D")){sql="update wenjuanxinxi set piaoshuD=piaoshuD+1 where id="+mapp.get("id");}
		new CommDAO().commOper(sql); 
	}
}
	
	 out.print("<script>alert('操作成功，感谢您的参与！');location.href='dcjg.jsp';</script>");
	
 %>
  </body>
</html>

