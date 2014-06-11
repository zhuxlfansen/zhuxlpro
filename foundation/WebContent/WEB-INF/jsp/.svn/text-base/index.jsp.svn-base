<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Cache-Control" content="no-store" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="expires" content="0" />  
	<meta http-equiv="keywords" content="科大,中科大,基金会,合肥">
	<meta http-equiv="description" content="This is my page">
	<title><spring:message code="login.label.welcome"></spring:message></title>
	<link rel="stylesheet" type="text/css" href="./static/css/index.css" />
	<link rel="stylesheet" type="text/css" href="./static/css/bootstrap.min.css" />
	<!--[if lt IE 9]><script src="./static/js/css3-mediaqueries.js"></script><![endif]-->
</head>
<body>
<shiro:authenticated>
	<div class="animated" id="nav">
		<ul class="nav navbar-nav">
			<shiro:hasAnyRoles name="0,1">
				<li><a href="#"><span class="glyphicon glyphicon-edit"></span>活动修改</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>查看报名</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-tasks"></span>查看策划</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-camera"></span>查看照片</a></li>
			</shiro:hasAnyRoles>
			<shiro:hasRole name="2">
				<li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>活动报名</a></li>
			</shiro:hasRole>
			<shiro:hasRole name="3">
		    	<li><a href="#"><span class="glyphicon glyphicon-upload"></span>策划提交</a></li>
		    </shiro:hasRole>
		    <shiro:hasRole name="3">
		    	<li><a href="#"><span class="glyphicon glyphicon-camera"></span>拍照上传</a></li>
		    </shiro:hasRole>
		</ul>
		<ul class="nav navbar-nav navbar-right" style="margin-right:5px;">
			<li>
		    	<a href="#">
		    		<span class="glyphicon glyphicon-user"></span>
		    		<shiro:principal property="userName" />
		    	</a>
		    </li>
		    <li>
		    	<a href="./logout"><span class="glyphicon glyphicon-remove-circle"></span>退出</a>
		    </li>
		</ul>
 	</div>
	<div class="banner" style="width:100%;background-color:white;margin-top:50px;">
</shiro:authenticated>
<shiro:guest>
	<div class="banner" style="width:100%;background-color:white;">
</shiro:guest>
    <ul>
        <li style="background-image:url('./static/images/shop.jpg')">基金会</li>
        <li style="background-image:url('./static/images/subway.jpg')">科大</li>
        <li style="background-image:url('./static/images/wood.jpg')">合肥市</li>
        <li style="background-image:url('./static/images/sunset.jpg')">通知</li>
    </ul>
    <shiro:guest>
	    <div class="login-btn">
	    	<button class="btn-login" data-toggle="modal" data-target="#loginModal">
				登录
			</button>
		</div>
	</shiro:guest>
	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="loginModalLabel">登&nbsp;&nbsp;录</h4>
	      </div>
	      <div class="modal-body">
	        <div style="width:320px;margin-left:auto;margin-right:auto;padding:4px;">
	            <form action="./valide" style="width:100%;" role="form">
	                <div class="form-group">
	                    <label class="sr-only" for="username"></label>
					    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
					</div>
					<div class="form-group" style="margin-top:1em;">
						<label class="sr-only" for="password"></label>
	                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
	                </div>
	            </form>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning" id="btnModalLogin" data-dismiss="modal">登&nbsp;&nbsp;录</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">关&nbsp;&nbsp;闭</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</div>
