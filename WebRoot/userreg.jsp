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
        <title>用户注册</title>
    </head>
	 <% 
HashMap ext = new HashMap(); 
ext.put("issh","是"); 
new CommDAO().insert(request,response,"yonghuzhuce",ext,true,false,"index.jsp"); 
%>
    <body>
        <div id="container">
            <%@ include file="qttop.jsp"%>
			<%@ include file="bht.jsp"%>
            <div id="content">
			 <div class="section-content team-section2 no-padd" id="index-news">
                    <div class="title-section title2">
                        <div class="container triggerAnimation animated" data-animate="bounceIn">
                            <h1>用户注册</h1>
                        </div>
                    </div>
                    <div class="team-box">
                        <div class="container">
                            <div class="row">
								<div class="content-form">
							
		  <form  action="userreg.jsp?f=f"  method="post" name="f1"  onsubmit="return checkform();">
					<table width="98%" height="927" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#58AC22" style="border-collapse:collapse" class="newsline">
                         
                            <tr>
                              <td width="15%" align="center">用户名：</td>
                              <td colspan="2" align="left"><input name='yonghuming' type='text' id='yonghuming' value='' onblur='checkform()'  class="user" style="width:200px;" /><label id='clabelyonghuming' />
                              &nbsp;*</td>
                            </tr>
                            <tr>
                              <td align="center">密码：</td>
                              <td width="27%" align="left"><input name='mima' type='password' id='mima' value='' onblur='checkform()' class="password" /><label id='clabelmima' />
                                &nbsp;* 
                              </td>
                              <td width="58%" align="left">确认密码：
                              <input name='mima2' type='password' id='mima2' value='' onblur='checkform()' class="password" >  <label id='clabelmima2' /> </td>
                            </tr>
                            <tr>
                              <td align="center">姓名：</td>
                              <td colspan="2" align="left"><input name='xingming' type='text' id='xingming' value='' onblur='checkform()' class="user"  style="width:200px;"  /><label id='clabelxingming' />
                              &nbsp;*</td>
                            </tr>
                            <tr>
                              <td align="center">性别：</td>
                              <td colspan="2" align="left"><select name='xingbie' id='xingbie' class="xingbie">
                                  <option value="男">男</option>
                                  <option value="女">女</option>
                              </select></td>
                            </tr>
                            <tr>
                              <td align="center">出生年月：</td>
                              <td colspan="2" align="left"><input name='chushengnianyue' type='text' id='chushengnianyue' value='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})"  class="user" style="width:160px;" /></td>
                            </tr>
                            <tr>
                              <td align="center">QQ：</td>
                              <td colspan="2" align="left"><input name='QQ' type='text' id='QQ' value='' onblur='checkform()' class="user" style="width:200px;" /> <label id='clabelQQ' /></td>
                            </tr>
                            <tr>
                              <td align="center">邮箱：</td>
                              <td colspan="2" align="left"><input name='youxiang' type='text' id='youxiang' value='' onblur='checkform()' class="user" style="width:200px;" /> <label id='clabelyouxiang' /></td>
                            </tr>
                            <tr>
                              <td align="center">手机：</td>
                              <td colspan="2" align="left"><input name='dianhua' type='text' id='dianhua' value='' onblur='checkform()' class="user" style="width:200px;" /> <label id='clabeldianhua' /></td>
                            </tr>
                            <tr>
                              <td align="center">身份证：</td>
                              <td colspan="2" align="left"><input name='shenfenzheng' type='text' id='shenfenzheng' value='' onblur='checkform()' class="user" /> <label id='clabelshenfenzheng' /> </td>
                            </tr>
                            <tr>
                              <td align="center">头像：</td>
                              <td colspan="2" align="left"><input name='touxiang' type='text' id='touxiang' size='50' value='' class="user" />
                                &nbsp;
                              <input name="button" type='button' onClick="up('touxiang')" value='上传' class="content-form-signup" /></td>
                            </tr>
                            <tr>
                              <td align="center">地址：</td>
                              <td colspan="2" align="left"><input name='dizhi' type='text' id='dizhi' value='' size='50' class="user" /></td>
                            </tr>
                            <tr>
                              <td align="center">备注：</td>
                              <td colspan="2" align="left"><textarea name='beizhu' cols='50' rows='5' id='beizhu' class="user" ></textarea></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2" align="left"><input type="submit" name="Submit5" value="提交" onClick="return checkform();" class="content-form-signup" />
                              <input type="reset" name="Submit22" value="重置" class="content-form-signup" /></td>
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
<script language=javascript src='js/My97DatePicker/WdatePicker.js'></script>
<script type="text/javascript" src="js/popup.js"></script>
<script language=javascript src='js/ajax.js'></script>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<script language=javascript >  
 function checkform(){  
var yonghumingobj = document.getElementById("yonghuming");  
if(yonghumingobj.value==""){  
document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>请输入用户名</font>";  
return false;  
}else{
document.getElementById("clabelyonghuming").innerHTML="  ";  
}  
  
var yonghumingobj = document.getElementById("yonghuming");  
if(yonghumingobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=yonghuzhuce&col=yonghuming&value="+yonghumingobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>用户名已存在</font>";  
return false;
}else{document.getElementById("clabelyonghuming").innerHTML="  ";  
}  
}  
var mimaobj = document.getElementById("mima");  
if(mimaobj.value==""){  
document.getElementById("clabelmima").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";  
return false;  
}else{
document.getElementById("clabelmima").innerHTML="  ";  
}  

