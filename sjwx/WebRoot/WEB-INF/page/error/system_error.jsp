<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>系统错误画面</title>
	<link href="<spring:url value='/static/css/error.css'/>" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<c:url value='/static/commonJs/jquery-1.10.2.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/commonJs/JCommonUtil.js' />"></script>
	<script type="text/javascript">
	var ROOT_URL = "<c:url value='/'/>";
		function gotoLogin() {
			window.location = "<c:url value='/logout'/>";
		}
	</script>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    font-family:tahoma, arial, verdana, sans-serif;
}
table,tr,td,img{
	border:0;
	margin:0;
	padding:0;
}
#box {
	width: 1240px;
	margin-right: auto;
	margin-left: auto;
	height:756px;
	float: left;
}
		
#recommend2{
	border-collapse: collapse;
	border: 1px solid #CCC;
	width: 60%;
}
#recommend2 tr td .lable {
	margin-right: 8px;
}
#b_contain2 {
	background-color: #e2e2e2;
	width: 1200px;
	margin-right: auto;
	margin-left: auto;
	padding-top: 10px;
	padding-bottom: 10px;
	margin-top: 120px;
	border: 1px solid #a9a9a9;
}
#b_contain2 h1 {
	font-weight:800;
	margin-left:80px;
	margin-right:14px;
	margin-top:15px;
	margin-bottom:10px;
	font-size: 24px;
}
#error {
	margin-left:14px;
	margin-right:14px;
	border:solid #CCC 0px;
	margin-bottom:6px;
	padding-left:180px;
	padding-top:20px;
	padding-bottom:20px;
	font-size:16px;
	font-weight:bold;
	text-align:left;
	vertical-align:middle;
	color: #F00;
}

.css_button_green90 {
	height:41px;
	width: 110px;
	border:0px;
	font-size:14px;
	color:black;
}
		
</style>
</head>

<body>
	<div id="box">
		<div id="b_contain2">
			<h1>系统错误</h1>
			<div id="error">
				对不起，系统发生错误！<br />
				错误内容请与系统管理员联系。
			</div>
			<div align="center" style="margin-top: 20px; margin-bottom: 100px;">
					<input type="button" class="css_button_green90" onclick="gotoLogin()"
						value="重新登录" />
					<input type="button" class="css_button_green90" onclick="JCommonUtil.doLogout();"
						value="关闭" />
			</div>
			<table id="recommend2" align="center">
				<tr>
					<th>错误内容</th>
					<td>${message} </td>
				</tr>
			</table>
		</div>
		<!--b_contain2 -->
	</div> <!--box -->
</body>
</html>