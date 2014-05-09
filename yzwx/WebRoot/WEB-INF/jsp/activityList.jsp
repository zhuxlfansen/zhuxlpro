<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.ustc.edu.cn/tags/yzwx" prefix="yzwx"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>活动信息一览画面</title>
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

<script type="text/javascript" >
$(document).ready(function() {
	 $("#ul_li  li").each(function() {
		 $(this).removeClass("active");
	    }); 
	 $("#activityList").addClass("active");
	}); 
	
	function find(){
		var name = $("#name").val();
		if(name.length>0){
			$("#curpage").val(1);
		}
	}
	
	function del(activityId){
		if(confirm("确定要删除此活动？")){
			window.location.href="deleteActivity?id="+activityId;
		}
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
					<form id="form1" class="form-horizontal" action="toActivityList" method="post">
					    <input name="curpage" id="curpage" type="hidden">
						<div class="control-group">
							<label class="control-label" for="inputEmail">活动名称：</label>
							<div class="controls,input-append">
								 <input id="name" type="text" name="name" style="height: 28px;" value="${name}"/>
								 <select id="type" name="type">
									 <option value="">全部</option>
									 <option value="report" <c:if test="${type =='report' }">selected</c:if>>科学家报告会</option>
									 <option value="camp" <c:if test="${type =='camp' }">selected</c:if>>夏令营</option>
								 </select>
								<button class="btn" type="submit" onclick="find()">查询</button>
								<button class="btn" type="button" onclick="javascript:window.location='toAddActivity'">增加活动</button>
							</div>
						</div>
					</form>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						<table  class="table table-striped table-hover ">
							<tr>
								<th  style="padding-left: 20px;">ID</th>
								<th>名称</th>
								<th>活动类型</th>
								<th>起始时间</th>
								<th>签到/报名</th>
								<th style="padding-right: 20px;">操作</th>
							</tr>
							<c:forEach items="${activityPage.result}" var="act">
								<tr>
									<td  style="padding-left: 20px;">${act.id}</td>
									<td>${act.name}</td>
									<td>
									<c:if test="${act.type=='report'}">科学家报告会</c:if>
									<c:if test="${act.type=='camp'}">夏令营</c:if>
									</td>
									<td><fmt:formatDate value="${act.startTime}" pattern="yyyy-MM-dd HH:mm"/> / <fmt:formatDate value="${act.endTime}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td>${act.signCount}/${act.totalCount}</td>
									<td>
									<c:if test="${act.type=='report'}">
										<a href="getQRCode?activityId=${act.id }">二维码</a>
									</c:if>
									<a href="toUpdateActivity?id=${act.id}">修改</a>
									<c:if test="${act.totalCount==0}">
									  <%--  <a href="deleteActivity?id=${act.id}">删除</a> --%>
									   <a href="javascript:del(${act.id});">删除</a>
									</c:if>
									<c:if test="${act.type=='camp'}">
										<a href="getStudentListByActId?id=${act.id }&curpage=1">报名详情</a>
									</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
    	                   <yzwx:page pageCount="${activityPage.pageCount }" count='${activityPage.count }' curPage='${activityPage.curPage}' />
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
