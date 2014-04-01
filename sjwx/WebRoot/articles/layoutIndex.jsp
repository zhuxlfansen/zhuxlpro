<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale-1,maximum-scale=1.0,user-scalable=no">
<title>无标题文档</title>
<link type="text/css"  href="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<script src="<%=path %>/static/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.js"></script>
</head>

<body>
<div data-role="page" id="backPage" >
<header data-role="header">
<a data-rel="back" data-icon="back" data-iconpos="notext">后退</a>
<h1>户型品鉴</h1>
</header>
<img alt="" src="../static/img/zh_top.jpg" width="100%">
<ul data-role="listview" data-theme="g" >
	<li >
		<img alt="" src="../static/img/layout_01_max.jpg">
		<h3><a href="layoutDetail.jsp">90㎡三房</a></h3>
		<p>经济型三房，送阳台</p>
	</li>
	<li>
		<img alt="" src="../static/img/layout_02_max.jpg">
		<h3>90㎡三房</h3>
		<p>经济型三房，送阳台</p>
	</li>
	<li>
		<img alt="" src="../static/img/layout_03_max.jpg">
		<h3>90㎡三房</h3>
		<p>经济型三房，送阳台</p>
	</li>
	<li>
		<img alt="" src="../static/img/layout_02_max.jpg">
		<h3>90㎡三房</h3>
		<p>经济型三房，送阳台</p>
	</li>
</ul>

</div>
<div data-role="page" id="mypanel" > 
<!-- panel content goes here --> 123
</div> 
</body>
</html>
