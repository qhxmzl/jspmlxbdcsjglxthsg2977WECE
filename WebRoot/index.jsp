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
    <title>流行病调查数据管理系统</title>
</head>
<body>
<div id="container">
    <%@ include file="qttop.jsp"%>
    <%@ include file="bht.jsp"%>
    <div id="content">
        <%@ include file="sidebufen.jsp"%>

        <div class="section-content team-section2 no-padd" id="index-news">
            <div class="title-section title2">
                <div class="container triggerAnimation animated" data-animate="bounceIn">
                    <h1><a href="yonghuxinxilist.jsp" >用户风彩</a></h1>
                </div>
            </div>
            <div class="team-box">
                <div class="container">
                    <div class="row">
                        <div id="owl-demo" class="owl-carousel">

                            <%
                                int iyonghuxinxi=0;
                                for(HashMap mapyonghuxinxi:new CommDAO().select("select * from yonghuxinxi order by id desc "))
                                {
                                    iyonghuxinxi++;
                                    if(iyonghuxinxi<=8)
                                    {
                            %>

                            <div class="item team-post iblog-item">
                                <div class="team-gal">
                                    <img src="<%=mapyonghuxinxi.get("touxiang")%>" alt="<%=mapyonghuxinxi.get("xingming")%>" />
                                    <div class="hover-team">
                                        <div class="inner-team">
                                            <ul class="team-social">
                                                <li><a class="facebook" href="yonghuxinxidetail.jsp?id=<%=mapyonghuxinxi.get("id")%>" ><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <h2 class="iblog-title">
                                    <a href="yonghuxinxidetail.jsp?id=<%=mapyonghuxinxi.get("id")%>" title="<%=mapyonghuxinxi.get("xingming")%>">
                                        <%=mapyonghuxinxi.get("xingming")%>
                                    </a>
                                </h2>
                                <span class="iblog-date"><i class="fa fa-calendar"></i>&nbsp;<%=mapyonghuxinxi.get("addtime")%></span>
                            </div>
                            <%
                                    }
                                }
                            %>


                        </div>
                    </div>
                </div>
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
