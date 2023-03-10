<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>用户信息</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>
<script language="javascript">

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>

  <body >
<% 

String id = request.getParameter("id"); 
HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"yonghuxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmaps("zhanghao",(String)request.getSession().getAttribute("username"),"yonghuxinxi"); 
%>
  <form  action="yonghuxinxi_updt2.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改用户信息:
  <br><br>
  <%
  
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
     
     <tr><td>账号：</td><td><input name='zhanghao' type='text' id='zhanghao' value='<%= mmm.get("zhanghao")%>' class="form-control" /></td></tr>
     <tr><td>密码：</td><td><input name='mima' type='text' id='mima' value='<%= mmm.get("mima")%>' class="form-control" /></td></tr>
     <tr><td>姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' class="form-control" /></td></tr>
     <tr><td>性别：</td><td><select name='xingbie' id='xingbie' class="form-control2"><option value="男">男</option><option value="女">女</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=mmm.get("xingbie")%>';</script>
     <tr><td>年龄：</td><td><input name='nianling' type='text' id='nianling' class="form-control"  style="width:600px;" value='<%=mmm.get("nianling")%>' /></td></tr>
     <tr><td>地区：</td><td><input name='diqu' type='text' id='diqu' value='<%= mmm.get("diqu")%>' class="form-control" /></td></tr>
     <tr><td>手机号：</td><td><input name='shoujihao' type='text' id='shoujihao' value='<%= mmm.get("shoujihao")%>' class="form-control" /></td></tr>
     <tr><td>头像：</td><td><input name='touxiang' type='text' id='touxiang' size='50' value='<%= mmm.get("touxiang")%>' class="form-control" /> <div style="margin-top:16px;">&nbsp;<input type='button' value='上传' onClick="up('touxiang')"/></div></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


