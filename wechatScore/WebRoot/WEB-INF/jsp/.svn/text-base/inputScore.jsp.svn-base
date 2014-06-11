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

    <title>成绩录入画面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link type="text/css"  href="static/commonCss/bootstrap.min.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCss/common.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCss/fenye.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCss/jquery.handsontable.full.css" rel="stylesheet">

	<script src="static/commonJs/jquery-1.10.2.min.js"></script>
	<script src="static/commonJs/bootstrap.min.js"></script>
	<script src="static/commonJs/jquery.handsontable.full.js"></script>
	<script type="text/javascript" src="<c:url value='/static/commonJs/JCommonUtil.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/inputScore.js' />"></script>
	<script type="text/javascript">
		var getQuestionTypeUrl = '<c:url value="/score/getQuestionType" />';
		var inputScoreUrl = '<c:url value="/score/inputScore" />';
	</script>

  </head>
  
  <body>
    <%@include file="header.jsp"%>
    <div class="container-fluid">
		<div class="row-fluid">
			<%@include file="navigation.jsp"%>
			<div class="span9">
				<div class="hero-unit">
					<zkhy:MessageArea/>
					<div class="control-group">
						<div class="controls,input-append">
							考试名称：<input class="span2" type="text" id="examName" value="" />&nbsp;&nbsp;
							科目：
							<select class="span2" id="selectSubject" onchange="chooseSubject()">
								<option value="">——请选择——</option>
								<c:forEach items="${subjectList}" var="item">
									<option value="${item.subjectId}">${item.subjectName}</option>
								</c:forEach>
							</select>
							<br/>
							<div id="excel" class="handsontable"></div>
							<br/>
							<button class="form-control btn btn-primary" name="dump" data-dump="#excel" onclick="bindDumpButton();">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
  </body>
</html>
