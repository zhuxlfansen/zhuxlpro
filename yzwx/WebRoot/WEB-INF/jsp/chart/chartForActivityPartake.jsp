<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>考生分布统计</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="This is my page">
<!-- Le styles -->
<link type="text/css" href="<%=path%>/static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="<%=path%>/static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css" href="<%=path%>/static/commonCss/common.css" rel="stylesheet">
<link type="text/css" href="<%=path%>/static/commonCss/fenye.css" rel="stylesheet">

<script type="text/javascript" src="<%=path%>/static/commonJs/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/commonJs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/commonJs/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	 $("#ul_li  li").each(function() {
		 $(this).removeClass("active");
	    }); 
	 $("#activityPartakeChart").addClass("active");
	}); 

</script>
</head>

<body>
	<input type="hidden" id="path" value="<%=path%>"/>
	<!-- top -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="brand" href="#">合肥亦租信息科技有限公司-研招微信平台-后台管理系统</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">
						您好，<a href="#" class="navbar-link">admin</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- .top -->
	<div class="container-fluid">
		<div class="row-fluid">
			<%@include file="../navigation.jsp"%>
			<!-- right -->
			<div class="span9">
				<div class="hero-unit">
					<table width="100%">
						<tr>
							<td colspan="2">
								<form id="form2" name="form2" class="form-inline">
								<label>活动开始时间段：</label>
								<div class="input-prepend" >
									<span class="add-on"><img alt="日历" src="<%=path%>/static/commonImg/calendar.png" /></span> 
									<input class="input-small" onclick="var date; date=dateLimit('start');WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:date[1]});" name="startTime" id="startTime" readonly type="text" onchange="showArctivityList();" placeholder="开始时间">
								</div>
								<label>&nbsp;-&nbsp;</label>
								<div class="input-prepend" >
									<span class="add-on"><img alt="日历" src="<%=path%>/static/commonImg/calendar.png"/></span>
									<input class="input-small" onclick="var date; date=dateLimit('end');WdatePicker({dateFmt:'yyyy-MM-dd',minDate:date[0],maxDate:date[1]});" name="endtime" id="endTime" readonly type="text"  onchange="showArctivityList();" placeholder="结束时间">
								</div>
								<select id="activityId" onchange="showPieChart();">
									<option value="">-所有已结束活动-</option>
									<c:forEach var="activity" items="${activityList}">
										<option value="${activity.id}">${activity.name }</option>
									</c:forEach>
								</select>
								<button class="btn btn-warning" onclick="saveImg();" data-toggle="modal" data-target="#myModal">生成图片</button>
								</form>								
							</td>
						</tr>
						<tr>
						<td width="350px">
							<div class="btn-group " id="chartTypeBtnGroup">
								<button class="btn btn-info" onclick="buttonClick(this);" id="studentMajor">专业分布</button>
								<button class="btn" onclick="buttonClick(this);" id="studentSchool">学校分布</button>
								<button class="btn" onclick="buttonClick(this);" id="studentGPA">成绩分布</button>
								<button class="btn" onclick="buttonClick(this);" id="schoolArea">地域分布</button>
								<input type="hidden" id="chartType" value="studentMajor"/>
							</div>
						</td>
						<td>
							<div class="btn-group " id="btnGroup">
							</div>
						</td>
						</tr>
					</table>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div id="main" style="height:500px;border:1px solid #ccc;padding:10px;"></div>
						<script src="<%=path%>/static/commonJs/echarts-plain.js"></script>
						<script type="text/javascript" src="<%=path%>/static/js/chart/chart.js"></script>
						<script type="text/javascript">
						$("#chartType").val("studentMajor");
						drawPieChart("<c:url value='/chart/studentMajor' />",$("#activityId").val());
						</script>
					</div>
				</div>
			</div>
			<!-- .right -->
		</div>
		<!--/row-->

		<hr>
	</div>
	<div >
		<!-- Modal -->
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1000px">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h4 id="myModalLabel">右击保存图片</h4>
		  </div>
		  <div class="modal-body" id="imgDIV">
		  </div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>

</body>
</body>
</html>
