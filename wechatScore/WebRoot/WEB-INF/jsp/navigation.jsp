<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- letf -->
<div class="span3">
	<div class="well sidebar-nav">
		<ul id="ul_li" class="nav nav-list">
			<li class="nav-header">学生管理</li>
			<li id="studentlist"><a href="${pageContext.servletContext.contextPath}/student/init">学生账号初始化</a></li>
			<li class="nav-header">成绩管理</li>
			<li id="reportPartakeChart"><a href="${pageContext.servletContext.contextPath}/score/init">学生成绩录入</a></li>
			<li class="nav-header">管理员</li>
			<li id="adminAdd"><a href="${pageContext.servletContext.contextPath}/toAddManager">新增管理员</a></li>
            <li id="adminlist"><a href="${pageContext.servletContext.contextPath}/toManagerList">管理员列表</a></li>
		</ul>
	</div>
</div>
<!-- .left -->