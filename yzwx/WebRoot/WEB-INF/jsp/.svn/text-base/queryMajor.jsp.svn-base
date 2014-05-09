<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>考生咨询</title>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link type="text/css" href="<%=path%>/static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="<%=path%>/static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css" href="<%=path%>/static/commonCss/common.css" rel="stylesheet">


<script type="text/javascript" src="<%=path%>/static/commonJs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/commonJs/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	 $("#ul_li  li").each(function() {
		 $(this).removeClass("active");
	    }); 
	 $("#queryList").addClass("active");
	}); 
</script>

  </head>
  
  <body>
  	<!-- top -->
	<%@include file="header.jsp"%>
	<div class="container-fluid">
		<div class="row-fluid">
			<%@include file="navigation.jsp"%>
			<!-- right -->
			<div class="span9">
				<div class="hero-unit">
					<ul class="nav nav-pills nav-stacked">
						<c:forEach items="${majorList}" var="major">
							<li>
								<a href="${pageContext.servletContext.contextPath}/toQueryList?majorCode=${major.code}">${major.name}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
