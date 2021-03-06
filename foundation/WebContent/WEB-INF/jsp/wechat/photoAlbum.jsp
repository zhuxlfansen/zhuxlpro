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
<title>投票</title>
<link type="text/css"  href="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<script src="<%=path %>/static/js/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.js"></script>
</head>

<body>
<div data-role="page">
<header data-role="header">
	<nav data-role="navbar" data-iconpos="left">
		<ul>
			<li><a href="javascript:;" onclick="window.location.href='processLine?wechatCode=${wechatCode}'" data-icon="calendar">日程</a></li>
			<li><a href="javascript:;" onclick="window.location.href='noticeList?wechatCode=${wechatCode}'" data-icon="comment">通知</a></li>
			<li><a href="javascript:;" onclick="window.location.href='photoList?wechatCode=${wechatCode}'" data-icon="camera">我的</a></li>
			<li><a href="javascript:;" onclick="window.location.href='photoAlbum?wechatCode=${wechatCode}'" class="ui-btn-active"  data-icon="heart">投票</a></li>
		</ul>
	</nav>
</header>
<div class="content" data-role="content">
<ul data-role="listview" data-filter="true">
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">中国科技大学</a><p class="ui-li-aside">12</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">北京大学</a><p class="ui-li-aside">3</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">清华大学</a><p class="ui-li-aside">4</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">上海交通大学</a><p class="ui-li-aside">22</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">中南大学</a><p class="ui-li-aside">15</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">合肥工业大学</a><p class="ui-li-aside">13</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">西安政法大学</a><p class="ui-li-aside">5</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">中央民族大学</a><p class="ui-li-aside">23</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">中国人民大学</a><p class="ui-li-aside">6</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">北京邮电大学</a><p class="ui-li-aside">9</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">中国民航大学</a><p class="ui-li-aside">32</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">天津科技大学</a><p class="ui-li-aside">13</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">山西大学</a><p class="ui-li-aside">10</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">安徽大学</a><p class="ui-li-aside">0</p></li>
	<li><a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoDetail?wechatCode=${wechatCode}'">重庆大学</a><p class="ui-li-aside">15</p></li>
</ul>

</div>
<footer data-role="footer"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>

</body>
</html>
