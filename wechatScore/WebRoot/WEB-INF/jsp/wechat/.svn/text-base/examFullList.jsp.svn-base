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
<title>考试列表</title>
<link type="text/css"  href="<%=path %>/static/commonJs/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<script src="<%=path %>/static/commonJs/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/commonJs/jqmobile/jquery.mobile-1.4.2.js"></script>
</head>

<body>
<div data-role="page" id="backPage" >
<header data-role="header">
<h1>考试列表</h1>
</header>
<article data-role="content">
<c:choose>
<c:when test="${status=='full'}">
	<ul data-role="listview">
		<c:forEach items="${mapList }" var="exam">
		 <li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/examDetail?examId=${exam.examId }&wechatCode=${wechatCode }'" data-transition="pop">${exam.examName }</a></li>
		</c:forEach>
	</ul>
</c:when>
<c:otherwise>
<p>暂无该考试信息！</p>
</c:otherwise>
</c:choose>
</article>
<footer data-role="footer" data-position="fixed"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>
</body>
</html>
