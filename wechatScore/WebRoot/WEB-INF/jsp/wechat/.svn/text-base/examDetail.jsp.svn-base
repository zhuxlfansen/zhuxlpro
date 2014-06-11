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
<div data-role="page" id="backPage" >
<header data-role="header">
<a href="javascript:;" onclick="window.location.href='<%=path %>/mob/examFullList?wechatCode=${wechatCode }'" data-icon="home" data-iconpos="notext"></a>
<h1>成绩详情</h1>
</header>
<article data-role="content">
<c:choose>
<c:when test="${status=='full'}">
	<h1 style="margin:0;">${obj.examName }</h1>
	<h4 >学生姓名：${obj.stuName }</h4>
	<ul data-role="listview">
		<c:forEach items="${mapList }" var="score">
		 <li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/scoreDetail?wechatCode=${wechatCode }&scoreId=${score.scoreId}'" data-rel="dialog" data-transition="pop">${score.subjectName }:${score.score }</a></li>
		</c:forEach>
	</ul>
</c:when>
<c:otherwise>
<p>暂无该考试成绩信息！</p>
</c:otherwise>
</c:choose>
</article>
<footer data-role="footer" data-position="fixed"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>
</body>
</html>
