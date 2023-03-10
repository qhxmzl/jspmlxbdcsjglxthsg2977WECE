<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="renderer" content="webkit" />
        <meta name="robots" content="index, follow" />
        <link rel="stylesheet" type="text/css" href="qtimages/css/font-awesome.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="qtimages/css/bootstrap.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="qtimages/css/owl.carousel.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="qtimages/css/magnific-popup.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="qtimages/css/animate.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="qtimages/css/settings.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="qtimages/css/style-red.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="qtimages/css/tk.css" media="screen" />
        <script type="text/javascript" src="qtimages/js/jquery.min.js"></script>
        <script type="text/javascript" src="qtimages/js/jquery.migrate.js"></script>
        <script type="text/javascript" src="qtimages/js/bootstrap.js"></script>
        <script type="text/javascript" src="qtimages/js/owl.carousel.min.js"></script>
        <script type="text/javascript">
            $(function() {
                $("#navigation #nav_0 .menu1").addClass("active");
            });
        </script>
		<link rel="stylesheet" href="./qtimages/sl_common_form.css">
        <title>问卷信息</title>
		
    </head>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
<%

%>

    <body>
        <div id="container">
            <%@ include file="qttop.jsp"%>
			<%@ include file="bht.jsp"%>
         
              <div class="homeBox homeJoin">
			<div class="wrap">
				<div class="homeTitle">
					<h2>问卷结果</h2>
					<h3><span>DiaoCha</span></h3>
					<div class="line"></div>
				</div>
				<div class="homeJoinWrap">
					<ul class="homeJoinList clearfloat">
						<div class="content-form">
							
                                     <% 
  	


  	 new CommDAO().delete(request,"wenjuanxinxi"); 
    String url = "dcjg.jsp?2=2"; 
    String sql =  "select * from wenjuanxinxi where 1=1";
	
