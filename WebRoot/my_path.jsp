<%@ page import="java.util.HashMap" %>
<%@ page import="util.PageManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CommDAO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  Date: 2022/3/30
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的轨迹</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
    <link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.0.2/jquery.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=1.0&type=webgl&ak=G1AW9gjNxS1aBMurdlVSrr9Uq9aedTrI"></script>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <style>
        .card{
            width: 400px;
            position: absolute;
            top: 10px;
            left: 10px;
            padding: 10px;
            background: rgba(255, 255, 255, 0.82);
            border-radius: 10px;
            z-index: 100;
        }
        .colors{
            margin-top: 10px;
        }
    </style>
</head>
<%
    String url = "quezhengxinxi.jsp?1=1";
    String sql =  "select * from quezhenxinxi where 1=1";

    sql+=" order by id desc";
    List<HashMap> list = new CommDAO().select(sql);
%>
<body>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">选择位置</h4>
            </div>
            <div class="modal-body">
                    <label class="control-label">
                        <input placeholder="输入关键字" id="searchInput" type="text" onchange="onSearch()" class="form-control">
                    </label>
                <div style="width: 100%;height: 500px" id="add_path"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="save()">确定</button>
            </div>
        </div>
    </div>
</div>
<div class="data">
    <%
        for(HashMap map:list){
    %>
    <data path="<%= map.get("path")%>"
          name="<%= map.get("name")%>"
          sex="<%= map.get("sex")%>"
          age="<%= map.get("age")%>"></data>
    <%
        }
    %>
</div>
<div id="map" style="width: 100%;height: 100%;"></div>
<div class="card">
    <h1>添加我的轨迹</h1>
    <button class="btn" onclick="loadMap()" type="button" data-toggle="modal" data-target="#myModal">选择路径</button>
    <div class="colors">

    </div>
</div>
<script>
    const map = new BMapGL.Map("map");
    map.enableScrollWheelZoom(true);
    const point = new BMapGL.Point(116.404, 39.915);
    map.centerAndZoom(point, 15);
    const scaleCtrl = new BMapGL.ScaleControl();  // 添加比例尺控件
    map.addControl(scaleCtrl);
    const zoomCtrl = new BMapGL.ZoomControl();  // 添加缩放控件
    map.addControl(zoomCtrl);
    const datas = $("data");
    let local = null;
    const list = [];
    let my_point = [];
    const colors = ["#367459","#411445","#8e453f","#6a3427","#87843b","#5f3c23","#5f3c23","#145b7d","#563624","#508a88"];
    const distance = [];
    let my_color = "#0f0";
    for(let i = 0;i< datas.length;i++){
        let path = datas.eq(i).attr("path");
        const age = datas.eq(i).attr("age");
        const color = getRandomColor();
        list.push({path:[], name:datas.eq(i).attr("name"),age,
            sex:datas.eq(i).attr("sex"),color});
        const split = path.split(";");
        if(split.length > 1){
            split.forEach(item=>{
                const point = new BMapGL.Point(...item.split(","));
                list[i].path.push(point)
                const marker = new BMapGL.Marker(point);
                map.addOverlay(marker);
            })
        }
        var trackLine = new BMapGL.Polyline(list[i].path,{
            strokeColor:color,
            strokeWeight:8 ,
            strokeOpacity:0.8,
            enableEditing: false,
            enableClicking: false,
        });
        map.addOverlay(trackLine);
    }
    updateCard();

    function onSearch(){
        if(local !== null){
            local.search($("#searchInput")[0].value);
        }
    }

    function loadMap(){
        my_point = [];
        const add_map = new BMapGL.Map("add_path");
        const point = new BMapGL.Point(116.404, 39.915);
        add_map.centerAndZoom(point, 15);
        add_map.enableScrollWheelZoom(true);
        const scaleCtrl = new BMapGL.ScaleControl();  // 添加比例尺控件
        add_map.addControl(scaleCtrl);
        const zoomCtrl = new BMapGL.ZoomControl();  // 添加缩放控件
        add_map.addControl(zoomCtrl);
        local = new BMapGL.LocalSearch(add_map, {
            renderOptions: {map: add_map}
        })
        add_map.addEventListener('click', function(e) {
            if(e.overlay){
                my_point = [];
            }else{
                my_point.push(new BMapGL.Point(e.latlng.lng, e.latlng.lat));
            }
            updateView(add_map);
        });
    }

    function getRandomColor(){
        const index = Math.floor(Math.random()*colors.length)
        return colors[index];
    }
    function updateView(add_map){
        add_map.clearOverlays();
        my_point.forEach(item=>{
            const marker = new BMapGL.Marker(item);// 创建标注
            add_map.addOverlay(marker);
        });
        if(my_point.length > 1){
            var trackLine = new BMapGL.Polyline(my_point,{
                strokeColor:"#ff5405",//设置颜色
                strokeWeight:8 ,//宽度
                strokeOpacity:0.8,//折线的透明度，取值范围0 - 1
                enableEditing: false,//是否启用线编辑，默认为false
                enableClicking: false,//是否响应点击事件，默认为true
            });
            add_map.addOverlay(trackLine);
        }
    }
    function getDistance(point1,point2){
        let distance = map.getDistance(point1, point2);
        return (distance / 1000).toFixed(2);
    }
    function updateCard(){
        let html = "";
        list.forEach(item=>{
            html+= "<div style='background-color: "+item.color+";padding: 3px;color:#ffffff;'>" +
                "<h4>"+item.name+"</h4>" +
                "<span> "+item.sex+" </span>" +
                "<span> "+item.age+"岁 </span>" +
                "</div>"
        })
        if(my_point[0] !== undefined){
            html+= "<div style='background-color: "+my_color+";padding: 3px'>" +
                "<h4 style='color:#fff;'>我的位置</h4>" +
                "</div>"
        }
        $(".colors").eq(0).html(html);
    }
    function save(){
        $('#myModal').modal('hide');
        my_point.forEach(item=>{
            const marker = new BMapGL.Marker(item);//创建标注
            map.addOverlay(marker);
        });
        my_point.forEach(point=>{
            list.forEach(item=>{
                item.path.forEach(p=>{
                    distance.push(getDistance(point,p));
                })
            })
        })
        if(distance.sort()[0] < 0.3){
            my_color = "#f00";
        }else if(distance.sort()[0] < 1){
            my_color = "#fd9f00"
        }else if(distance.sort()[0] > 1){
            my_color = "#01e301"
        }
        if(my_point.length > 1){
            var trackLine = new BMapGL.Polyline(my_point,{
                strokeColor: my_color,//设置颜色
                strokeWeight:8 ,//宽度
                strokeOpacity:0.8,//折线的透明度，取值范围0 - 1
                enableEditing: false,//是否启用线编辑，默认为false
                enableClicking: false,//是否响应点击事件，默认为true
            });
            map.addOverlay(trackLine);
        }
        map.centerAndZoom(my_point[0], 15);
        updateCard();
    }
</script>
</body>
</html>
