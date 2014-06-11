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
<title>通知</title>
<link type="text/css"  href="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<script src="<%=path %>/static/js/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.js"></script>
</head>

<body>
<div data-role="page" id="main">
<header data-role="header">
	<nav data-role="navbar" data-iconpos="left">
		<ul>
			<li><a href="javascript:;" onclick="window.location.href='processLine?wechatCode=${wechatCode}'" data-icon="calendar">日程</a></li>
			<li><a href="javascript:;" onclick="window.location.href='noticeList?wechatCode=${wechatCode}'" class="ui-btn-active" data-icon="comment">通知</a></li>
			<li><a href="javascript:;" onclick="window.location.href='photoList?wechatCode=${wechatCode}'" data-icon="camera">我的</a></li>
			<li><a href="javascript:;" onclick="window.location.href='photoAlbum?wechatCode=${wechatCode}'" data-icon="heart">投票</a></li>
		</ul>
	</nav>
</header>
<div class="content" data-role="content">
<ul data-role="listview">
    <li><a href="#mes101" data-transition="pop">关于清华大学2014年交流会的通知<small style="color: gray">(2014-04-01)</small></a></li>
    <li><a href="#mes101" data-transition="pop">关于北京大学2014年交流会的通知<small style="color: gray">(2014-03-21)</small></a></li>
    <li><a href="#mes101" data-transition="pop">关于同济大学2014年交流会的通知<small style="color: gray">(2014-03-13)</small></a></li>
    <li><a href="#mes101" data-transition="pop">关于深圳大学2014年交流会的通知<small style="color: gray">(2014-03-12)</small></a></li>
    <li><a href="#mes101" data-transition="pop">关于中国科技大学2014年交流会的通知<small style="color: gray">(2014-03-01)</small></a></li>
</ul>
</div>
<footer data-role="footer" data-position="fixed"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>

<div data-role="page" id="mes101">
<header data-role="header">
	<a href="#main" data-icon="back" data-iconpos="notext" data-transition="pop"></a>
	<h3>通知详情</h3>
</header>
<article data-role="content">
<h1 style="margin:0;">2014年交流会的通知</h1>
<summary>2014-04-01</summary>
<p>交流会自2000年起每两年举办一次，由各高校轮流承办，各大学选派代表参加。会上总结交流过去两年各校公益活动的成果与经验，讨论进展过程中遇到的问题，并对今后的活动形式做出新的探讨。</p>
<p>第七次交流会　2012年　四川大学　21所高校和1个地区，23个社团 500余人与会</p>
<p>第七次唐仲英德育奖学金交流会于2012年10月2日-5日在四川大学召开。唐先生第一次在公开场合谈及自己的奋斗经历，令人振奋和备受鼓舞。他的坚持，他的笑容，他的爱，是每个与会者心中的一盏灯。此次大会主要议题包括：...</p>
</article>
<footer data-role="footer" data-position="fixed"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>

</body>
</html>
