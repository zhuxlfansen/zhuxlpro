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
<link type="text/css"  href="static/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<script src="static/jqmobile/jquery-1.10.2.min.js"></script>
<script src="static/jqmobile/jquery.mobile-1.4.2.js"></script>
</head>

<body>
<!-- <section data-role="page" id="firstView" data-title="1th" >
	<header data-role="header" data-theme="b"><h1>第一个视图</h1></header>
	<article data-role="content">
	<a href="#secondView" data-transition="pop" data-rel="dialog">切换至第二个视图</a>
	<a href="tel:15955162551">拨号</a>
	<a href="sms:15955162551">短信</a>
	</article>
	<footer data-role="footer" ><h1>页脚</h1></footer>
</section>
<section data-role="page" id="secondView"  data-title="2th">
	<header data-role="header"><h1>第二个视图</h1></header>
	<article data-role="content">
	<a href="#firstView">切换至第一个视图</a>
	</article>
	<footer data-role="footer"><h1>页脚</h1></footer>
</section> -->
<!-- <a href="#home" data-role="button" data-icon="home" data-inline="true">首页</a>
<a href="#home" data-role="button" data-icon="arrow-l">首页</a>
<a href="#home" data-role="button" data-icon="arrow-r" data-iconpos="notext">首页</a>
<a href="#home" data-role="button" data-icon="arrow-u">首页</a>
<a href="#home" data-role="button" data-icon="arrow-d">首页</a> -->

<!-- <a href="#home" data-role="button" data-icon="back" data-inline="true" data-theme="b">back</a>
<a href="#home" data-role="button" data-icon="back" data-inline="true" data-theme="c">back</a> -->
<!-- <div data-role="controlgroup" data-type="horizontal">
	<a href="#" data-role="button" data-icon="home" data-theme="a" data-iconpos="notext">首页</a>
	<a href="#" data-role="button" data-icon="back" data-theme="b" data-iconpos="notext">返回</a>
	<a href="#" data-role="button" data-icon="forward" data-theme="c" data-iconpos="notext">前进</a>
</div> -->
<!-- <section data-role="page" id="forwardPage" data-add-back-btn="true" data-back-btn-text="后退">
	<header data-role="header">
	<h1>前进视图</h1>
	</header>
	<article>neirong</article>
	<footer data-role="footer"><h1>footer</h1></footer>
</section>
<section data-role="page" id="backPage">
	<header data-role="header">
	<a data-rel="back">后退</a>
	<h1>后退视图</h1>
	</header>
</section> -->

<!-- grid -->
<!-- <div data-role="page" id="backPage">
	<header data-role="header">
	<h1>footer BAR</h1>
	</header>
	<div class="ui-grid-b">
	<div class="ui-block-a">
		<input type="reset" data-theme="a" value="a" data-icon="home">
	</div>
	<div class="ui-block-b">
		<input type="submit" data-theme="b" value="b">
	</div>
	<div class="ui-block-c">
		<input type="submit" data-theme="c" value="c">
	</div>
	<div class="ui-block-a">
		<input type="reset" data-theme="a" value="a">
	</div>
	<div class="ui-block-b">
		<input type="submit" data-theme="b" value="b">
	</div>
	<div class="ui-block-c">
		<input type="submit" data-theme="c" value="c">
	</div>
	<div class="ui-block-a">
		<input type="reset" data-theme="a" value="a">
	</div>
	<div class="ui-block-b">
		<input type="submit" data-theme="b" value="b">
	</div>
	<div class="ui-block-c">
		<input type="submit" data-theme="c" value="c">
	</div>
	</div>
	<footer data-role="footer" data-position="fixed">
	<nav data-role="navbar">
	<ul>
		<li><a href="#" class="ui-btn-active" data-icon="home" >照片</a></li>
		<li><a href="#" data-icon="home" data-iconpos="notext">状态</a></li>
		<li><a href="#">信息</a></li>
		<li><a href="#">状态</a></li>
		<li><a href="#">信息</a></li>
	</ul>
	</nav>
	</footer>
</div> -->

<!-- 手风琴效果 -->
<!-- <div data-role="collapsible-set">
	<section data-role="collapsible">
	<h3>page1</h3>
	<p>contents</p>
	</section>
	<section data-role="collapsible">
	<h3>page2</h3>
	<p>contents</p>
	</section>
	<section data-role="collapsible">
	<h3>page3</h3>
	<p>contents</p>
	</section>
</div> -->

<!-- 表单 
<label for="content">content:</label>
<textarea rows="4" cols="40" name="content" id="content"></textarea>
<label for="number">number</label>
<input type="number" id="number" name="number">
<label for="tel">tel</label>
<input type="tel" id="tel">
<label for="email">email</label>
<input type="email" id="email">
<label for="url">url</label>
<input type="url" id="url">
<label for="search">search</label>
<input type="search" id="search">

<div data-role="fieldcontain">
<label for="slider">slider</label>
<input type="range" name="slider" id="slider" value="2" max="10" min="0">
</div>

