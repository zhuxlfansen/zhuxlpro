<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>studentdetail</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="static/commonCss/bootstrap.min.css" rel="stylesheet">
<link href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link href="static/commonCss/common.css" rel="stylesheet">
<script src="static/commonJs/jquery-1.10.2.min.js"></script>
<script src="static/commonJs/bootstrap.min.js"></script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

</head>

<body>
<script type="text/javascript">
$(document).ready(function() {
    $("#ul_li  li").each(function() {
        $(this).removeClass("active");
       }); 
    $("#studentDetail").addClass("active");
   }); 
// 验证输入的ID是否数字
function checkForm(){
	 var sid = $("#studentId").val().replace(/(^\s*)|(\s*$)/g, "");
	 if(isNaN(sid)){
		alert("请输入正确格式的考生ID...");
        return false;
    }
    
    return true;  
}

</script>
	<!-- top -->
	<%@include file="header.jsp"%>
	<!-- .top -->
	<div class="container-fluid">
		<div class="row-fluid">
			<%@include file="navigation.jsp"%>
			<!-- right -->
			<div class="span9">
				<div class="hero-unit">
					<form class="form-horizontal" method="post" action="student/detail" onsubmit="return checkForm();">
						<div class="control-group">
							<label class="control-label" for="inputEmail">考生ID：</label>
							<div class="controls,input-append">
								<input class="span2" name="id" type="text" id="studentId" value="${student.id}" />
								<button class="btn" type="submit">查询</button>
							</div>
						</div>
					</form>
				</div>

				<div class="row-fluid">
					<div class="span12">
						<table class="table table-hover ">
							<c:if test="${student == null }">
								<caption style="background-color:#F0AD4E;color: white; ">请输入正确格式的考生ID后进行查询。</caption>
							</c:if>
							<c:if test="${student != null }">
								<caption style="background-color:#0088CC;color: white; ">
									用户：<font color="black" style="font-weight: bolder;">${student.name}</font> 的详情
								</caption>
								<tr>
									<th class="span4">用户ID</th>
									<td>${student.id }</td>
								</tr>
								<tr>
									<th>姓名</th>
									<td>${student.name }</td>
								</tr>
								<tr>
                                    <th>电话</th>
                                    <td>${student.contact }</td>
                                </tr>
                                <tr>
                                    <th>EMAIL</th>
                                    <td>${student.email }</td>
                                </tr>
								<tr>
									<th>学校</th>
									<td>${student.school.name }</td>
								</tr>
								<tr>
                                    <th>所学专业</th>
                                    <td>${student.studentMajor }</td>
                                </tr>
								<tr>
									<th>报考专业</th>
									<td>${student.major.name }</td>
								</tr>
								<tr>
									<th>成绩</th>
									<td>${student.gpa }</td>
								</tr>
                                <tr>
                                    <th>班级排名</th>
                                    <td>${student.studentRank }</td>
                                </tr>
								<tr>
                                    <th>班级人数</th>
                                    <td>${student.classSize }</td>
                                </tr>
                                <tr>
                                    <th>参加活动</th>
                                    <td>
                                        <c:if test="${fn:length(partakeRecordList) >0}">
                                            <c:forEach var="partakeRecord" items="${partakeRecordList}">
                                                <p>
                                                    ${partakeRecord.activity.name }
                                                    <font color="blue">
	                                                    (<c:if test="${partakeRecord.status==1}">
	                                                                                                               已报名
	                                                    </c:if>
	                                                    <c:if test="${partakeRecord.status==2}">
	                                                                                                               已签到
	                                                    </c:if>
	                                                    <c:if test="${partakeRecord.status==3}">
	                                                                                                               已完成
	                                                    </c:if>)
                                                    </font>
                                                </p>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${fn:length(partakeRecordList)==0}">
                                           <font color="red">暂时未参加任何活动</font>
                                        </c:if>
                                    </td>
                                </tr>
								<tr>
									<th>成绩单</th>
									<td><img src="student/loadGpaImg?id=${student.id }" width="650px;"/></td>
								</tr>
							</c:if>
						</table>
						<!-- <ul class="pager">
                            <li><a href="#">&lt;&lt;&nbsp;首页</a></li>
                            <li><a href="#">&lt;&nbsp;上一页</a></li>
                            <li><a href="#">下一页&nbsp;&gt;</a></li>
                            <li><a href="#">尾页&nbsp;&gt;&gt;</a></li>
                        </ul> -->
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