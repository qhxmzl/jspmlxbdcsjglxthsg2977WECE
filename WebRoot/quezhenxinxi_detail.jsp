<%@ page import="dao.CommDAO" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: hefuh
  Date: 2022/3/30
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    HashMap mqt = new CommDAO().getmap(id,"quezhenxinxi");
%>
<html>
<head>
    <title><%=mqt.get("name")%>的活动轨迹</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.0.2/jquery.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=1.0&type=webgl&ak=G1AW9gjNxS1aBMurdlVSrr9Uq9aedTrI"></script>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
</head>
<body>

<div>
    <ul>
        <li>姓名：<%= mqt.get("name") %></li>
        <li>性别：<%= mqt.get("sex") %></li>
        <li>年龄：<%= mqt.get("age") %></li>
        <li>身份证：<%= mqt.get("identifyCard") %></li>
        <li>手机号：<%= mqt.get("phone") %></li>
        <li>
            轨迹：
            <div style="width: 100%;height: 700px" path="<%= mqt.get("path")%>" id="map"></div>
        </li>
    </ul>
</div>
<script>
    const map = new BMapGL.Map("map");
    map.enableScrollWheelZoom(true);
    const path = $("#map").eq(0).attr("path");
    const items = path.split(";");
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
</script>
</body>
</html>
