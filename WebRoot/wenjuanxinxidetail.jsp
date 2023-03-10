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
		 <script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'在线评论',550,250) ;
}
</script> 
<%

	String id=request.getParameter("id");
	HashMap mqt = new CommDAO().getmap(id,"wenjuanxinxi");
	
	
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
							
                                     
   <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
      <tr>
		 <td width='11%' height='50px;'>问题：</td><td width='39%' height='50px;'><%=mqt.get("wenti")%></td>
		 <td width='11%' height='50px;'>选项A：</td><td width='39%' height='50px;'><%=mqt.get("xuanxiangA")%></td>
		 </tr><tr><td width='11%' height='50px;'>选项B：</td><td width='39%' height='50px;'><%=mqt.get("xuanxiangB")%></td>
		 <td width='11%' height='50px;'>选项C：</td><td width='39%' height='50px;'><%=mqt.get("xuanxiangC")%></td>
		 </tr><tr><td width='11%' height='50px;'>选项D：</td><td width='39%' height='50px;'><%=mqt.get("xuanxiangD")%></td>
		 <td width='11%' height='50px;'>票数A：</td><td width='39%' height='50px;'><%=mqt.get("piaoshuA")%></td>
		 </tr><tr><td width='11%' height='50px;'>票数B：</td><td width='39%' height='50px;'><%=mqt.get("piaoshuB")%></td>
		 <td width='11%' height='50px;'>票数C：</td><td width='39%' height='50px;'><%=mqt.get("piaoshuC")%></td>
		 </tr><tr><td width='11%' height='50px;'>票数D：</td><td width='39%' height='50px;'><%=mqt.get("piaoshuD")%></td>
		 <td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center height='50px;'><input type=button name=Submit5 value=返回 class='hsgqiehuanshitu' onClick="javascript:history.back()" />
<input type=button name=Submit52 value=打印 class='hsgqiehuanshitu' onClick="javascript:window.print()"  /> <!--jixaaxnnxiu-->
</td></tr>
    
  </table>
									
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


