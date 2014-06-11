<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="zkhy" uri="http://www.zkhy.com/tags/zkhy"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生账户画面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
	<link type="text/css"  href="static/commonCss/bootstrap.min.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCss/common.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCss/fenye.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCss/jquery.handsontable.full.css" rel="stylesheet">

	<script src="static/commonJs/jquery-1.10.2.min.js"></script>
	<script src="static/commonJs/bootstrap.min.js"></script>
	<script src="static/commonJs/page.js"></script>
	<script src="static/commonJs/My97DatePicker/WdatePicker.js"></script>
	<script src="static/commonJs/jquery.handsontable.full.js"></script>
	<script type="text/javascript" src="<c:url value='/static/commonJs/JCommonUtil.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/creatStudent.js' />"></script>
	<script type="text/javascript">
		var creatStudentUrl = '<c:url value="/student/creatStudent" />';
		var searchStudentUrl = '<c:url value="/student/searchStudent" />';
		var pageSize = 8;
	</script>

  </head>
  
  <body>
	<!-- top -->
	<%@include file="header.jsp"%>
	<div class="container-fluid">
		<div class="row-fluid">
			<%@include file="navigation.jsp"%>
			<div class="span9">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#creatStudent" data-toggle="tab">批量初始化学生账号</a></li>
					<li><a href="#searchStudent" data-toggle="tab">查找学生账号</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
				<div class="hero-unit tab-pane fade active in" id="creatStudent">
					<zkhy:MessageArea/>
					<div class="control-group">
						<div id="excel" class="handsontable"></div>
						<br/>
						<br/>
						<button class="form-control btn btn-primary" name="dump" data-dump="#excel">提交</button>
					</div>
				</div>
				
				<div class=" tab-pane fade in " id="searchStudent">
				<div class="hero-unit">
						<div class="control-group">
							<div class="controls,input-append">
								学号：<input class="span2" type="text" id="searchStuId" value="" />&nbsp;&nbsp;
								姓名：<input class="span2" type="text" id="searchStuName" value="" />&nbsp;&nbsp;
								年级：
								<input type="text" id="searchStuGrade" onfocus="WdatePicker({dateFmt:'yyyy'})" style="height: 26px;"/>
								<span id="stuGradeTip"></span>
								班级：
								<select class="span2" id="searchStuClass">
									<option value="">——请选择——</option>
									<c:forEach items="${classList}" var="cla">
										<option value="${cla.value}">${cla.name}</option>
									</c:forEach>
								</select>
								<button class="btn btn-default" type="button" onclick="searchStu()" style="margin-bottom: 12px">查询</button>
								<input type="hidden" id="pagingStuId" value="" />
								<input type="hidden" id="pagingStuName" value="" />
								<input type="hidden" id="pagingStuGrade" value="" />
								<input type="hidden" id="pagingStuClass" value="" />
							</div>
						</div>
				</div>
				
				<div class="row-fluid" id="searchStuDiv">
					<div class="span12">
						<table  class="table table-striped table-hover" id="resultTable">
							<tr>
								<th style="padding-left: 20px;">学号</th>
								<th>姓名</th>
								<th>性别</th>
								<th>年级</th>
								<th>班级</th>
								<th style="padding-right: 20px;">操作</th>
							</tr>
						</table>
						<div id="pagingDiv"></div>
					</div>
				</div>
				</div>
				</div>
				
			</div>
		</div>
	</div>
  </body>
</html>
