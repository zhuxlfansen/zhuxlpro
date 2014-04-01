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
<%-- <link type="text/css"  href="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet"> --%>
<link rel="stylesheet" type="text/css" href="../static/ResponsiveImageGallery/css/style.css" />
<link rel="stylesheet" type="text/css" href="../static/ResponsiveImageGallery/css/elastislide.css" />

<%-- <script src="<%=path %>/static/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.js"></script>

<script src="<%=path %>/static/photoswipe/simple-inheritance.min.js"></script>
<script src="<%=path %>/static/photoswipe/jquery.animate-enhanced.min.js"></script>
<script src="<%=path %>/static/photoswipe/code-photoswipe-jQuery-1.0.11.js"></script> --%>


<style type="text/css">
.es-carousel ul{display:block;}
</style>

</head>

<body>
<div style="height:30px;"></div>

<div id="rg-gallery" class="rg-gallery">
	<div class="rg-thumbs">
	<!-- Elastislide Carousel Thumbnail Viewer -->
		<div class="es-carousel-wrapper">
			<div class="es-nav">
				<span class="es-nav-prev">Previous</span>
				<span class="es-nav-next">Next</span>
			</div>
			<div class="es-carousel">
				<ul>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/1.jpg" data-large="../static/ResponsiveImageGallery/images/1.jpg" alt="image01" data-description="From off a hill whose concave womb reworded" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/2.jpg" data-large="../static/ResponsiveImageGallery/images/2.jpg" alt="image02" data-description="A plaintful story from a sistering vale" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/3.jpg" data-large="../static/ResponsiveImageGallery/images/3.jpg" alt="image03" data-description="A plaintful story from a sistering vale" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/4.jpg" data-large="../static/ResponsiveImageGallery/images/4.jpg" alt="image04" data-description="My spirits to attend this double voice accorded" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/5.jpg" data-large="../static/ResponsiveImageGallery/images/5.jpg" alt="image05" data-description="And down I laid to list the sad-tuned tale" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/6.jpg" data-large="../static/ResponsiveImageGallery/images/6.jpg" alt="image06" data-description="Ere long espied a fickle maid full pale" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/7.jpg" data-large="../static/ResponsiveImageGallery/images/7.jpg" alt="image07" data-description="Tearing of papers, breaking rings a-twain" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/8.jpg" data-large="../static/ResponsiveImageGallery/images/8.jpg" alt="image08" data-description="Storming her world with sorrow's wind and rain" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/9.jpg" data-large="../static/ResponsiveImageGallery/images/9.jpg" alt="image09" data-description="Upon her head a platted hive of straw" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/10.jpg" data-large="../static/ResponsiveImageGallery/images/10.jpg" alt="image10" data-description="Which fortified her visage from the sun" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/11.jpg" data-large="../static/ResponsiveImageGallery/images/11.jpg" alt="image11" data-description="Whereon the thought might think sometime it saw" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/12.jpg" data-large="../static/ResponsiveImageGallery/images/12.jpg" alt="image12" data-description="The carcass of beauty spent and done" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/13.jpg" data-large="../static/ResponsiveImageGallery/images/13.jpg" alt="image13" data-description="Time had not scythed all that youth begun" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/14.jpg" data-large="../static/ResponsiveImageGallery/images/14.jpg" alt="image14" data-description="Nor youth all quit; but, spite of heaven's fell rage" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/15.jpg" data-large="../static/ResponsiveImageGallery/images/15.jpg" alt="image15" data-description="Some beauty peep'd through lattice of sear'd age" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/16.jpg" data-large="../static/ResponsiveImageGallery/images/16.jpg" alt="image16" data-description="Oft did she heave her napkin to her eyne" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/17.jpg" data-large="../static/ResponsiveImageGallery/images/17.jpg" alt="image17" data-description="Which on it had conceited characters" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/18.jpg" data-large="../static/ResponsiveImageGallery/images/18.jpg" alt="image18" data-description="Laundering the silken figures in the brine" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/19.jpg" data-large="../static/ResponsiveImageGallery/images/19.jpg" alt="image19" data-description="That season'd woe had pelleted in tears" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/20.jpg" data-large="../static/ResponsiveImageGallery/images/20.jpg" alt="image20" data-description="And often reading what contents it bears" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/21.jpg" data-large="../static/ResponsiveImageGallery/images/21.jpg" alt="image21" data-description="As often shrieking undistinguish'd woe" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/22.jpg" data-large="../static/ResponsiveImageGallery/images/22.jpg" alt="image22" data-description="In clamours of all size, both high and low" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/23.jpg" data-large="../static/ResponsiveImageGallery/images/23.jpg" alt="image23" data-description="Sometimes her levell'd eyes their carriage ride" /></a></li>
					<li><a href="#"><img src="../static/ResponsiveImageGallery/images/thumbs/24.jpg" data-large="../static/ResponsiveImageGallery/images/24.jpg" alt="image24" data-description="As they did battery to the spheres intend" /></a></li>
				</ul>
			</div>
		</div>
	<!-- End Elastislide Carousel Thumbnail Viewer -->
	</div><!-- rg-thumbs -->
</div>
<script type="text/javascript" src="../static/ResponsiveImageGallery/js/jquery.min.js"></script>
<script type="text/javascript" src="../static/ResponsiveImageGallery/js/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="../static/ResponsiveImageGallery/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../static/ResponsiveImageGallery/js/jquery.elastislide.js"></script>
<script type="text/javascript" src="../static/ResponsiveImageGallery/js/gallery.js"></script>
<script id="img-wrapper-tmpl" type="text/x-jquery-tmpl">	
	<div class="rg-image-wrapper">
		{{if itemsCount > 1}}
			<div class="rg-image-nav">
				<a href="#" class="rg-image-nav-prev">Previous Image</a>
				<a href="#" class="rg-image-nav-next">Next Image</a>
			</div>
		{{/if}}
		<div class="rg-image"></div>
		<div class="rg-loading"></div>
		<div class="rg-caption-wrapper">
			<div class="rg-caption" style="display:none;">
				<p></p>
			</div>
		</div>
	</div>
</script>
</body>
</html>
