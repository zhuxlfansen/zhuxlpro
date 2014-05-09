<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>系统错误</title>
	<script type="text/javascript" src="<c:url value='/static/commonJs/jquery-1.10.2.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/commonJs/JCommonUtil.js' />"></script>
	<script type="text/javascript">
		var ROOT_URL = "<spring:url value='/'/>";
	</script>
</head>

<body>
	<p>发生系统错误</p>
	<br />
	错误内容：<br />
	<div>
	</div>
	<h2>500 - 系统内部发生了错误</h2>
		<p><a href="#" onclick="JCommonUtil.doLogout();">关闭</a></p>
</body>
</html>
