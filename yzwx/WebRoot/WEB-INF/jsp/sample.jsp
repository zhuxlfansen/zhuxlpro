<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="yzwx" uri="http://www.ustc.edu.cn/tags/yzwx"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>sample</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="description" content="This is my page">

	<link href="<c:url value="/static/commonCss/common.css" />" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<c:url value='/static/commonJs/jquery-1.10.2.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/commonJs/JCommonUtil.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/sample/sample.js' />"></script>
	<script type="text/javascript">
		var searchUrl = '<c:url value="/sample/search" />'
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
		})
	</script>

  </head>
  
  <body>
	<yzwx:MessageArea />
    This is my JSP page. <br>
              请输入地域编号： <input name='regionCode' id='regionCode' value='' /> <input type="button" value="查询" onclick="fncSearch()" /><br>
              地域信息:
              <table id="resultTable">
              </table>
  </body>
</html>
