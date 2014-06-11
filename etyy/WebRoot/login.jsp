<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>省立儿童医院预约挂号系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
body {
	margin: 0;
	padding-left:0;
	background:url(static/commonJS/je/css/images/backg3.png) ; 
	font-family: 微软雅黑, Helvetica, sans-serif;
	font-size: 13px;
	color:#333;
    }

   .center{
		position: absolute;
		left:50%;
		width:413px;
		height:356px;
		top:50%;
		margin-top:-180px;
		text-align:center;
		margin-left:-210px;
		padding:0px;
	    background:url(static/commonJS/je/css/images/centerBackg_03.png) ; 
      }
		  
    .input{
		margin-top:10px;
		padding:10px;
		text-align:center;
		width:250px;
		height:90px;
		margin-left:62px;
		border-radius:5px ;
		font-size:18px;
		font-weight:600;
		color:#fff;
	}
	
   .mylogin{
		margin-left:0px;
		margin-top:30px;
		height:40px;
		border-radius:5px; 
		cursor:pointer;
		line-height:40px;
	}

	.mylogin a {
		display:block;
	    height:32px;
		width:210px;
		line-height:32px;
		background:#2d6b00;
		margin-left:92px;
		border-radius:5px;
		text-decoration:none;
		font-weight:bold;
		font-size:16px;
		color:#fff;
	}

	.mylogin a:hover {
		font-weight:bold;
		font-size:16px;
		display:block;
		color:#e0fdc6;
		background-color:#4e9901;
		border-radius:5px;
	}
	
	img{
		padding-top:50px;
		 }
</style>
  </head>
  
  <body>
   <div class="center">
	 <div class="img1"><img src="static/commonJS/je/css/images/Logo_07.png"/></div>
		<div class="input">
		<p><span class="ft" style="padding-right:5px;">账&nbsp;&nbsp;号:</span><input type="text" class="text" style=" width:150px;"></p>
		<p><span class="ft" style="padding-right:5px;">密&nbsp;&nbsp;码:</span><input type="password" class="text" style="width:150px;"></p>
	 </div>
	 <div class="mylogin"><a href="index.jsp">登&nbsp;&nbsp;录</a></div>
  </div>
  </body>
</html>
