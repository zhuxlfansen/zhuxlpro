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
<title>日程</title>
<link type="text/css"  href="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<link type="text/css"  href="<%=path %>/static/css/timeLine.css" rel="stylesheet">
<script src="<%=path %>/static/js/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.js"></script>
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
			<li><a href="javascript:;" onclick="window.location.href='processLine?wechatCode=${wechatCode}'" class="ui-btn-active" data-icon="calendar">日程</a></li>
			<li><a href="javascript:;" onclick="window.location.href='noticeList?wechatCode=${wechatCode}'" data-icon="comment">通知</a></li>
			<li><a href="javascript:;" onclick="window.location.href='photoList?wechatCode=${wechatCode}'" data-icon="camera">我的</a></li>
			<li><a href="javascript:;" onclick="window.location.href='photoAlbum?wechatCode=${wechatCode}'" data-icon="heart">投票</a></li>
		</ul>
	</nav>
</header>
<div class="content" data-role="content">
	<article>
		<h3>4月-5月</h3>
		<section>
			<span class="point-time point-green"></span>
			<time datetime="2013-03">
			</time>
			<aside>
				<p class="brief"><span class="text-green">活动筹备</span></p>
			</aside>
		</section>
	</article>
	<article>
		<h3>5月-9月</h3>
		<section>
			<span class="point-time point-green"></span>
			<time datetime="2013-03">
			</time>
			<aside>
				<p class="brief"><span class="text-green">手机摄影作品征集，爱心公益策划方案征集</span></p>
			</aside>
		</section>
	</article>
	<article>
		<h3>10月1日</h3>
		<section>
			<span class="point-time point-red"></span>
			<time datetime="2013-03">
				<span>全天</span>
			</time>
			<aside>
				<p class="brief"><span class="text-red"> 接站、报到、安排入住、参观校园（ 全体参会学生、川大志愿者）</span></p>
			</aside>
		</section>
		<section>
			<span class="point-time point-blue"></span>
			<time datetime="2013-03">
				<span>晚上</span>
			</time>
			<aside>
				<p class="brief"><span class="text-blue">预备会议（各校教师学生各一名）</span></p>
			</aside>
		</section>
	</article>
	<article>
		<h3>10月2日</h3>
		<section>
			<span class="point-time point-red"></span>
			<time datetime="2013-03">
				<span>上午</span>
			</time>
			<aside>
				<p class="brief"><span class="text-red"> 交流会开幕式、 大会报告</span></p>
			</aside>
		</section>
		<section>
			<span class="point-time point-blue"></span>
			<time datetime="2013-03">
				<span>下午</span>
			</time>
			<aside>
				<p class="brief"><span class="text-blue">分组讨论（一）</span></p>
			</aside>
		</section>
		<section>
			<span class="point-time point-green"></span>
			<time datetime="2013-03">
				<span>晚上</span>
			</time>
			<aside>
				<p class="brief"><span class="text-green"> 四川大学文艺演出、爱心社自由交流</span></p>
			</aside>
		</section>
	</article>
	<article>
		<h3>10月3日</h3>
		<section>
			<span class="point-time point-red"></span>
			<time datetime="2013-03">
				<span>上午</span>
			</time>
			<aside>
				<p class="brief"><span class="text-red">人文讲座、IIT介绍、毕业生联谊会介绍等、分组讨论（二）</span></p>
			</aside>
		</section>
		<section>
			<span class="point-time point-blue"></span>
			<time datetime="2013-03">
				<span>下午</span>
			</time>
			<aside>
				<p class="brief"><span class="text-blue">爱心社自由交流</span></p>
			</aside>
		</section>
		<section>
			<span class="point-time point-green"></span>
			<time datetime="2013-03">
				<span>晚上</span>
			</time>
			<aside>
				<p class="brief"><span class="text-green">联欢会</span></p>
			</aside>
		</section>
	</article>
	<article>
		<h3>10月4日</h3>
		<section>
			<span class="point-time point-red"></span>
			<time datetime="2013-03">
				<span>上午</span>
			</time>
			<aside>
				<p class="brief"><span class="text-red">参观</span></p>
			</aside>
		</section>
		<section>
			<span class="point-time point-blue"></span>
			<time datetime="2013-03">
				<span>下午</span>
			</time>
			<aside>
				<p class="brief"><span class="text-blue">素质拓展</span></p>
			</aside>
		</section>
		<section>
			<span class="point-time point-green"></span>
			<time datetime="2013-03">
				<span>晚上</span>
			</time>
			<aside>
				<p class="brief"><span class="text-green">聚餐</span></p>
			</aside>
		</section>
	</article>
	<article>
		<h3>10月5日</h3>
		<section>
			<span class="point-time point-red"></span>
			<time datetime="2013-03">
				<span>上午</span>
			</time>
			<aside>
				<p class="brief"><span class="text-red">闭幕式</span></p>
			</aside>
		</section>
		<section>
			<span class="point-time point-blue"></span>
			<time datetime="2013-03">
				<span>下午</span>
			</time>
			<aside>
				<p class="brief"><span class="text-blue">送站</span></p>
			</aside>
		</section>
	</article>
</div>
<footer data-role="footer"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>

</body>
</html>
