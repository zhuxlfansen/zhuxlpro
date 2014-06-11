<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>挂号结果</title>
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- Le styles -->
	<link type="text/css"  href="static/commonCSS/bootstrap_3.1.min.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCSS/bootstrap-responsive.min.css" rel="stylesheet">
	<script src="static/commonJS/jquery-1.10.2.min.js"></script>
	<script src="static/commonJS/bootstrap_3.1.min.js"></script>
	<script src="static/commonJS/My97DatePicker/WdatePicker.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  
  
  <body>
   <div class="container" style="width:100%;margin-top:10px; margin-left:-5px; margin-right:-5px;padding-left: 0px;padding-right: 0px">
      
      <div class="row marketing" style="margin-left: 0px">
        <div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading" >
		  	<h3 class="text-muted" style="color: green">恭喜您挂号成功！</h3>
		  </div>
		  <div class="panel-body" id="panelBody">
			  <p>您的预约日期为：<strong>2014年05月22日 下午</strong></p>
			  <p>您的预约号为：<strong>014号</strong></p>
          </div>
    </div>
  </body>
</html>


			  	