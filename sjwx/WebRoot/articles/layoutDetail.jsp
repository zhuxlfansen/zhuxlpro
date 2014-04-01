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
<link type="text/css"  href="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<link type="text/css"  href="<%=path %>/static/photoswipe/photoswipe.css" rel="stylesheet">

<script src="<%=path %>/static/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.js"></script>

<script src="<%=path %>/static/photoswipe/simple-inheritance.min.js"></script>
<script src="<%=path %>/static/photoswipe/jquery.animate-enhanced.min.js"></script>
<script src="<%=path %>/static/photoswipe/code-photoswipe-jQuery-1.0.11.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('div.gallery-page').live('pageshow', function(e){
		$("div.gallery a", e.target).photoSwipe();
		return true;
	})
});
</script>
</head>

<body>
<div data-role="page" id="Home">

	<div data-role="header">
		<a data-rel="back" data-icon="back" data-iconpos="notext">后退</a>
		<h1>90㎡三房</h1>
		<a data-rel="home" data-icon="home" data-iconpos="notext"></a>
	</div>
	<img alt="" src="../static/img/layout_02_max.jpg" width="100%">
	<div data-role="content" >	
		<p>These examples show PhotoSwipe integrated with jQuery Mobile:</p>		
		<ul data-role="listview" data-inset="true">
			<li><a href="layoutView3.jsp">样板房图集</a></li> 
		</ul> 
	</div>
	<div data-role="footer">
		<h4>&copy; 2014 Code Computerlove</h4>
	</div>
</div>


<div data-role="page" id="Gallery1" class="gallery-page">
	<div data-role="header">
		<h1>First Gallery</h1>
	</div>
	<div data-role="content">	
		<div class="gallery">
			<div class="gallery-row">
				<div class="gallery-item"><a href="../static/photoswipe/images/full/001.jpg" rel="external"><img src="../static/photoswipe/images/thumb/001.jpg" alt="Image 001" /></a></div>
				<div class="gallery-item"><a href="../static/photoswipe/images/full/002.jpg" rel="external"><img src="../static/photoswipe/images/thumb/002.jpg" alt="Image 002" /></a></div>
				<div class="gallery-item"><a href="../static/photoswipe/images/full/003.jpg" rel="external"><img src="../static/photoswipe/images/thumb/003.jpg" alt="Image 003" /></a></div>
			</div>
			<div class="gallery-row">
				<div class="gallery-item"><a href="../static/photoswipe/images/full/004.jpg" rel="external"><img src="../static/photoswipe/images/thumb/004.jpg" alt="Image 004" /></a></div>
				<div class="gallery-item"><a href="../static/photoswipe/images/full/005.jpg" rel="external"><img src="../static/photoswipe/images/thumb/005.jpg" alt="Image 005" /></a></div>
				<div class="gallery-item"><a href="../static/photoswipe/images/full/006.jpg" rel="external"><img src="../static/photoswipe/images/thumb/006.jpg" alt="Image 006" /></a></div>
			</div>
			<div class="gallery-row">
				<div class="gallery-item"><a href="../static/photoswipe/images/full/007.jpg" rel="external"><img src="../static/photoswipe/images/thumb/007.jpg" alt="Image 007" /></a></div>
				<div class="gallery-item"><a href="../static/photoswipe/images/full/008.jpg" rel="external"><img src="../static/photoswipe/images/thumb/008.jpg" alt="Image 008" /></a></div>
				<div class="gallery-item"><a href="../static/photoswipe/images/full/009.jpg" rel="external"><img src="../static/photoswipe/images/thumb/009.jpg" alt="Image 009" /></a></div>
			</div>
		</div>
	</div>
	<div data-role="footer">
		<h4>&copy; 2011 Code Computerlove</h4>
	</div>
	
</div>





<!-- <div data-role="page" id="backPage" >
<header data-role="header">
<a data-rel="back" data-icon="back" data-iconpos="notext">后退</a>
<h1>90㎡三房</h1>
</header>

<footer data-role="footer" data-position="fixed">
<div data-role="collapsible" data-content-theme="false">
    <h4>Heading</h4>
    <p>I'm the collapsible content without a theme.</p>
</div>
</footer>
</div>  -->
</body>
</html>
