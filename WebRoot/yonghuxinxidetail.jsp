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
    <title>用户信息</title>

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
    HashMap mqt = new CommDAO().getmap(id,"yonghuxinxi");


%>
<body>
<div id="container">
    <%@ include file="qttop.jsp"%>
    <%@ include file="bht.jsp"%>
    <div id="content">
        <div class="section-content team-section2 no-padd" id="index-news">
            <div class="title-section title2">
                <div class="container triggerAnimation animated" data-animate="bounceIn">
                    <h1>用户信息</h1>
                </div>
            </div>
            <div class="team-box">
                <div class="container">
                    <div class="row">
                        <div class="content-form">



                            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">
                                <tr>
                                    <td width='11%' height=44>账号：</td><td width='39%'><%=mqt.get("zhanghao")%></td><td  rowspan=7 align=center><a href=<%=mqt.get("touxiang")%> target=_blank><img src=<%=mqt.get("touxiang")%> width=228 height=215 border=0></a></td></tr><tr>
                                <td width='11%' height=44>密码：</td><td width='39%'>******</td></tr><tr>
                                <td width='11%' height=44>姓名：</td><td width='39%'><%=mqt.get("xingming")%></td></tr><tr>
                                <td width='11%' height=44>性别：</td><td width='39%'><%=mqt.get("xingbie")%></td></tr><tr>
                                <td width='11%' height=44>年龄：</td><td width='39%'><%=mqt.get("nianling")%></td></tr><tr>
                                <td width='11%' height=44>地区：</td><td width='39%'><%=mqt.get("diqu")%></td></tr><tr>
                                <td width='11%' height=44>手机号：</td><td width='39%'><%=mqt.get("shoujihao")%></td></tr><tr>

                                <td colspan=3 align=center>
                                    <%--<input type=button name=Submit5 value=返回 class='hsgqiehuanshitu' onClick="javascript:history.back()" />
                                    <input type=button name=Submit52 value=打印 class='hsgqiehuanshitu' onClick="javascript:window.print()" />--%> <!--jixaaxnnxiu-->
                                </td></tr>

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


