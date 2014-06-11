<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="expires" content="0">
<script type="text/javascript">
var redirectUrl = "";
<c:if test="${!empty redirectUrl}">
	redirectUrl = "<c:url value='${redirectUrl}' />";
	window.location=redirectUrl;
</c:if>
</script>
<title><spring:message code="login.label.welcome"></spring:message></title>
</head>
<body>
<div style="width:100%;">
	<form action="<spring:url value="/login" />" method="post">
		<table style="width:240px;margin:0 auto;">
			<tr>
				<td><spring:message code="login.label.userId"></spring:message></td>
				<td><input type="text" id="username" name="username" style="width:100%;"/></td>
			</tr>
			<tr>
				<td><spring:message code="login.label.extended"></spring:message></td>
				<td><input type="text" id="extended" name="extended" style="width:100%;"/></td>
			</tr>
			<tr>
				<td><spring:message code="login.label.userPwd"></spring:message></td>
				<td><input type="password" id="password" name="password" style="width:100%;"/></td>
			</tr>
		</table>
		<div style="width:240px;margin:0 auto;">
			<input type="submit" value="<spring:message code="login.button.login"></spring:message>" style="float:right;border:1px solid green;width:72px;height:28px;"/>
		</div>
	</form>
</div>
</body>
</html>