var mima2obj = document.getElementById("mima2");  
if(mima2obj.value==""){  
document.getElementById("clabelmima2").innerHTML="&nbsp;&nbsp;<font color=red>请再次输入密码</font>";  
return false;  
}else{
document.getElementById("clabelmima2").innerHTML="  ";  
}

if(mima2obj.value!=mimaobj.value){  
document.getElementById("clabelmima2").innerHTML="&nbsp;&nbsp;<font color=red>两次密码输入不一致</font>";  
return false;  
}else{
document.getElementById("clabelmima2").innerHTML="  ";  
}
 
  
var xingmingobj = document.getElementById("xingming");  
if(xingmingobj.value==""){  
document.getElementById("clabelxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入姓名</font>";  
return false;  
}else{
document.getElementById("clabelxingming").innerHTML="  ";  
}  


var QQobj = document.getElementById("QQ");  
if(QQobj.value!=""){  
if(QQobj.value.length>12||isNaN(QQobj.value)){ 
document.getElementById("clabelQQ").innerHTML="&nbsp;&nbsp;<font color=red>联系QQ必须为12位以内数字</font>";  
return false;
}else{  
document.getElementById("clabelQQ").innerHTML="";  
}  
}  

var youxiangobj = document.getElementById("youxiang");  
if(youxiangobj.value!=""){  
if(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(youxiangobj.value))
{ 
document.getElementById("clabelyouxiang").innerHTML="";  
}else{  
document.getElementById("clabelyouxiang").innerHTML="&nbsp;&nbsp;<font color=red>必需邮箱格式</font>";  
return false;
}  
}  
  
var dianhuaobj = document.getElementById("dianhua");  
if(dianhuaobj.value!=""){  
if(/^1[3|4|5|6|7|8|9][0-9]\d{4,8}$/.test(dianhuaobj.value) ||  /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(dianhuaobj.value))
{ 
document.getElementById("clabeldianhua").innerHTML="";  
}else{  
document.getElementById("clabeldianhua").innerHTML="&nbsp;&nbsp;<font color=red>必需手机(11位)或电话(7或8位数)格式</font>";  
return false;
}  
}

var shenfenzhengobj = document.getElementById("shenfenzheng");  
if(shenfenzhengobj.value!=""){  
if(/^\d{15}$|^\d{18}$|^\d{17}[xX]$/.test(shenfenzhengobj.value))
{ 
document.getElementById("clabelshenfenzheng").innerHTML="";  
}else{  
document.getElementById("clabelshenfenzheng").innerHTML="&nbsp;&nbsp;<font color=red>必需身份证格式</font>";  
return false;
}  
}  
return true;   
}   
popheight=1150;
</script>  

