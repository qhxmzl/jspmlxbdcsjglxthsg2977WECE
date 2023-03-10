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
<%

    String id="";

%>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script language=javascript src='js/ajax.js'></script>
<script language="javascript">
    function checkform()
    {
        var zhanghaoobj = document.getElementById("zhanghao"); if(zhanghaoobj.value==""){document.getElementById("clabelzhanghao").innerHTML="&nbsp;&nbsp;<font color=red>请输入账号</font>";return false;}else{document.getElementById("clabelzhanghao").innerHTML="  "; }
        var zhanghaoobj = document.getElementById("zhanghao");
        if(zhanghaoobj.value!=""){
            var ajax = new AJAX();
            ajax.post("factory/checkno.jsp?table=yonghuxinxi&col=zhanghao&value="+zhanghaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
            var msg = ajax.getValue();
            if(msg.indexOf('Y')>-1){
                document.getElementById("clabelzhanghao").innerHTML="&nbsp;&nbsp;<font color=red>账号已存在</font>";
                return false;
            }else{document.getElementById("clabelzhanghao").innerHTML="  ";
            }
        }
        var mimaobj = document.getElementById("mima"); if(mimaobj.value==""){document.getElementById("clabelmima").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";return false;}else{document.getElementById("clabelmima").innerHTML="  "; }
        var xingmingobj = document.getElementById("xingming"); if(xingmingobj.value==""){document.getElementById("clabelxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入姓名</font>";return false;}else{document.getElementById("clabelxingming").innerHTML="  "; }
        var nianlingobj = document.getElementById("nianling"); if(nianlingobj.value==""){document.getElementById("clabelnianling").innerHTML="&nbsp;&nbsp;<font color=red>请输入年龄</font>";return false;}else{document.getElementById("clabelnianling").innerHTML="  "; }
        var nianlingobj = document.getElementById("nianling");
        if(nianlingobj.value!=""){
            var ajax = new AJAX();
            ajax.post("factory/checkno.jsp?table=yonghuxinxi&col=nianling&value="+nianlingobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
            var msg = ajax.getValue();
            if(msg.indexOf('Y')>-1){
                document.getElementById("clabelnianling").innerHTML="&nbsp;&nbsp;<font color=red>年龄已存在</font>";
                return false;
            }else{document.getElementById("clabelnianling").innerHTML="  ";
            }
        }
        var nianlingobj = document.getElementById("nianling"); if(nianlingobj.value!=""){ if(/^\d{15}$|^\d{18}$|^\d{17}[xX]$/.test(nianlingobj.value)){document.getElementById("clabelnianling").innerHTML=""; }else{document.getElementById("clabelnianling").innerHTML="&nbsp;&nbsp;<font color=red>必需身份证格式</font>"; return false;}}
        var shoujihaoobj = document.getElementById("shoujihao"); if(shoujihaoobj.value!=""){ if(/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(shoujihaoobj.value) || /^1[3|4|5|6|7|8|9][0-9]\d{8,8}$/.test(shoujihaoobj.value)){document.getElementById("clabelshoujihao").innerHTML=""; }else{document.getElementById("clabelshoujihao").innerHTML="&nbsp;&nbsp;<font color=red>[7或8位电话，或11位手机]必需电话格式</font>"; return false;}}

    }
    function gow()
    {
        document.location.href="yonghuxinxiadd.jsp?id=<%=id%>";
    }
    popheight=850;
</script>

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

                            <%
                                HashMap ext = new HashMap();
                                if(request.getParameter("f")!=null){

                                    new CommDAO().insert(request,response,"yonghuxinxi",ext,true,false,"");

                                }
                            %>
                            <form  action="yonghuxinxiadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
                                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">
                                    <tr><td  width="200">账号：</td><td><input name='zhanghao' type='text' id='zhanghao' value='' onblur='checkform()' class="user" />&nbsp;*<label id='clabelzhanghao' /></td></tr>
                                    <tr><td  width="200">密码：</td><td><input name='mima' type='text' id='mima' value='' onblur='checkform()' class="user" />&nbsp;*<label id='clabelmima' /></td></tr>
                                    <tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='checkform()' class="user" />&nbsp;*<label id='clabelxingming' /></td></tr>
                                    <tr><td>性别：</td><td><select name='xingbie' id='xingbie' class="xingbie"><option value="男">男</option><option value="女">女</option></select></td></tr>
                                    <tr><td  width="200">年龄：</td><td><input name='nianling' type='text' id='nianling' value='' onblur='checkform()' class="user" style="width:600px;" />&nbsp;*<label id='clabelnianling' /></td></tr>
                                    <tr><td  width="200">地区：</td><td><input name='diqu' type='text' id='diqu' value='' onblur='' class="user" /></td></tr>
                                    <tr><td  width="200">手机号：</td><td><input name='shoujihao' type='text' id='shoujihao' value='' onblur='checkform()' class="user" />&nbsp;<label id='clabelshoujihao' />[7或8位电话，或11位手机]必需电话格式</td></tr>
                                    <tr><td  width="200">头像：</td><td><input name='touxiang' type='text' id='touxiang' size='50' value='' onblur='' class="user" />&nbsp;<input type='button' value='上传' onClick="up('touxiang')"   class="content-form-signup" /></td></tr>

                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><input type="submit" name="Submit" value="提交" onclick="return checkform();" class="content-form-signup" />
                                            <input type="reset" name="reset" value="重置" class="content-form-signup" /></td>
                                    </tr>
                                </table>
                            </form>

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

<!--yoxudixtu-->
