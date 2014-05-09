<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.ustc.edu.cn/tags/yzwx" prefix="yzwx"%>
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
<meta charset="utf-8">
<title>考生信息一览画面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link type="text/css"  href="static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/common.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/fenye.css" rel="stylesheet">

<script src="static/commonJs/jquery-1.10.2.min.js"></script>
<script src="static/commonJs/bootstrap.min.js"></script>
<script src="static/commonJs/page.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	 $("#ul_li  li").each(function() {
		 $(this).removeClass("active");
	    }); 
	 $("#studentlist").addClass("active");
	}); 

function find(){
	var id = $("#activityId_select").val();
	var provinceId = $("#provinceId_select").val();
	var majorCode = $("#major_select").val();
		$('#form1').attr("action","toStudentList");
		$("#curpage").val(1);
		$("#activityId").val(id);
		$("#provinceId").val(provinceId);
		$("#majorCode").val(majorCode);
		$("#form1").submit();
	
}
</script>
</head>

<body>
	<!-- top -->
	<%@include file="header.jsp"%>
	<!-- .top -->
	<div class="container-fluid">
		<div class="row-fluid">
			
			<%@include file="navigation.jsp"%>
			
			<!-- right -->
			<div class="span9">
				<div class="hero-unit">
					<form id="form1" class="form-horizontal" action="toStudentList" method="post">
					   <input name="activityId" id="activityId" type="hidden" value="${activityId}">
					    <input name="provinceId" id="provinceId" type="hidden" value="${provinceId}">
					    <input name="majorCode" id="majorCode" type="hidden" value="${majorCode}">
					    <input name="curpage" id="curpage" type="hidden">
						<div class="control-group">
							<!-- <label class="control-label" for="inputEmail">按活动名称查询：</label> -->
							<div class="controls,input-append">
							考生姓名：<input class="span1" type="text" name="name" value="${name }" />&nbsp;&nbsp;
							活动名称：
								<select class="span2" id="activityId_select" >
									<option value="">——选择全部——</option>
									<c:forEach items="${activityList}" var="activity">
										<c:choose>
											<c:when test="${activityId==activity.id}">
												<option value="${activity.id}" selected="selected">${activity.name}</option>
											</c:when>
											<c:otherwise>
												<option value="${activity.id}">${activity.name}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
								专业名称：
								<select class="span2" id="major_select" onchange="">
									<option value="">——选择全部——</option>
									<c:forEach items="${majorList}" var="majorList">
										<c:choose>
											<c:when test="${majorCode==majorList.code}">
												<option value="${majorList.code}" selected="selected">${majorList.name}</option>
											</c:when>
											<c:otherwise>
												<option value="${majorList.code}">${majorList.name}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
								区域：
								<select class="span2" id="provinceId_select" onchange="">
									<option value="">——选择全部——</option>
									<c:forEach items="${provinceList}" var="province">
										<c:choose>
											<c:when test="${provinceId==province.code}">
												<option value="${province.code}" selected="selected">${province.name}</option>
											</c:when>
											<c:otherwise>
												<option value="${province.code}">${province.name}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
								<button class="btn btn-info" type="button" onclick="find()">查询</button>
								<button class="btn btn-success" type="button" onclick="window.location.href='<%=path %>/createExcel'">导出excel</button>
							</div>
						</div>
					</form>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
					   <p style="color: #0088CC;"><font color="red">*&nbsp;</font>拟报考专业只显示一个，如需查看更多请点击“详情”查看！</p>
						<table  class="table table-striped table-hover ">
							<tr>
								<th style="padding-left: 20px;">ID</th>
								<th>姓名</th>
								<th>学校</th>
								<th>专业</th>
								<th>拟报考专业</th>
								<th>电话</th>
								<th style="padding-right: 20px;">操作</th>
							</tr>
							<c:forEach items="${stList.result}" var="stu">
								<tr>
									<td style="padding-left: 20px;">${stu.id}</td>
									<td>${stu.name}</td>
									<td>${stu.school.name}</td>
									<td>${stu.studentMajor}</td>
									<td>${stu.major.name}</td>
									<td>${stu.contact}</td>
									<td><a href="${pageContext.servletContext.contextPath}/student/detail?id=${stu.id}">详情</a></td>
								</tr>
							</c:forEach>
						</table>
    	                   <yzwx:page pageCount="${stList.pageCount }" count='${stList.count }' curPage='${stList.curPage}' />
					</div>
				</div>
			</div>
			<!-- .right -->
		</div>
		<!--/row-->

		<hr>
	</div>
	
	<%@include file="footer.jsp"%>
</body>
</html>
