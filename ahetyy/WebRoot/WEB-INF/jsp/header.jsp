<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="#">安徽省儿童医院-后台管理系统</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">
						您好，管理员   <a href="<%=request.getContextPath()%>/logout" class="navbar-link">退出登录</a>
					</p>
				</div>
			</div>
		</div>
	</div>