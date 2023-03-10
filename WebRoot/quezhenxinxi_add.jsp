<%@ page import="dao.CommDAO" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: hefuh
  Date: 2022/3/29
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加确诊信息</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/popup.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=1.0&type=webgl&ak=G1AW9gjNxS1aBMurdlVSrr9Uq9aedTrI"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.0.2/jquery.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <style>
        body{
            background: #EEEEEE;
        }
        .card{
            width:700px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px #0b0b0b;
            margin:20px auto;
        }
        .card-body{
            padding: 10px;
        }
    </style>
</head>
<%
    HashMap ext = new HashMap();
    if (request.getParameter("f") != null) {
        new CommDAO().insert(request, response, "quezhenxinxi", ext, true, false, "");
    }
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
                <label>
                    <input placeholder="输入关键字" id="searchInput" type="text" class="form-control">
                </label>
                <button class="btn btn-primary" onclick="onSearch()">搜索</button>
                <div style="width: 100%;height: 500px" id="map"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="save()">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="card">
    <div class="card-body">
        <h1 style="text-align: center">添加确诊人员信息</h1>
        <form action="./quezhenxinxi_add.jsp?f=f" method="post">
            <div class="form-group">
                <label class="control-label" for="name">姓名：</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="输入姓名">
            </div>
            <div class="form-group">
                <label class="control-label" for="age">
                    年龄：
                </label>
                <input type="text" id="age" name="age" class="form-control" placeholder="输入年龄">
            </div>
            <div class="form-group">
                <label class="control-label" for="identifyCard">
                    身份证：
                </label>
                <input type="text" id="identifyCard" name="identifyCard" class="form-control" placeholder="输入身份证">
            </div>
            <div class="form-group">
                <label class="control-label" for="phone">
                    手机号：
                </label>
                <input type="text" id="phone" name="phone" class="form-control" placeholder="输入手机号">
            </div>
            <div class="form-group">
                <label class="control-label" for="sex">
                    选择性别：
                </label>
                <select class="form-control" id="sex" name="sex">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <label>
                <input id="area" name="path" type="hidden">
            </label>
            <div class="form-group">
                <label class="control-label">所经区域：</label>
                <button class="btn" type="button" data-toggle="modal" data-target="#myModal">添加</button>
                <div id="result" style="width: 100%;height: 300px"></div>
            </div>
            <button type="submit" class="btn btn-block btn-default">提交</button>
        </form>
    </div>
</div>
<script>
    const map = new BMapGL.Map("map");      // 创建地图实例
    map.centerAndZoom(new BMapGL.Point(116.387112,39.920977),15);
    map.enableScrollWheelZoom(true);
    const scaleCtrl = new BMapGL.ScaleControl();  // 添加比例尺控件
    map.addControl(scaleCtrl);
    const zoomCtrl = new BMapGL.ZoomControl();  // 添加缩放控件
    map.addControl(zoomCtrl);
    const cityCtrl = new BMapGL.CityListControl();  // 添加城市列表控件
    map.addControl(cityCtrl);
    const result = $("#result");
    result.hide();
    const local = new BMapGL.LocalSearch(map, {
        renderOptions: {map: map}
    });
    let list = [];
    map.addEventListener('click', function(e) {
        if(e.overlay){
            list = [];
        }else{
            list.push(new BMapGL.Point(e.latlng.lng, e.latlng.lat));
        }
        updateView();
    });
    function updateView(){
        console.log(list)
        map.clearOverlays();
        list.forEach(item=>{
            const marker = new BMapGL.Marker(item);        // 创建标注
            map.addOverlay(marker);
        });
        if(list.length > 1){
            var trackLine = new BMapGL.Polyline(list,{
                strokeColor:"#ff5405",//设置颜色
                strokeWeight:8 ,//宽度
                strokeOpacity:0.8,//折线的透明度，取值范围0 - 1
                enableEditing: false,//是否启用线编辑，默认为false
                enableClicking: false,//是否响应点击事件，默认为true
            });
            map.addOverlay(trackLine);
        }
    }
    function onSearch(){
        local.search($("#searchInput")[0].value);
    }
    function save(){
        result.show();
        const map = new BMapGL.Map("result");
        map.centerAndZoom(list[0], 15)
        map.clearOverlays();
        map.enableScrollWheelZoom(true);
        var trackLine = new BMapGL.Polyline(list,{
            strokeColor:"#18a45b",//设置颜色
            strokeWeight:8 ,//宽度
            strokeOpacity:0.8,//折线的透明度，取值范围0 - 1
            enableEditing: false,//是否启用线编辑，默认为false
            enableClicking: false,//是否响应点击事件，默认为true
        });
        map.addOverlay(trackLine);
        list.forEach(item=>{
            const marker = new BMapGL.Marker(item);// 创建标注
            map.addOverlay(marker);
        });
        $('#myModal').modal('hide')
        $("#area").val(list.map(item=>[item.lng,item.lat]).join(";"));
    }
</script>
</body>
</html>