<div class="time-axis">
	<ul>
		<c:forEach items="${indexForm.timeline}" var="day">
			<li>
				<div class="axis-date">
					<span>${day.key.dateStart}</span>
				</div>
				<div class="axis-point">
					<div class="point-border">
						<span class="glyphicon glyphicon-time"></span>
					</div>
				</div>
				<div class="axis-content">
					<div class="list-group">
					  <div class="list-group-item active">
					  	<div class="panel panel-info">
					  		<c:forEach items="${day.value}" var="activity">
							  <div class="panel-heading">${activity.activityStart}-${activity.activityEnd}</div>
							  <div class="panel-body">
								<p>${activity.activityContent}</p>
							  </div>
							</c:forEach>
						</div>
					  </div>
					</div>
				</div>
			</li>
		</c:forEach>
		<li>
			<div class="axis-date">
				<span>2014.02.04</span>
			</div>
			<div class="axis-point">
				<div class="point-border">
					<span class="glyphicon glyphicon-time"></span>
				</div>
			</div>
			<div class="axis-content">
				<div class="list-group">
				  <div class="list-group-item active">
				  	<div class="panel panel-info">
					  <div class="panel-heading">9:00-19:00</div>
					  <div class="panel-body">
						<p>宾馆入住</p>
					  </div>
					</div>
				  </div>
				</div>
			</div>
		</li>
		<li>
			<div class="axis-date">
				<span>2014.02.05</span>
			</div>
			<div class="axis-point">
				<div class="point-border">
					<span class="glyphicon glyphicon-time"></span>
				</div>
			</div>
			<div class="axis-content">
				<div class="list-group">
				  <div class="list-group-item active">
				  	<div class="panel panel-info">
					  <div class="panel-heading">9:00-19:00</div>
					  <div class="panel-body">
						<p>所有成员入场</p>
					  </div>
					  <div class="panel-heading">10:00-11:30</div>
					  <div class="panel-body">
						<p>汇报</p>
					  </div>
					  <div class="panel-heading">14:00-16:30</div>
					  <div class="panel-body">
						<p>策划评选</p>
					  </div>
					</div>
				  </div>
				</div>
			</div>
		</li>
		<li>
			<div class="axis-date">
				<span>2014.02.04</span>
			</div>
			<div class="axis-point">
				<div class="point-border">
					<span class="glyphicon glyphicon-time"></span>
				</div>
			</div>
			<div class="axis-content">
				<div class="list-group">
				  <div class="list-group-item active">
				  	<div class="panel panel-info">
					  <div class="panel-heading">9:00-19:00</div>
					  <div class="panel-body">
						<p>宾馆入住</p>
					  </div>
					</div>
				  </div>
				</div>
			</div>
		</li>
		<li>
			<div class="axis-date">
				<span>2014.02.04</span>
			</div>
			<div class="axis-point">
				<div class="point-border">
					<span class="glyphicon glyphicon-time"></span>
				</div>
			</div>
			<div class="axis-content">
				<div class="list-group">
				  <div class="list-group-item active">
				  	<div class="panel panel-info">
					  <div class="panel-heading">9:00-19:00</div>
					  <div class="panel-body">
						<p>宾馆入住</p>
					  </div>
					</div>
				  </div>
				</div>
			</div>
		</li>
	</ul>
</div>
<div class="activities">
	<ul>
		<li class="activity-list activity-board">
			<div class="activity-header">
				<p>通知</p>
				<a href="#">more&nbsp;&gt;&gt;</a>
			</div>
			<div class="activity-body">
				<ul>
					<li><a href="#">通知1......通知</a></li>
					<li><a href="#">通知2......通知</a></li>
					<li><a href="#">通知3......通知</a></li>
					<li><a href="#">通知4......通知</a></li>
					<li><a href="#">通知5......通知</a></li>
				</ul>
			</div>
		</li>
		<li class="activity-list activity-scheme">
			<div class="activity-header">
				<p>策划</p>
				<a href="#">more&nbsp;&gt;&gt;</a>
			</div>
			<div class="activity-body">
				<p>关于xxx的活动策划：</p><br/>
				<p>xxxxxxxxxxxxxxxxxxx</p><br/>
				<p>xxxxxxxxxxxxxxxxxxx</p><br/>
				<p>xxxxxxxxxxxxxxxxxxx</p><br/>
			</div>
		</li>
		<li class="activity-list activity-photo">
			<div class="activity-header">
				<p>摄影大赛</p>
				<a href="#">more&nbsp;&gt;&gt;</a>
			</div>
			<div class="activity-body">
				<p>xxx手机摄影大赛获奖作品</p>
				<img class="img-responsive" width="240" src="./static/images/home-banner-1.png"/>
			</div>
		</li>
	</ul>
