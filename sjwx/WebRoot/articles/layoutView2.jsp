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
<link rel="stylesheet" href="<%=path %>/static/swiper/css/idangerous.swiper.css">
<link rel="stylesheet" href="<%=path %>/static/swiper/css/style.css?v=1.8">
<link rel="stylesheet" href="<%=path %>/static/swiper/css/swiper-demos.css?v=1.8">
<script  src="<%=path %>/static/swiper/js/libs/jquery-1.7.1.min.js"></script>
<script  src="<%=path %>/static/swiper/js/idangerous.swiper-1.8.min.js"></script>
<script  src="<%=path %>/static/swiper/js/idangerous.swiper.scrollbar-1.0.js"></script>
<script  src="<%=path %>/static/swiper/js/swiper-demos.js?v=1.8"></script>
<script src="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.js"></script>
<%-- <script src="<%=path %>/static/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.js"></script>

<script src="<%=path %>/static/photoswipe/simple-inheritance.min.js"></script>
<script src="<%=path %>/static/photoswipe/jquery.animate-enhanced.min.js"></script>
<script src="<%=path %>/static/photoswipe/code-photoswipe-jQuery-1.0.11.js"></script> --%>
<script type="text/javascript">

</script>

</head>

<body>
<div data-role="page" id="Home">

	<div data-role="header">
		<a data-rel="back" data-icon="back" data-iconpos="notext">后退</a>
		<h1>90㎡三房</h1>
		<a data-rel="home" data-icon="home" data-iconpos="notext"></a>
	</div>
	<div data-role="content" >	
		<p>These examples show PhotoSwipe integrated with jQuery Mobile:</p>		
		<ul data-role="listview" data-inset="true">
			<li><a href="#test" data-rel="dialog">样板房图集</a></li> 
		</ul> 
	</div>
	<div data-role="footer">
		<h4>&copy; 2014 Code Computerlove</h4>
	</div>
</div>

<div data-role="page" id="test">
	<div class="swiper-container swiper-v">
    <div class="pagination-v"></div>
    <div class="swiper-wrapper">
      <div class="swiper-slide blue-slide">
        <h2>Vertical Mode</h2>
        <p>Swipe to the Top or to the Bottom</p>
      </div>
      <div class="swiper-slide red-slide">
        <h2>Slide 2</h2>
        <p>Keep swiping</p>
      </div>
      <div class="swiper-slide orange-slide">
        <h2>Slide 3</h2>
        <p>The last one</p>
      </div>
    </div>
  </div>
</div>

</body>
</html>
