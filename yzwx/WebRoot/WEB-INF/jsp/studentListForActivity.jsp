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
	 $("#activityList").addClass("active");
	}); 

function audit(status,stuId){
	var flag=status=="t"?"通过":"不通过";
	if(confirm("确认审核"+flag+"该学生的夏令营申请？")){
		$.post("<%=path%>/updateAudit",{activityId:$("#actId").val(),studentId:stuId,auditStatus:status},function(data) {
			if(data=="success"){
				alert("完成审核！");
				$("#form1").submit(); 
			}else{
				alert("审核失败！请联系系统管理员！");
			}
			
		});
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
					<p>夏令营报名详情</p>
					<strong>活动名称：</strong>${act.name }
					<form id="form1" class="form-horizontal" action="getStudentListByActId" method="post">
					    <input name="curpage" id="curpage" type="hidden" value="${page.curPage}">
					    <input name="id" id="actId" type="hidden" value="${act.id }">
					</form>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						<table  class="table table-striped table-hover ">
							<tr>
								<th>报名考生姓名</th>
								<th>学校</th>
								<th>专业</th>
								<th style="padding-right: 20px;">操作</th>
							</tr>
							<c:forEach items="${page.result}" var="stu">
								<tr>
									<td>${stu.studentName}</td>
									<td>${stu.schoolName}</td>
									<td>${stu.studentMajor}</td>
									<td>
									<a href="${pageContext.servletContext.contextPath}/student/detail?id=${stu.studentId}">详情</a>&nbsp;&nbsp;
									<c:choose >
									<c:when test="${stu.auditStatus==0 }">
									审核（<a href="javascript:;" onclick="audit('t','${stu.studentId}');">通过</a>/<a  href="javascript:;" onclick="audit('f','${stu.studentId}');">不通过</a>）
									</c:when>
									<c:when test="${stu.auditStatus==1 }">
									<lable>已审核（通过）</lable>
									</c:when>
									<c:when test="${stu.auditStatus==2 }">
									<lable style="color:red">已审核（未通过）</lable>
									</c:when>
									</c:choose>
									</td>
								</tr>
							</c:forEach>
						</table>
    	                   <yzwx:page pageCount="${page.pageCount }" count='${page.count }' curPage='${page.curPage}' />
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
