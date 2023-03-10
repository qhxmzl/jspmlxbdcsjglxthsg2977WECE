<%@ page import="dao.CommDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.PageManager" %><%--
  Created by IntelliJ IDEA.
  Date: 2022/3/29
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<html>
<head>
    <title>确诊人员信息更新</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
    <link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.0.2/jquery.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=1.0&type=webgl&ak=G1AW9gjNxS1aBMurdlVSrr9Uq9aedTrI"></script>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
</head>
<body>
<form name="form1" id="form1" method="post" action="">
    <label for="name">搜索: 姓名：</label>
    <input name="name" type="text" id="name" class="form-control2" />
    <label for="phone">手机号：</label>
    <input name="phone" type="text" id="phone" class="form-control2" />
    <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" />
    <input type="button" onClick="javascript:location.href='quezhenxinxi_add.jsp';" name="add" value="添加" class="btn btn-primary btn-small" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">
    <tr>
        <td width="35" height="50" align="center" bgcolor="#E6E6E6">序号</td>
        <td bgcolor='#E6E6E6'>姓名</td>
        <td bgcolor='#E6E6E6'>年龄</td>
        <td bgcolor='#E6E6E6' align='center'>性别</td>
        <td bgcolor='#E6E6E6'>身份证</td>
        <td bgcolor='#E6E6E6'>手机号</td>
        <td bgcolor='#E6E6E6'>所经区域</td>
        <td width="138" height="50" align="center" bgcolor="#E6E6E6">添加时间</td>
        <td width="220" height="50" align="center" bgcolor="#E6E6E6">操作</td>
    </tr>
    <%
        new CommDAO().delete(request,"quezhenxinxi");
        String url = "quezhengxinxi.jsp?1=1";
        String sql =  "select * from quezhenxinxi where 1=1";

        if("".equals(request.getParameter("phone")) ||request.getParameter("phone")==null ){}else{sql=sql+" and phone like '%"+request.getParameter("phone")+"%'";}
        if("".equals(request.getParameter("name")) ||request.getParameter("name")==null ){}else{sql=sql+" and name like '%"+request.getParameter("name")+"%'";}
        sql+=" order by id desc";
        ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request);
        int i=0;
        for(HashMap map:list){
            i++;
    %>
    <tr>
        <td width="35" height="50" align="center"><%=i %></td>
        <td><%=map.get("name") %></td>
        <td><%=map.get("age") %></td>
        <td><%=map.get("sex") %></td>
        <td align='center'><%=map.get("identifyCard") %></td>
        <td><%=map.get("phone") %></td>
        <td>
            <div style="width: 100%;height: 100px" path="<%=map.get("path") %>" id="container-<%=i %>"></div>
        </td>
        <td width='90' align='center'>
            <%=map.get("create_time") %>
        </td>
        <td width="220" height="50" align="center">
            <a class="btn btn-info btn-small" href="quezhengxinxi.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>
            <a class="btn btn-info btn-small" href="quezhenxinxi_detail.jsp?id=<%=map.get("id")%>" target="_blank">详细</a> </td>
    </tr>
    <%
        }
    %>
</table>
<script>
    const size = <%= list.size() %>
    for(let i =1;i<=size;i++){
        const map = new BMapGL.Map(("container-"+i));
        map.enableScrollWheelZoom(true);
        const path = $("#container-" + i).eq(0).attr("path");
        const items = path.split(";");
        const point = new BMapGL.Point(116.404, 39.915);
        map.centerAndZoom(point, 15);
        if(items.length > 1){
            const list = [];
            map.clearOverlays();
            items.forEach(item=>{
                const point = new BMapGL.Point(...item.split(','));
                list.push(point)
                const marker = new BMapGL.Marker(point);
                map.addOverlay(marker);
            })
            map.centerAndZoom(list[0], 15);
            var trackLine = new BMapGL.Polyline(list,{
                strokeColor:"#18a45b",
                strokeWeight:8 ,
                strokeOpacity:0.8,
                enableEditing: false,
                enableClicking: false,
            });
            map.addOverlay(trackLine);
        }
    }
</script>
</body>
</html>
