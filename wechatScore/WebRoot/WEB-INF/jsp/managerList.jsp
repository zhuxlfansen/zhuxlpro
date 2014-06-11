<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.zkhy.com/tags/zkhy" prefix="zkhy"%>
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
<title>二级管理员一览画面</title>
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
<script src="static/commonJs/My97DatePicker/WdatePicker.js"></script>
<script src="static/commonJs/page.js"></script>

<script type="text/javascript" >
$(document).ready(function() {
	 $("#ul_li  li").each(function() {
		 $(this).removeClass("active");
	    }); 
	 $("#adminlist").addClass("active");
	}); 

	function find(){
	//	var name = $("#name").val();
	//	if(name.length>0){
			$("#curpage").val(1);
	//	}
		$("#form1").submit();
	}
	
	function del(managerId){
		if(confirm("确定要冻结此账户？")){
			window.location.href="frozenAccounts?id="+managerId;
		}
	}
	
	function thew(managerId){
		if(confirm("确定要解冻此账户？")){
            window.location.href="thawAccount?id="+managerId;
        }
	}
	
	function reset(managerId){
		if(confirm("重置密码为a12345")){
            window.location.href="resetPassword?id="+managerId;
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
                    <form id="form1" class="form-horizontal" action="toManagerList" method="post">
                       <%-- <input name="activityId" id="activityId" type="hidden" value="${activityId}">
                        <input name="provinceId" id="provinceId" type="hidden" value="${provinceId}">
                        <input name="majorCode" id="majorCode" type="hidden" value="${majorCode}"> --%>
                        <input name="curpage" id="curpage" type="hidden">
                        <div class="control-group">
                        <div class="controls,input-append">
                            用户名：<input class="span1" type="text" name="username" value="${username}" style="width: 120px;"/>&nbsp;&nbsp;
                            年级：<input class="span1" type="text" name="managerGrade" value="${managerGrade}" onfocus="WdatePicker({dateFmt:'yyyy'})" style="width: 120px;"/>
                            班级：
                                <select class="span2" id="managerClass_select" name="managerClass" onchange="">
                                    <option value="">请选择</option>
		                           <c:forEach items="${classList}" var="cla">
                                          <c:choose>
                                            <c:when test="${managerClass==cla.value}">
                                                <option value="${cla.value}" selected="selected">${cla.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                 <option value="${cla.value}">${cla.name}</option>
                                            </c:otherwise>
                                            </c:choose>
                                    </c:forEach>
                                </select>
                              状态：
                                <select class="span2" id="provinceId_select" name="status" onchange="">
                                    <option value="">请选择</option>
                                    <option value="1" <c:if test="${status=='1' }">selected</c:if> >正常</option>
                                    <option value="2" <c:if test="${status=='2' }">selected</c:if> >已冻结</option>
                                </select>
                                <button class="btn btn-default" type="button" onclick="find()">查询</button>
                            </div>
                        </div>
                    </form>
                </div>
				
				<div class="row-fluid">
					<div class="span12">
						<table  class="table table-striped table-hover ">
							<tr>
								<th>用户名</th>
								<th>年级</th>
								<th>班级</th>
								<th>状态</th>
								<th style="padding-right: 20px;">操作</th>
							</tr>
							<c:forEach items="${managerPage.result}" var="manager">
								<tr>
									<td  style="padding-left: 20px;">${manager.username}</td>
									<td>${manager.managerGrade} 届</td>
									<td>${manager.managerClass} 班</td>
									<td>
									<c:if test="${manager.status==1}">正常</c:if>
									<c:if test="${manager.status==2}">已冻结</c:if>
									</td>
									<td>
									<a href="toUpdateManager?id=${manager.managerId}"><button type="button" class="btn btn-default">修改</button></a>
									
									<c:if test="${manager.status==1}"><a href="javascript:del(${manager.managerId});"><button type="button" class="btn btn-default">冻结账户</button></a></c:if>
                                    <c:if test="${manager.status==2}"><a href="javascript:thew(${manager.managerId});"><button type="button" class="btn btn-info">解冻账户</button></a></c:if>
									<a href="javascript:reset(${manager.managerId});"><button type="button" class="btn btn-default">重置密码</button></a>
									</td>
								</tr>
							</c:forEach>
						</table>
    	                   <zkhy:page pageCount="${managerPage.pageCount }" count='${managerPage.count }' curPage='${managerPage.curPage}' />
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
