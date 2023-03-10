<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>问卷信息</title>
	
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  id=request.getParameter("id");
  
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="wenjuanxinxi_add.jsp?id=<%=id%>";
}

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

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){


new CommDAO().insert(request,response,"wenjuanxinxi",ext,true,false,""); 

}

%>

  <body >
 <form  action="wenjuanxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加问卷信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >
		<tr><td  width="200">问题：</td><td><textarea name='wenti'  id='wenti' onblur='checkform()' class="form-control" style="width:600px;height:80px;" ></textarea>&nbsp;*<label id='clabelwenti' /></td></tr>
		<tr><td  width="200">选项A：</td><td><input name='xuanxiangA' type='text' id='xuanxiangA' value='' onblur='checkform()' class="form-control" style="width:600px;" />&nbsp;*<label id='clabelxuanxiangA' /></td></tr>
		<tr><td  width="200">选项B：</td><td><input name='xuanxiangB' type='text' id='xuanxiangB' value='' onblur='' class="form-control" style="width:600px;" /></td></tr>
		<tr><td  width="200">选项C：</td><td><input name='xuanxiangC' type='text' id='xuanxiangC' value='' onblur='' class="form-control" style="width:600px;" /></td></tr>
		<tr><td  width="200">选项D：</td><td><input name='xuanxiangD' type='text' id='xuanxiangD' value='' onblur='' class="form-control" style="width:600px;" /></td></tr>
		<tr style="display:none"><td  width="200">票数A：</td><td><input name='piaoshuA' type='text' id='piaoshuA' value='0' onblur='' class="form-control" /></td></tr>
		<tr style="display:none"><td  width="200">票数B：</td><td><input name='piaoshuB' type='text' id='piaoshuB' value='0' onblur='' class="form-control" /></td></tr>
		<tr style="display:none"><td  width="200">票数C：</td><td><input name='piaoshuC' type='text' id='piaoshuC' value='0' onblur='' class="form-control" /></td></tr>
		<tr style="display:none"><td  width="200">票数D：</td><td><input name='piaoshuD' type='text' id='piaoshuD' value='0' onblur='' class="form-control" /></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var wentiobj = document.getElementById("wenti"); if(wentiobj.value==""){document.getElementById("clabelwenti").innerHTML="&nbsp;&nbsp;<font color=red>请输入问题</font>";return false;}else{document.getElementById("clabelwenti").innerHTML="  "; } 
	var xuanxiangAobj = document.getElementById("xuanxiangA"); if(xuanxiangAobj.value==""){document.getElementById("clabelxuanxiangA").innerHTML="&nbsp;&nbsp;<font color=red>请输入选项A</font>";return false;}else{document.getElementById("clabelxuanxiangA").innerHTML="  "; } 

return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
