<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>排班管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link type="text/css"  href="static/commonCSS/bootstrap.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCSS/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCSS/common.css" rel="stylesheet">
<link type="text/css"  href="static/commonCSS/fenye.css" rel="stylesheet">
<style type="text/css">
.wrap{z-index:1;background-color:#000;opacity:0.1;filter:alpha(opacity:10);position:absolute;left:0;top:0;}
</style>
<script src="static/commonJS/jquery-1.10.2.min.js"></script>
<script src="static/commonJS/bootstrap.min.js"></script>
<script src="static/commonJS/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
var dutyList = eval("${dutyList}");
var expList = eval("${expList}");
</script>
<script src="static/js/duty.js"></script>
</head>

<body>
	<input type="hidden" id="path" value="<%=path%>"/>
	<!-- top -->
	<%@include file="header.jsp"%>
	<!-- .top -->
	<div class="container-fluid">
		<div class="row-fluid">
			<%@include file="navigation.jsp"%>
			<!-- right -->
			<div class="span9" style="width: 85%">
				<div class="hero-unit">
					<div class="control-group" >
						<div class="controls,input-append">
						选择周：<input class="Wdate" type='text' style="height: 26px;margin-bottom:0px;" value="2014年05月22日" onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日',isShowWeek:true})" />
						</div>
					</div>			
				</div>
				<div class="row-fluid">
					<div class="span12">
						<table class="table table-bordered" id="tab">
						  <tr>
						  	<th>姓名</th>
						  	<th>知名<br/>专家</th>
						  	<th>科室</th>
						  	<!-- <th>是否<br/>专科</th> -->
						  	<th>周一<br/>上午</th>
						  	<th>周一<br/>下午</th>
						  	<th>周二<br/>上午</th>
						  	<th>周二<br/>下午</th>
						  	<th>周三<br/>上午</th>
						  	<th>周三<br/>下午</th>
						  	<th>周四<br/>上午</th>
						  	<th>周四<br/>下午</th>
						  	<th>周五<br/>上午</th>
						  	<th>周五<br/>下午</th>
						  	<th>周六<br/>上午</th>
						  	<th>周六<br/>下午</th>
						  	<th>周日<br/>上午</th>
						  	<th>周日<br/>下午</th>
						  	
						  </tr>
						  <%-- <c:forEach items="${list }" var="exp">
						  <tr>
						  	<td>${exp.name }</td>
						  	<td>
							  	<c:choose>
							  		<c:when test="${exp.isExp==0 }">--</c:when>
							  		<c:when test="${exp.isExp==1 }">是</c:when>
							  	</c:choose>
						  	</td>
						  	<td>${exp.deptName }</td>
						  	<td>
							  	<c:choose>
							  		<c:when test="${exp.isSep==0 }">--</c:when>
							  		<c:when test="${exp.isSep==1 }">是</c:when>
							  	</c:choose>
						  	</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'1','0','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'1','1','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'2','0','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'2','1','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'3','0','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'3','1','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'4','0','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'4','1','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'5','0','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'5','1','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'6','0','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'6','1','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'7','0','${exp.id}');">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this,'7','1','${exp.id}');">&nbsp;</td>
						  </tr>
						  </c:forEach> --%>
						  <!-- <tr>
						  	<td>张三</td>
						  	<td>是</td>
						  	<td>内科</td>
						  	<td>是</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  </tr>
						  <tr>
						  	<td>李四</td>
						  	<td>--</td>
						  	<td>内科</td>
						  	<td>是</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  </tr>
						  <tr>
						  	<td>王五</td>
						  	<td>--</td>
						  	<td>内科</td>
						  	<td>是</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  </tr>
 -->						</table>
					</div>
				</div>
			</div>
			<!-- .right -->
		</div>
		<!--/row-->

		<hr>
	</div>
	
</body>
</html>
