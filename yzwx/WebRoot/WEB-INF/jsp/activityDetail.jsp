<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>科大研招-活动详情</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->
<link href="<%=path %>/static/commonCss/bootstrap-3.min.css" rel="stylesheet">
<script src="<%=path %>/static/commonJs/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/commonJs/bootstrap.min.js"></script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
<style type="text/css">
.btn-outline-inverse {
  color: #fff;
  background-color: transparent;
  border-color: #fff;
}
/* .btn-outline-inverse:hover, */
/* .btn-outline-inverse:focus, */
/* .btn-outline-inverse:active { */
/*   color: rgb(66, 139, 202); */
/*   text-shadow: none; */
/*   background-color: #fff; */
/*   border-color: #fff; */
/* } */
</style>
<script type="text/javascript">

	// 分享
	var activityName = "${activity.name }";
    var activityContent = "${activity.content }";
	function shareFriend() {
	    WeixinJSBridge.invoke('sendAppMessage',{
						    	"appid"      : "wx794f444fa5c9e2ba",
					            "img_url"    : $("#path").val()+"/static/commonImg/logo_.jpg",
					            "img_width"  : "640",
					            "img_height" : "640",
					            "link"       : window.location.href,
					            "desc"       : activityContent,
					            "title"      : activityName
	                            }, function(res) {
	                            _report('send_msg', res.err_msg);
	                            });
	}
	function shareTimeline() {
	    WeixinJSBridge.invoke('shareTimeline',{
						    	"img_url"    : $("#path").val()+"/static/commonImg/logo_.jpg",
					            "img_width"  : "640",
					            "img_height" : "640",
					            "link"       : window.location.href,
					            "desc"       : activityContent,
					            "title"      : activityName
	                            }, function(res) {
	                            _report('timeline', res.err_msg);
	                            });
	}
	function shareWeibo() {
	    WeixinJSBridge.invoke('shareWeibo',{
	                            "content":activityContent,
	                            "url":window.location.href,
	                            }, function(res) {
	                            _report('weibo', res.err_msg);
	                            });
	}
	// 当微信内置浏览器完成内部初始化后会触发WeixinJSBridgeReady事件。
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {

	        // 发送给好友
	        WeixinJSBridge.on('menu:share:appmessage', function(argv){
	            shareFriend();
	            });

	        // 分享到朋友圈
	        WeixinJSBridge.on('menu:share:timeline', function(argv){
	            shareTimeline();
	            });

	        // 分享到微博
	        WeixinJSBridge.on('menu:share:weibo', function(argv){
	            shareWeibo();
	            });
	        }, false);
	
	function apply(actId,type) {
		if(confirm("报名请先关注“中国科大研究生招生”服务号，并填写报名信息，否则无法正常报名。")) {
			var url ='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx49e5dfe9fa7e3f9c&redirect_uri=http%3A%2F%2F114.215.186.132%2Fyzwx%2Fmob%2Fsignup%3FactivityId%3D'+actId+'%26type%3D'+type+'&response_type=code&scope=snsapi_base&state=7#wechat_redirect';
			location.href = url;
		}
	}
</script>
</head>

<body>
	<input type="hidden" id="path" value="<%=path%>"/>
	<div class="col-md-12" style="padding-left: 0px;padding-right: 0px;">
		<div class="panel panel-primary">
			<div class="panel-heading" align="left">
			<h4 class="pull-left">${activity.name }</h4><a href="javascript:apply('${activity.id}','${activity.type }');" class="btn pull-right btn-outline-inverse">立刻报名</a>
			<div class="clearfix"></div>
			</div>
			<div class="panel-body" style="width:100%">
<!-- 		        <p ><a href="http://mp.weixin.qq.com/s?__biz=MzA4NDI0OTYzMA==&mid=10000009&idx=1&sn=e9ea2ee6860d79eccc41b068798248f2#rd">关于科大研招微信平台(点我可以关注哦)</a></p> -->
		        <p><strong>简介：</strong>${activity.content }</p>
		        <p><strong>时间：</strong><fmt:formatDate value="${activity.startTime}" pattern="MM月dd日 HH:mm"/> － <fmt:formatDate value="${activity.endTime}" pattern="MM月dd日 HH:mm"/></p>
		        <c:if test="${activity.type=='report' }"><p><strong>地址：</strong>${activity.address }</p></c:if>
		        <c:if test="${activity.type=='camp' }"><p><strong>举办学院：</strong>${majorName }</p></c:if>
		    	<c:if test="${activity.lng!=null&&activity.lat!=null }">
		    	<p><a href="<%=path%>/static/map.jsp?lng=${activity.lng}&lat=${activity.lat}">点击此处查看地图</a></p>
		    	</c:if>
		    </div>
		</div>
	</div>
</body>
</html>