</div>
<script type="text/javascript" src="./static/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="./static/js/jquery.event.swipe.js"></script>
<script type="text/javascript" src="./static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./static/js/unslider.min.js"></script>
<script type="text/javascript" src="./static/js/headroom.min.js"></script>
<script type="text/javascript">
$(function() {
	if(window.chrome) {
		$(".banner li").css("background-size", "100% 100%");
	}
	// 获取顶部导航条
	var nav = $("#nav")[0];
	if (nav) {
		// 创建 Headroom 对象，将页面元素传递进去
		var headroom  = new Headroom(nav, {
		    // 在元素没有固定之前，垂直方向的偏移量（以px为单位）
		    offset : 46,
		    // scroll tolerance in px before state changes
		    tolerance : 5,
		    // 对于每个状态都可以自定义css classes 
		    classes : {
		        // 当元素初始化后所设置的class
		        initial : "animated",
		        // 向上滚动时设置的class
		        pinned : "slideDown",
		        // 向下滚动时所设置的class
		        unpinned : "slideUp"
		    }
		});
		// 初始化
		headroom.init();
	}
	$(".banner").unslider({
   		speed: 500,               //  The speed to animate each slide (in milliseconds)
   		delay: 5000,              //  The delay between slide animations (in milliseconds)
   		//complete: function() {},  //  A function that gets called after every slide animation
   		//arrows: true,
   		//keys: true,               //  Enable keyboard (left, right) arrow shortcuts
   		dots: true,               //  Display dot navigation
   		fluid: true              //  Support responsive design. May break non-responsive designs
    });
    if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
   	  var msViewportStyle = document.createElement("style")
   	  msViewportStyle.appendChild(
   	    document.createTextNode(
   	      "@-ms-viewport{width:auto!important}"
   	    )
   	  )
   	  document.getElementsByTagName("head")[0].appendChild(msViewportStyle)
   	}
    // 时间轴
	var timeLine = $(".time-axis"),
		timeLineUl = timeLine.find("ul"),
		_startX,_currX,drag = false;
	timeLineUl.width(timeLineUl.children().length * 220 + "px");
	// 时间轴拖动事件
	timeLine.on("mousedown", function(e){
		_currX = _startX = e.pageX;
		drag = true;
	});
	timeLine.on("mousemove", function(e){
		if ($(window).width() < 480 || 
			!drag || timeLineUl.width() < timeLine.width()) {
			return;
		}
		var dragRange = timeLineUl.width() - timeLine.width();
		_currX = e.pageX;
		var offsetX = _currX - _startX,
			cssX = parseInt(timeLineUl.css("left")),
			targetX = cssX + offsetX;
		if ((offsetX < 0 && Math.abs(targetX) < dragRange)
				|| (offsetX > 0 && cssX < 0)) {
			timeLineUl.css({
				left:targetX + "px"
			});
			_startX = _currX;
		}
	});
	timeLine.on("mouseup blue", function(e){
		drag = false;
	});
	// 登录按钮
	var loginBtn = $("#btnModalLogin"),
		navigation = $("#nav");
	loginBtn.on("click", function(){
    	var form = $(".modal-body form");
    	$.ajax({
			type: "POST",
    	    url: "./login/validate",
    	    data: form.serialize(),
    	    dataType: "json",
    	    success: function(data){
    	    	if (data == "1") {
    	    		// 登录成功
    	    		location.reload();
    	    	}
    	    }
    	});
    });
});
</script>
</body>
</html>