<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Double lng=Double.valueOf(request.getParameter("lng"));
Double lat=Double.valueOf(request.getParameter("lat"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>地图详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">  
	html{height:100%}  
	body{height:100%;margin:0px;padding:0px}  
	#container{height:100%;width:100%}  
	</style>  
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=l56EB0XkMM5pKGI41mYgCsxO"></script>
	</head> 
  </head>
  
  <body>
    <div id="container"></div> 
	<script type="text/javascript"> 
	var map = new BMap.Map("container");            // 创建Map实例
	var point = new BMap.Point(<%=lng%>,<%=lat%>);    // 创建点坐标
	map.centerAndZoom(point,25);                     // 初始化地图,设置中心点坐标和地图级别。
	map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
	map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
	map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
	map.enableScrollWheelZoom();           
	var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);    
	</script>  
  </body>
</html>
