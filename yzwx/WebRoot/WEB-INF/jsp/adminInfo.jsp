<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="yzwx" uri="http://www.ustc.edu.cn/tags/yzwx"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>info</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link type="text/css"  href="static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/common.css" rel="stylesheet">

<script type="text/javascript" src="static/commonJs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="static/commonJs/bootstrap.min.js"></script>
<script type="text/javascript" src="static/commonJs/JCommonUtil.js"></script>

</head>

<body>
    <script type="text/javascript">
        /* var searchUrl = '<c:url value="/sample/search" />' */
        var g_MsgArea = [];
        <c:forEach items="${pageMsgAreaData}" var="varMsgArea">
        g_MsgArea.push(new I18nMessage('<c:out value="${varMsgArea.text}" />',
            '<c:out value="${varMsgArea.type}" />',
            '<c:out value="${varMsgArea.item}" />',
            '<c:out value="${varMsgArea.code}" />'));
        </c:forEach>
        $(document).ready(function(){
        	$("#ul_li  li").each(function() {
                $(this).removeClass("active");
               }); 
        	
            if (g_MsgArea.length > 0) {
                JCommonUtil.clearMessageArea();
                JCommonUtil.addMessageArea(g_MsgArea);
            }
        })
    </script>
	<!-- top -->
	<%@include file="header.jsp"%>
	<!-- .top -->
	<div class="container-fluid">
		<div class="row-fluid">
			
			<%@include file="navigation.jsp"%>
			
			<div class="span9">
			    <div class="hero-unit">
                                系统管理员操作结果
                </div>
			    <yzwx:MessageArea />
			</div>
		</div>
	</div>
	
	<%@include file="footer.jsp"%>
</body>
</html>
