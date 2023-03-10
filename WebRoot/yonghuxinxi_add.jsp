<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="util.Info" %>
<%@page import="dao.CommDAO" %>
<%@page import="util.PageManager" %>
<html>
<head>

    <title>用户信息</title>

    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
    <link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/popup.js"></script>

</head>
<%
    String id = "";
    id = request.getParameter("id");
%>
<script language="javascript">

    function gow() {
        document.location.href = "yonghuxinxi_add.jsp?id=<%=id%>";
    }

    function hsgxia2shxurxu(nstr, nwbk) {
        if (eval("form1." + nwbk).value.indexOf(nstr) >= 0) {
            eval("form1." + nwbk).value = eval("form1." + nwbk).value.replace(nstr + "；", "");
        } else {
            eval("form1." + nwbk).value = eval("form1." + nwbk).value + nstr + "；";
        }
    }
</script>

<%
    HashMap ext = new HashMap();
    if (request.getParameter("f") != null) {
        new CommDAO().insert(request, response, "yonghuxinxi", ext, true, false, "");
    }
%>

<body>
<form action="yonghuxinxi_add.jsp?f=f&id=<%=id%>" method="post" name="form1" onsubmit="return checkform();">
    添加用户信息:
    <br><br>
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc">
        <tr>
            <td width="200">账号：</td>
            <td><input name='zhanghao' type='text' id='zhanghao' value='' onblur='checkform()' class="form-control"/>&nbsp;*<label
                    id='clabelzhanghao'/></td>
        </tr>
        <tr>
            <td width="200">密码：</td>
            <td><input name='mima' type='text' id='mima' value='' onblur='checkform()'
                       class="form-control"/>&nbsp;*<label id='clabelmima'/></td>
        </tr>
        <tr>
            <td width="200">姓名：</td>
            <td><input name='xingming' type='text' id='xingming' value='' onblur='checkform()' class="form-control"/>&nbsp;*<label
                    id='clabelxingming'/></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><select name='xingbie' id='xingbie' class="form-control2">
                <option value="男">男</option>
                <option value="女">女</option>
            </select></td>
        </tr>
        <tr>
            <td width="200">年龄：</td>
            <td><input name='nianling' type='text' id='nianling' value='' onblur='checkform()' class="form-control"
                       style="width:600px;"/>&nbsp;*<label id='clabelnianling'/></td>
        </tr>
        <tr>
            <td width="200">地区：</td>
            <td><input name='diqu' type='text' id='diqu' value='' onblur='' class="form-control"/></td>
        </tr>
        <tr>
            <td width="200">手机号：</td>
            <td><input name='shoujihao' type='text' id='shoujihao' value='' onblur='checkform()' class="form-control"/>&nbsp;<label
                    id='clabelshoujihao'/>[7或8位电话，或11位手机]必需电话格式
            </td>
        </tr>
        <tr>
            <td width="200">头像：</td>
            <td><input name='touxiang' type='text' id='touxiang' size='50' value='' onblur='' class="form-control"/>
                <div style="margin-top:12px;">&nbsp;<input type='button' value='上传' onClick="up('touxiang')"/></div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" value="提交" class="btn btn-info btn-small"/>
                <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small"/></td>
        </tr>
    </table>
</form>

</body>
</html>


<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashMap" %>

<script language=javascript>

    function checkform() {

        var zhanghaoobj = document.getElementById("zhanghao");
        if (zhanghaoobj.value == "") {
            document.getElementById("clabelzhanghao").innerHTML = "&nbsp;&nbsp;<font color=red>请输入账号</font>";
            return false;
        } else {
            document.getElementById("clabelzhanghao").innerHTML = "  ";
        }
        var zhanghaoobj = document.getElementById("zhanghao");
        if (zhanghaoobj.value != "") {
            var ajax = new AJAX();
            ajax.post("factory/checkno.jsp?table=yonghuxinxi&col=zhanghao&value=" + zhanghaoobj.value + "&checktype=insert&ttime=<%=Info.getDateStr()%>")
            var msg = ajax.getValue();
            if (msg.indexOf('Y') > -1) {
                document.getElementById("clabelzhanghao").innerHTML = "&nbsp;&nbsp;<font color=red>账号已存在</font>";
                return false;
            } else {
                document.getElementById("clabelzhanghao").innerHTML = "  ";
            }
        }
        var mimaobj = document.getElementById("mima");
        if (mimaobj.value == "") {
            document.getElementById("clabelmima").innerHTML = "&nbsp;&nbsp;<font color=red>请输入密码</font>";
            return false;
        } else {
            document.getElementById("clabelmima").innerHTML = "  ";
        }
        var xingmingobj = document.getElementById("xingming");
        if (xingmingobj.value == "") {
            document.getElementById("clabelxingming").innerHTML = "&nbsp;&nbsp;<font color=red>请输入姓名</font>";
            return false;
        } else {
            document.getElementById("clabelxingming").innerHTML = "  ";
        }
        var nianlingobj = document.getElementById("nianling");
        if (nianlingobj.value == "") {
            document.getElementById("clabelnianling").innerHTML = "&nbsp;&nbsp;<font color=red>请输入年龄</font>";
            return false;
        } else {
            document.getElementById("clabelnianling").innerHTML = "  ";
        }
        var nianlingobj = document.getElementById("nianling");
        if (nianlingobj.value != "") {
            var ajax = new AJAX();
            ajax.post("factory/checkno.jsp?table=yonghuxinxi&col=nianling&value=" + nianlingobj.value + "&checktype=insert&ttime=<%=Info.getDateStr()%>")
            var msg = ajax.getValue();
            if (msg.indexOf('Y') > -1) {
                document.getElementById("clabelnianling").innerHTML = "&nbsp;&nbsp;<font color=red>年龄已存在</font>";
                return false;
            } else {
                document.getElementById("clabelnianling").innerHTML = "  ";
            }
        }
        var nianlingobj = document.getElementById("nianling");
        if (nianlingobj.value != "") {
            if (/^\d{15}$|^\d{18}$|^\d{17}[xX]$/.test(nianlingobj.value)) {
                document.getElementById("clabelnianling").innerHTML = "";
            } else {
                document.getElementById("clabelnianling").innerHTML = "&nbsp;&nbsp;<font color=red>必需身份证格式</font>";
                return false;
            }
        }
        var shoujihaoobj = document.getElementById("shoujihao");
        if (shoujihaoobj.value != "") {
            if (/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(shoujihaoobj.value) || /^1[3|4|5|6|7|8|9][0-9]\d{8,8}$/.test(shoujihaoobj.value)) {
                document.getElementById("clabelshoujihao").innerHTML = "";
            } else {
                document.getElementById("clabelshoujihao").innerHTML = "&nbsp;&nbsp;<font color=red>[7或8位电话，或11位手机]必需电话格式</font>";
                return false;
            }
        }
        return true;
    }

    popheight = 450;
</script>
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
