<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<title>问卷信息</title>
		
		<link rel="stylesheet" type="text/css" href="qtimages/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="qtimages/css/jquery.bxslider.css"/>
		<link rel="stylesheet" type="text/css" href="qtimages/css/style.css"/>
		<script type="text/javascript" src="qtimages/js/jquery1.11.3.min.js"></script>
		<script type="text/javascript" src="qtimages/js/jquery.bxslider.min.js"></script>
		<script type="text/javascript" src="qtimages/js/index.js"></script>
		<link rel="stylesheet" href="./qtimages/sl_common_form.css">
	</head>
		 <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
<%

%>

	<body>
		<%@ include file="qttop.jsp"%>
		<%@ include file="bht.jsp"%>
		<div class="homeBox homeJoin">
			<div class="wrap">
				<div class="homeTitle">
					<h2>问卷信息</h2>
					<h3><span>News Details</span></h3>
					<div class="line"></div>
				</div>
				<div class="homeJoinWrap">
					<ul class="homeJoinList clearfloat">
						<div class="content-form">
							
                                     <link rel="stylesheet" href="images/hsgcommon/divqt.css" type="text/css">
 <form name="form1" id="form1" method="post" action="" style="width:100%">
   搜索:  问题：<input name="wenti" type="text" id="wenti" class="form-control2"  />  选项A：<input name="xuanxiangA" type="text" id="xuanxiangA" class="form-control2"  />
   <input type="submit" name="Submit" value="查找" class='hsgqiehuanshitu' />   
</form>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    
    <td bgcolor='#CCFFFF'>选项A</td>
    <td bgcolor='#CCFFFF'>选项B</td>
    <td bgcolor='#CCFFFF'>选项C</td>
    <td bgcolor='#CCFFFF'>选项D</td>
    <td bgcolor='#CCFFFF'>票数A</td>
    <td bgcolor='#CCFFFF'>票数B</td>
    <td bgcolor='#CCFFFF'>票数C</td>
    <td bgcolor='#CCFFFF'>票数D</td>
    
    
    <td width="30" align="center" bgcolor="CCFFFF">详细</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"wenjuanxinxi"); 
    String url = "wenjuanxinxilist.jsp?2=2"; 
    String sql =  "select * from wenjuanxinxi where 1=1";
	
if(request.getParameter("wenti")=="" ||request.getParameter("wenti")==null ){}else{sql=sql+" and wenti like '%"+request.getParameter("wenti")+"%'";}
if(request.getParameter("xuanxiangA")=="" ||request.getParameter("xuanxiangA")==null ){}else{sql=sql+" and xuanxiangA like '%"+request.getParameter("xuanxiangA")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("xuanxiangA") %></td><td><%=map.get("xuanxiangB") %></td><td><%=map.get("xuanxiangC") %></td><td><%=map.get("xuanxiangD") %></td><td><%=map.get("piaoshuA") %></td><td><%=map.get("piaoshuB") %></td><td><%=map.get("piaoshuC") %></td><td><%=map.get("piaoshuD") %></td>
    
    <td width="50" align="center"> <a class="btn btn-info btn-small" href="wenjuanxinxidetail.jsp?id=<%=map.get("id")%>" >详细</a></td>
  </tr>
  	<%
  }
   %>
</table><br>

  
${page.info }						
									
						</div>
					</ul>
				</div>
			</div>
		</div>
		<%@ include file="sidebufen.jsp"%>
		<%@ include file="yqlj.jsp"%>
		<%@ include file="qtdown.jsp"%>

</body> 
</html>

<!--yoxudixtu-->