<div data-role="fieldcontain">
<label for="switch">switch</label>
<select id="switch" data-role="slider">
	<option value="off">关闭</option>
	<option value="on">打开</option>
</select>
</div>-->

<!-- 表单2 
<fieldset data-role="controlgroup" data-type="horizontal">
<legend>请选择您的年龄范围</legend>
<input type="radio" name="r1" id="r1" checked="checked"><label for="r1">不限不限不限不限不限不限不限不限不限不限不限不限不限</label>
<input type="radio" name="r1" id="r2" checked="checked"><label for="r2">10-20</label>
<input type="radio" name="r1" id="r3" checked="checked"><label for="r3">20-30</label>
<input type="radio" name="r1" id="r4" checked="checked"><label for="r4">30-40</label>
<input type="radio" name="r1" id="r5" checked="checked"><label for="r5">40-50</label>
</fieldset>-->

<!-- <div data-role="controlgroup">
<select name="" id="select" data-native-menu="false" >
<optgroup label="娱乐类"/>
<option value="" data-placeholder="true">请选择</option>
<option value="1">电影</option>
<option value="2" disabled="disabled">吐槽</option>
<optgroup label="技术类"/>
<option value="3">电子技术</option>
</select>
</div>
<div data-role="controlgroup">
<select data-native-menu="false" data-icon="gear" data-inline="true">
<option value="1">编辑用户</option>
<option value="2">删除用户</option>
</select>
</div> -->

<!-- 列表 -->
<!-- <section data-role="page">
<header data-role="header"><h1>列表示例</h1></header>
<div data-role="content">
<ul data-role="listview" data-theme="g" data-inset="true">
	<li data-role="list-divider">A</li>
	<li>
	<a href="#">List 1</a>
	<p class="ui-li-aside">33</p>
	</li>
	<li><a href="#">List 3</a></li>
	<li><a href="#">List 4</a></li>
</ul>
<ol data-role="listview" data-theme="g" data-inset="true" >
	<li><a href="#">List 1</a></li>
	<li><a href="#">List 3</a></li>
	<li><a href="#">List 4</a></li>
</ol>
</div>
<article>
<ul data-role="listview" data-theme="g" >
	<li>
	<img alt="" src="static/test.jpg">
	<h3><a href="#">List 2</a></h3>
	<p>123123</p>
	</li>
	<li>
	<img alt="" src="static/test.jpg">
	<h3><a href="#">List 2</a></h3>
	<p>123123</p>
	</li>
	<li>
	<img alt="" src="static/test.jpg">
	<h3><a href="#">List 2</a></h3>
	<p>123123</p>
	</li>
	<li>
	<img alt="" src="static/test.jpg">
	<h3><a href="#">List 2</a></h3>
	<p>123123</p>
	</li>
</ul>
</article>

</section> -->

<!-- panel -->
<!-- <a href="#leftpanel2" class="ui-btn ui-shadow ui-corner-all ui-btn-inline ui-btn-mini">push</a>
<div data-role="panel" id="leftpanel2" data-position="right" data-display="push" data-theme="a">
    <h3>Left Panel: Push</h3>
    <p>This panel is positioned on the left with the push display mode. The panel markup is <em>after</em> the header, content and footer in the source order.</p>
    <p>To close, click off the panel, swipe left or right, hit the Esc key, or use the button below:</p>
    <p>To close, click off the panel, swipe left or right, hit the Esc key, or use the button below:</p>
    <p>To close, click off the panel, swipe left or right, hit the Esc key, or use the button below:</p>
    <p>To close, click off the panel, swipe left or right, hit the Esc key, or use the button below:</p>
    <a href="#demo-links" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left ui-btn-inline">Close panel</a>
</div> -->
<div data-role="collapsible-set">
	<div data-role="collapsible" data-collapsed-icon="carat-d" data-expanded-icon="carat-u">
    <h4>品牌价值</h4>
	    <ul data-role="listview" data-inset="false">
	        <li><a href="articles/brandValue.jsp" >品牌价值</a></li>
	        <li><a href="#">楼盘简介</a></li>
	        <li><a href="#">建筑风格</a></li>
	    </ul>
	</div>
	<div data-role="collapsible" data-collapsed-icon="carat-d" data-expanded-icon="carat-u">
    <h4>楼盘鉴赏</h4>
	    <ul data-role="listview" data-inset="false">
	        <li><a href="#">微楼书</a></li>
	        <li><a href="articles/layoutIndex.jsp">户型品鉴</a></li>
	        <li><a href="#">时光轴</a></li>
	        <li><a href="#">新闻动态</a></li>
	    </ul>
	</div>
	<div data-role="collapsible" data-collapsed-icon="carat-d" data-expanded-icon="carat-u">
    <h4>客户服务</h4>
	    <ul data-role="listview" data-inset="false">
	        <li><a href="#">会员卡</a></li>
	        <li><a href="#">预约看房</a></li>
	        <li><a href="#">我的咨询</a></li>
	        <li><a href="#">联系我们/a></li>
	    </ul>
	</div>
</div>

</body>
</html>
