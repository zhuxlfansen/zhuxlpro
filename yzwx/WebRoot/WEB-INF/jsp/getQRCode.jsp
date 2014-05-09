<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

/* String fname=path+"/static/ticket/1113.jpg";
response.setCharacterEncoding("UTF-8");
fname = java.net.URLEncoder.encode(fname, "UTF-8");
response.setHeader("Content-Disposition", "attachment; filename="+fname);
response.setContentType("application/jpeg");// 定义输出类型	 */
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="yzwx" uri="http://www.ustc.edu.cn/tags/yzwx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>获取二维码</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link type="text/css"  href="static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/common.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/fenye.css" rel="stylesheet">

<script src="static/commonJs/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	 $("#ul_li  li").each(function() {
		 $(this).removeClass("active");
	    }); 
	 $("#activityList").addClass("active");
	}); 
</script>
</head>

<body>
	<!-- top -->
	<%@include file="header.jsp"%>
	<!-- .top -->
	<div class="container-fluid">
		<div class="row-fluid">
			
			<%@include file="navigation.jsp"%>
			
			<div class="span9">
			   <input name="status" type="hidden" value="1" />
			    <input id="regionCode" name="regionCode" type="hidden" />
			   <h3>${ac.name }活动二维码</h3>
				<table width="100%">
				
				<tr align="center">
					<td><img src="<%=path %>/static/ticket/1${ac.id}.jpg"/></td>
					<td><img src="<%=path %>/static/ticket/2${ac.id}.jpg"/></td>
				</tr>
				<tr align="center">
					<th>报名二维码（<a href="<%=path%>/static/down.jsp?img=1${ac.id}.jpg&name=${ac.name}_报名二维码">下载</a>）</th>
					<th>签到二维码（<a href="<%=path%>/static/down.jsp?img=2${ac.id}.jpg&name=${ac.name}_签到二维码">下载</a>）</th>
				</tr>
				</table>
			</div>
		</div>
	</div>
	
	<%@include file="footer.jsp"%>
</body>
</html>
