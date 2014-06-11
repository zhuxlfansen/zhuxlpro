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
<link type="text/css"  href="<%=path %>/static/js/swipebox/src/css/swipebox.css" rel="stylesheet">
<script src="<%=path %>/static/js/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.js"></script>
</head>

<body>
<div data-role="page">
<header data-role="header">
	<a href="javascript:;" onclick="window.location.href='<%=path %>/mob/photoAlbum?wechatCode=${wechatCode}'" data-icon="back" data-iconpos="notext"></a>
	<h3>作品集</h3>
</header>

<div class="content" data-role="content">
	<div class="ui-grid-b">
		<div class="ui-block-a">
			<a href="<%=path %>/static/upload/test1/1397533216914.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397533216914.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-b">
			<a href="<%=path %>/static/upload/test1/1397531180714.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397531180714.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-c">
			<a href="<%=path %>/static/upload/test1/1397531465914.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397531465914.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-a">
			<a href="<%=path %>/static/upload/test1/1397533216914.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397533216914.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-b">
			<a href="<%=path %>/static/upload/test1/1397531180714.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397531180714.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-c">
			<a href="<%=path %>/static/upload/test1/1397531465914.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397531465914.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-a">
			<a href="<%=path %>/static/upload/test1/1397533216914.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397533216914.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-b">
			<a href="<%=path %>/static/upload/test1/1397531180714.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397531180714.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-c">
			<a href="<%=path %>/static/upload/test1/1397531465914.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397531465914.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-a">
			<a href="<%=path %>/static/upload/test1/1397533216914.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397533216914.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-b">
			<a href="<%=path %>/static/upload/test1/1397531180714.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397531180714.jpg" width="95%" alt="image">
			</a>
		</div>
		<div class="ui-block-c">
			<a href="<%=path %>/static/upload/test1/1397531465914.jpg" class="swipebox" title="<a href='javascript:;' onclick='alert(123);' style='text-decoration: none;color:#fff'><img src='<%=path %>/static/images/yes.png'/> 投一票</a>">
				<img src="<%=path %>/static/upload/test1/1397531465914.jpg" width="95%" alt="image">
			</a>
		</div>
	</div>
	<%-- <ul id="box-container">
		<li class="box">
			<a href="<%=path %>/static/upload/test1/1396934427817.jpg" class="swipebox" title="Fog">
				<img src="<%=path %>/static/upload/test1/1396934427817.jpg" alt="image">
			</a>
		</li>
		<li class="box">
			<a href="<%=path %>/static/upload/test1/1397531180714.jpg" class="swipebox" title="Fog">
				<img src="<%=path %>/static/upload/test1/1397531180714.jpg" alt="image">
			</a>
		</li>
		<li class="box">
			<a href="<%=path %>/static/upload/test1/1397531465914.jpg" class="swipebox" title="Fog">
				<img src="<%=path %>/static/upload/test1/1397531465914.jpg" alt="image">
			</a>
		</li>
		<li class="box">
			<a href="<%=path %>/static/upload/test1/1397533216914.jpg" class="swipebox" title="Fog">
				<img src="<%=path %>/static/upload/test1/1397533216914.jpg" alt="image">
			</a>
		</li>
	</ul> --%>
	<script src="<%=path %>/static/js/swipebox/src/js/jquery.swipebox.js"></script>
<script type="text/javascript">
		;( function( $ ) {
			/* Basic Gallery */
			$( '.swipebox' ).swipebox({
				useSVG :false,
				hideBarsOnMobile : false,
				hideBarsDelay : 8000,
				beforeOpen: function() {}, // called before opening
				afterClose: function() {} // called after closing
			});

		} )( jQuery );
	</script>
</div>
<footer data-role="footer"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>

</body>
</html>
