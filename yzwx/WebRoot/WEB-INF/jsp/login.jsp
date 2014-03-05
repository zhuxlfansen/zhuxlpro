<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="yzwx" uri="http://www.ustc.edu.cn/tags/yzwx"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>研招系统登录画面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="研招系统登录画面">

<link type="text/css" href="static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css" href="static/commonCss/common.css" rel="stylesheet">

<script type="text/javascript" src="<c:url value='/static/commonJs/jquery-1.10.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/commonJs/bootstrap.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/commonJs/JCommonUtil.js' />"></script>

<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
</style>

<script type="text/javascript">
		var g_MsgArea = [];
		<c:forEach items="${pageMsgAreaData}" var="varMsgArea">
		g_MsgArea.push(new I18nMessage('<c:out value="${varMsgArea.text}" />',
			'<c:out value="${varMsgArea.type}" />',
			'<c:out value="${varMsgArea.item}" />',
			'<c:out value="${varMsgArea.code}" />'));
		</c:forEach>
		$(document).ready(function(){
			if (g_MsgArea.length > 0) {
				JCommonUtil.clearMessageArea();
				JCommonUtil.addMessageArea(g_MsgArea);
			}
		})
	</script>

</head>

<body>
	<div class="container">
		<form class="form-signin" action="<%=request.getContextPath()%>/login" method="POST">
			<h2 class="form-signin-heading">请登录</h2>
			<yzwx:MessageArea/>
			<input class="input-block-level" placeholder="用户名" type="text"
				name="username"> <input class="input-block-level"
				placeholder="密码" type="password" name="password"> <label
				class="checkbox"> 
<!-- 				<input value="remember-me" type="checkbox">记住我 -->
			</label>
			<button class="btn btn-large btn-primary" type="submit">登录</button>
		</form>
	</div>
	<!-- /container -->
</body>
</html>
