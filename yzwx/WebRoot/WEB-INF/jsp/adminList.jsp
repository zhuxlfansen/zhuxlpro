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
<title>list</title>
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
	 $("#adminlist").addClass("active");
	 
}); 

function deleteAdmin(id){
	if(confirm("确定删除吗?删除后将不可恢复...")){
        window.location.href="${pageContext.servletContext.contextPath}/admin/delete?id="+id;
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
					  后台管理员列表
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						<table  class="table table-striped table-hover ">
							<tr>
								<th>ID</th>
								<th>名称</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${adminList.result}" var="adm">
								<tr>
									<td>${adm.id}</td>
									<td>${adm.name}</td>
									<td>
									   <a href="${pageContext.servletContext.contextPath}/admin/detail?id=${adm.id}">修改密码</a>丨
									   <a href="javascript:deleteAdmin('${adm.id}');">删除用户</a>
									</td>
								</tr>
							</c:forEach>
						</table>
    	                <yzwx:page pageCount="${adminList.pageCount }" count='${adminList.count }' curPage='${adminList.curPage}' />
					</div>
				</div>
			</div>
			<!-- .right -->
		</div>
		<!--/row-->

		<hr>
		<form id="form1" class="form-horizontal" action="${pageContext.servletContext.contextPath}/admin/selectAll" method="post"  >
		<input name="curpage" id="curpage" type="hidden">
         </form>
	</div>
	
	<%@include file="footer.jsp"%>
</body>
</html>
