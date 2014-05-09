<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="yzwx" uri="http://www.ustc.edu.cn/tags/yzwx"%>
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
<title>处理结果画面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="static/commonCss/bootstrap-3.min.css" rel="stylesheet">
<script src="static/commonJs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="static/commonJs/JCommonUtil.js"></script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

</head>

<body>
<script type="text/javascript">
    var g_MsgArea = [];
    <c:forEach items="${pageMsgAreaData}" var="varMsgArea">
    g_MsgArea.push(new I18nMessage('<c:out value="${varMsgArea.text}" />',
        '<c:out value="${varMsgArea.type}" />',
        '<c:out value="${varMsgArea.item}" />',
        '<c:out value="${varMsgArea.code}" />'));
    </c:forEach>
    $(document).ready(function(){
        if (g_MsgArea.length > 0) {
            JCommonUtil.clearMessageArea();
            JCommonUtil.addMessageArea(g_MsgArea);
        }
    });
</script>
	<div class="col-md-12" style="padding-left: 0px;padding-right: 0px;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4 class="panel-title" style="margin-top: 5px; margin-bottom: 5px;">处理结果</h4>
			</div>
			<div class="panel-body">
				<yzwx:MessageArea />
			</div>
		</div>
	</div>
</body>
</html>
