<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- letf -->
<div class="span3">
	<div class="well sidebar-nav">
		<ul id="ul_li" class="nav nav-list">
			<li class="nav-header">考生信息</li>
			<li id="studentlist"><a href="${pageContext.servletContext.contextPath}/findStuByActivity?curpage=1">考生列表</a></li>
			<li id="studentDetail"><a href="${pageContext.servletContext.contextPath}/student/init">考生详情</a></li>
			<li id="activityPartakeChart"><a href="${pageContext.servletContext.contextPath}/chart/activityPartake">考生分布统计</a></li>
			<li class="nav-header">反馈信息</li>
			<li id="activitySatisfactionChart"><a href="${pageContext.servletContext.contextPath}/chart/activitySatisfaction">满意度统计</a></li>
			<!-- <li><a href="#">意见汇总</a></li> -->
			<li><a href="#">点击率统计</a></li>
			<li class="nav-header">活动信息</li>
			<li id="activityList"><a href="${pageContext.servletContext.contextPath}/toActivityList?curpage=1">活动列表</a></li>
			<li class="nav-header">成员管理</li>
			<li id="adminAdd"><a href="${pageContext.servletContext.contextPath}/admin/add">新增管理员</a></li>
            <li id="adminlist"><a href="${pageContext.servletContext.contextPath}/admin/selectAll">管理员列表</a></li>
		</ul>
	</div>
</div>
<!-- .left -->