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
<title>满意度统计123123</title>
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
	 $("#activitySatisfactionChart").addClass("active");
	}); 

</script>
</head>

<body>
	<input type="hidden" id="path" value="<%=path%>"/>
	<!-- top -->
	<%@include file="../header.jsp"%>
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
									<input class="input-small" onclick="var date; date=dateLimit('start');WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:date[1]});" name="startTime" id="startTime" readonly type="text" onchange="showBarChart('<c:url value='/chart/satisfaction' />');" placeholder="开始时间">
								</div>
								<label>&nbsp;-&nbsp;</label>
								<div class="input-prepend" >
									<span class="add-on"><img alt="日历" src="<%=path%>/static/commonImg/calendar.png"/></span>
									<input class="input-small" onclick="var date; date=dateLimit('end');WdatePicker({dateFmt:'yyyy-MM-dd',minDate:date[0],maxDate:date[1]});" name="endtime" id="endTime" readonly type="text"  onchange="showBarChart('<c:url value='/chart/satisfaction' />');" placeholder="结束时间">
								</div>
								<!-- <button class="btn" onclick="showChart();" id="">查询</button> -->
								<button class="btn btn-warning" onclick="saveImg();" data-toggle="modal" data-target="#myModal">生成图片</button>
								</form>								
							</td>
						</tr>
					</table>
				</div>

				<div class="row-fluid">
					<div class="span12">
						<table width="100%">
						<tr>
							<td >
								<div id="main" style="height:500px;width:1000px; border:1px solid #ccc;padding:10px;"></div>
								<script src="<%=path%>/static/commonJs/echarts-plain.js"></script>
								<script type="text/javascript" src="<%=path%>/static/js/chart/chart.js"></script>
								<script type="text/javascript">
								drawBarChart("<c:url value='/chart/satisfaction' />");
								</script>
							</td>
							<td>
								<div id="main2" style="height:500px;width:350px;border:1px solid #ccc;padding:10px;overflow:auto;">
								<div class="page-header" style="margin: 10px 0 20px" id="sugDIV">
								  <h4>活动评论列表</h4>
								</div>
								<ul class="unstyled" id="sugUL">
								</ul>
								</div>
							</td>
						</tr>
						</table>
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
