<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link type="text/css"  href="<%=path %>/static/commonJs/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<script src="<%=path %>/static/commonJs/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/commonJs/jqmobile/jquery.mobile-1.4.2.js"></script>
</head>

<body>
<div data-role="page" id="yuwen" >
<header data-role="header">
<h1>${obj.subjectName}</h1>
<a href="javascript:;" onclick="window.location.href='<%=path %>/mob/examDetail?examId=${obj.examId }&wechatCode=${wechatCode }'" data-icon="delete" data-iconpos="notext"></a>
</header>
<div data-role="content">
	<c:forEach items="${mapList }" var="score">
	<p>${score.qtName }:${score.score}</p>
	</c:forEach>
</div>
</div>
</body>
</html>
