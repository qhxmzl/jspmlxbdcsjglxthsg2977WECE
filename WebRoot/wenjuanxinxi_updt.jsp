<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>问卷信息</title>
	
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

new CommDAO().update(request,response,"wenjuanxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"wenjuanxinxi"); 

%>
  <form  action="wenjuanxinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改问卷信息:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">  
     
     <tr><td>问题：</td><td><textarea name='wenti' cols='50' rows='5' id='wenti' class="form-control" style="width:600px;height:80px;" ><%=mmm.get("wenti")%></textarea></td></tr>
     <tr><td>选项A：</td><td><input name='xuanxiangA' type='text' id='xuanxiangA' class="form-control"  style="width:600px;" value='<%=mmm.get("xuanxiangA")%>' /></td></tr>
     <tr><td>选项B：</td><td><input name='xuanxiangB' type='text' id='xuanxiangB' class="form-control"  style="width:600px;" value='<%=mmm.get("xuanxiangB")%>' /></td></tr>
     <tr><td>选项C：</td><td><input name='xuanxiangC' type='text' id='xuanxiangC' class="form-control"  style="width:600px;" value='<%=mmm.get("xuanxiangC")%>' /></td></tr>
     <tr><td>选项D：</td><td><input name='xuanxiangD' type='text' id='xuanxiangD' class="form-control"  style="width:600px;" value='<%=mmm.get("xuanxiangD")%>' /></td></tr>
     <tr style="display:none"><td>票数A：</td><td><input name='piaoshuA' type='text' id='piaoshuA' value='<%= mmm.get("piaoshuA")%>' class="form-control" /></td></tr>
     <tr style="display:none"><td>票数B：</td><td><input name='piaoshuB' type='text' id='piaoshuB' value='<%= mmm.get("piaoshuB")%>' class="form-control" /></td></tr>
     <tr style="display:none"><td>票数C：</td><td><input name='piaoshuC' type='text' id='piaoshuC' value='<%= mmm.get("piaoshuC")%>' class="form-control" /></td></tr>
     <tr style="display:none"><td>票数D：</td><td><input name='piaoshuD' type='text' id='piaoshuD' value='<%= mmm.get("piaoshuD")%>' class="form-control" /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


