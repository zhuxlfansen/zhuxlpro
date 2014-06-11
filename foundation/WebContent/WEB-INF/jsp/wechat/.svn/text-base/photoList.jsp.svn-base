<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale-1,maximum-scale=1.0,user-scalable=no">
<title>我的作品</title>
<link type="text/css"  href="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<link type="text/css"  href="<%=path %>/static/css/timeLine.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/static/js/lightbox/css/lightbox.css">
<script src="<%=path %>/static/js/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.js"></script>
<script src="<%=path %>/static/js/lightbox/js/lightbox.js"></script>
<style type="text/css">
.point-time{top:5px}
.content{margin-top:0;margin-bottom: 0px}
</style>
</head>

<body>
<div data-role="page">
<header data-role="header">
	<nav data-role="navbar" data-iconpos="left">
		<ul>
			<li><a href="javascript:;" onclick="window.location.href='processLine?wechatCode=${wechatCode}'" data-icon="calendar">日程</a></li>
			<li><a href="javascript:;" onclick="window.location.href='noticeList?wechatCode=${wechatCode}'" data-icon="comment">通知</a></li>
			<li><a href="javascript:;" onclick="window.location.href='photoList?wechatCode=${wechatCode}'" class="ui-btn-active" data-icon="camera">我的</a></li>
			<li><a href="javascript:;" onclick="window.location.href='photoAlbum?wechatCode=${wechatCode}'" data-icon="heart">投票</a></li>
		</ul>
	</nav>
</header>
<div class="content" data-role="content">
<c:choose>
	<c:when test="${notExist=='notExist'}">
		<h2 style='color: red'>该微信号未绑定！请返回微信界面进行绑定！</h2>
	</c:when>
	<c:when test="${fn:length(mapList)<=0} ">
		<h2 style='color: red'>您尚未上传作品！请返回微信界面上传您的作品！</h2>
	</c:when>
	<c:otherwise>
		<article>
		<c:forEach items="${mapList }" var="obj" varStatus="status">
			<section>
				<span class="point-time point-red"></span>
				<time datetime="2013-03">
					<span>${obj.date }</span>
					<span>${obj.time }</span>
				</time>
				<aside>
					<a class="example-image-link" href="<%=path %>/static/upload/${userId}/${obj.img}" data-lightbox="${status.index+1}" data-title="${obj.date }"><img alt="" src="<%=path %>/static/upload/${userId}/${obj.img}" style="border-radius:10px"  width="200px"></a>
				</aside>
			</section>
		</c:forEach>
		</article>
	</c:otherwise>
</c:choose>
</div>
<footer data-role="footer"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>

</body>
</html>
