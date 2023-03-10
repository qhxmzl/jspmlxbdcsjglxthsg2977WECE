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
        <title>内容详细</title>
    </head>
		 <%
  String id=request.getParameter("id");
   new CommDAO().commOper("update xinwentongzhi set dianjilv=dianjilv+1 where id="+id);
%>
    <body>
        <div id="container">
            <%@ include file="qttop.jsp"%>
			<%@ include file="bht.jsp"%>
            <div id="content">
			 <div class="section-content team-section2 no-padd" id="index-news">
                    <div class="title-section title2">
                        <div class="container triggerAnimation animated" data-animate="bounceIn">
                            <h1>内容详细</h1>
                        </div>
                    </div>
                    <div class="team-box">
                        <div class="container">
                            <div class="row">
								<div class="content-form">
							
		  
                                    <%
    HashMap m = new CommDAO().getmap(id,"xinwentongzhi");
     %>
                   
                      <table width="97%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#67B41A" style="border-collapse:collapse" class="newsline">
                        <tr>
                          <td height="74" align="center"><font style="color:#009966; font-size:18px;font-weight:bold" ><%=m.get("biaoti") %> (被访问<%=m.get("dianjilv") %>次)</font></td>
                        </tr>
                        <tr>
                          <td height="104"><%=m.get("neirong") %></td>
                        </tr>
                        <tr>
                          <td align="right"><input type="button" onClick="javaScript:history.back();" value="返回" class="content-form-signup" /></td>
                        </tr>
                      </table>
                      
									
									</div>
                            </div>
                        </div>
                    </div>
                </div>
				<%@ include file="sidebufen.jsp"%>
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