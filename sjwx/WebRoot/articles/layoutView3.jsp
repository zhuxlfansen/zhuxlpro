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


<link rel="stylesheet" href="<%=path %>/static/fullPage/css/jquery.fullPage.css">
<style>
.section { text-align: center; font: 50px "Microsoft Yahei"; color: #fff;}
</style>
<script src="<%=path %>/static/fullPage/js/jquery-1.8.3.min.js"></script>
<script src="<%=path %>/static/fullPage/js/jquery-ui-1.10.3.min.js"></script>
<script src="<%=path %>/static/fullPage/js/jquery.fullPage.min.js"></script>
<script src="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.js"></script>
<script>
$(document).ready(function() {
	$.fn.fullpage({
		slidesColor: ['#1bbc9b', '#4BBFC3', '#7BAABE', '#f90'],
		anchors: ['page1', 'page2', 'page3', 'page4'],
		navigation: true
	});
});
</script>

</head>

<body>
<div class="section">
	<h3>第一屏</h3>
	<p>fullPage.js — 项目导航演示</p>
</div>
<div class="section">
	<h3>第二屏</h3>
	<p>请查看右边的圆圈</p>
</div>
<div class="section">
	<h3>第三屏</h3>
	<p>圆圈还可以设置位置，颜色，加上 tip，点击可以控制</p>
</div>
<div class="section">
	<h3>第四屏</h3>
	<p>这是最后一屏</p>
</div>

<!-- <div data-role="page">
	<div data-role="header">
		<a data-rel="back" data-icon="back" data-iconpos="notext">后退</a>
		<h1>90㎡三房</h1>
		<a data-rel="home" data-icon="home" data-iconpos="notext"></a>
	</div>
	<div>
	<div class="section">
		<img alt="" src="../static/img/ybf_01.jpg" width="100%">
	</div>
	<div class="section">
		<img alt="" src="../static/img/ybf_02.jpg" width="100%">
	</div>
	<div class="section">
		<img alt="" src="../static/img/ybf_03.jpg" width="100%">
	</div>
	<div class="section">
		<img alt="" src="../static/img/ybf_04.jpg" width="100%">
	</div>
	</div>
</div> -->

</body>
</html>