if(request.getParameter("wenti")=="" ||request.getParameter("wenti")==null ){}else{sql=sql+" and wenti like '%"+request.getParameter("wenti")+"%'";}
if(request.getParameter("xuanxiangA")=="" ||request.getParameter("xuanxiangA")==null ){}else{sql=sql+" and xuanxiangA like '%"+request.getParameter("xuanxiangA")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
<table width="100%" height="152"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#990000">
  <tr align="center" bgcolor="#E4E4E4">
    <td height="30" colspan="3" bgcolor="#E4E4E4" class="tt04"><div align="left">问题<%=i%>：<%=map.get("wenti") %></div></td>
  </tr>
  <tr>
    <td width="23%" height="27" bgcolor="#FFFFFF"><a class="tt01">选项A：<%=map.get("xuanxiangA") %></a></td>
    <td width="58%" bgcolor="#FFFFFF">
	<table width="<% out.print(800*(Float.valueOf((String)map.get("piaoshuA")).floatValue()/(Float.valueOf((String)map.get("piaoshuA")).floatValue() +Float.valueOf((String)map.get("piaoshuB")).floatValue()+Float.valueOf((String)map.get("piaoshuC")).floatValue()+Float.valueOf((String)map.get("piaoshuD")).floatValue()))); %>" height="7" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#990000">&nbsp;</td>
      </tr>
    </table></td>
    <td width="19%" bgcolor="#FFFFFF"><div align="center"><a class="tt01">
      <%
	out.print(Float.valueOf((String)map.get("piaoshuA")).floatValue()/(Float.valueOf((String)map.get("piaoshuA")).floatValue() +Float.valueOf((String)map.get("piaoshuB")).floatValue()+Float.valueOf((String)map.get("piaoshuC")).floatValue()+Float.valueOf((String)map.get("piaoshuD")).floatValue())*100+"%");
	%>
    </a></div></td>
  </tr>
  <tr>
    <td width="23%" height="27" bgcolor="#FFFFFF"><a class="tt01">选项B：<%=map.get("xuanxiangB") %></a></td>
    <td width="58%" bgcolor="#FFFFFF">
	<table width="<% out.print(800*(Float.valueOf((String)map.get("piaoshuB")).floatValue()/(Float.valueOf((String)map.get("piaoshuA")).floatValue() +Float.valueOf((String)map.get("piaoshuB")).floatValue()+Float.valueOf((String)map.get("piaoshuC")).floatValue()+Float.valueOf((String)map.get("piaoshuD")).floatValue()))); %>" height="7" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#990000">&nbsp;</td>
      </tr>
    </table></td>
    <td width="19%" bgcolor="#FFFFFF"><div align="center"><a class="tt01">
      <%
	out.print(Float.valueOf((String)map.get("piaoshuB")).floatValue()/(Float.valueOf((String)map.get("piaoshuA")).floatValue() +Float.valueOf((String)map.get("piaoshuB")).floatValue()+Float.valueOf((String)map.get("piaoshuC")).floatValue()+Float.valueOf((String)map.get("piaoshuD")).floatValue())*100+"%");
	%>
    </a></div></td>
  </tr>
  <tr>
    <td width="23%" height="27" bgcolor="#FFFFFF"><a class="tt01">选项C：<%=map.get("xuanxiangC") %></a></td>
    <td width="58%" bgcolor="#FFFFFF">
	<table width="<% out.print(800*(Float.valueOf((String)map.get("piaoshuC")).floatValue()/(Float.valueOf((String)map.get("piaoshuA")).floatValue() +Float.valueOf((String)map.get("piaoshuB")).floatValue()+Float.valueOf((String)map.get("piaoshuC")).floatValue()+Float.valueOf((String)map.get("piaoshuD")).floatValue()))); %>" height="7" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#990000">&nbsp;</td>
      </tr>
    </table></td>
    <td width="19%" bgcolor="#FFFFFF"><div align="center"><a class="tt01">
      <%
	out.print(Float.valueOf((String)map.get("piaoshuC")).floatValue()/(Float.valueOf((String)map.get("piaoshuA")).floatValue() +Float.valueOf((String)map.get("piaoshuB")).floatValue()+Float.valueOf((String)map.get("piaoshuC")).floatValue()+Float.valueOf((String)map.get("piaoshuD")).floatValue())*100+"%");
	%>
    </a></div></td>
  </tr>
  <tr>
    <td width="23%" height="27" bgcolor="#FFFFFF"><a class="tt01">选项D：<%=map.get("xuanxiangD") %></a></td>
    <td width="58%" bgcolor="#FFFFFF">
	<table width="<% out.print(800*(Float.valueOf((String)map.get("piaoshuD")).floatValue()/(Float.valueOf((String)map.get("piaoshuA")).floatValue() +Float.valueOf((String)map.get("piaoshuB")).floatValue()+Float.valueOf((String)map.get("piaoshuC")).floatValue()+Float.valueOf((String)map.get("piaoshuD")).floatValue()))); %>" height="7" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#990000">&nbsp;</td>
      </tr>
    </table></td>
    <td width="19%" bgcolor="#FFFFFF"><div align="center"><a class="tt01">
      <%
	out.print(Float.valueOf((String)map.get("piaoshuD")).floatValue()/(Float.valueOf((String)map.get("piaoshuA")).floatValue() +Float.valueOf((String)map.get("piaoshuB")).floatValue()+Float.valueOf((String)map.get("piaoshuC")).floatValue()+Float.valueOf((String)map.get("piaoshuD")).floatValue())*100+"%");
	%>
    </a></div></td>
  </tr>

</table>
<%

}
%>
									
						</div>
					</ul>
				</div>
			</div>
		</div>
		   <%@ include file="qtdown.jsp"%>
        </div>
        <script type="text/javascript" src="qtimages/js/jquery.magnific-popup.min.js"></script>
        <script type="text/javascript" src="qtimages/js/jquery.appear.js"></script>
        <script type="text/javascript" src="qtimages/js/jquery.imagesloaded.min.js"></script>
        <script type="text/javascript" src="qtimages/js/jquery.isotope.min.js"></script>
        <script type="text/javascript" src="qtimages/js/retina-1.1.0.min.js"></script>
        <script type="text/javascript" src="qtimages/js/plugins-scroll.js"></script>
        <script type="text/javascript" src="qtimages/js/waypoint.min.js"></script>
        <script type="text/javascript" src="qtimages/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="qtimages/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="qtimages/js/script.js"></script>
        <link type="text/css" rel="stylesheet" href="qtimages/css/jquery.mmenu.all.css" />
        <script type="text/javascript" src="qtimages/js/jquery.mmenu.all.min.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                var mmenu = $('nav#mmenu').mmenu({
                    slidingSubmenus: true,
                    classes: 'mm-white',
                    //mm-fullscreen mm-light
                    extensions: ["theme-white"],
                    offCanvas: {
                        position: "right",
                        //left, top, right, bottom
                        zposition: "front" //back, front,next
                        //modal		: true
                    },
                    searchfield: false,
                    counters: false,
                    //navbars		: {
                    //content : [ "prev", "title", "next" ]
                    //},
                    navbar: {
                        title: "网站导航"
                    },
                    header: {
                        add: true,
                        update: true,
                        title: "网站导航"
                    }
                });
                $(".closemenu").click(function() {
                    var mmenuAPI = $("#mmenu").data("mmenu");
                    mmenuAPI.close();
                });
            });
        </script>

</body> 
</html>

<!--yoxudixtu-->
