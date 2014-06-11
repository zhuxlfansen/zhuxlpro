<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale-1,maximum-scale=1.0,user-scalable=no">
<title>学生号绑定</title>
<link type="text/css"  href="<%=path %>/static/commonJs/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<script src="<%=path %>/static/commonJs/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/commonJs/jqmobile/jquery.mobile-1.4.2.js"></script>
<script type="text/javascript">
function onSubmit(){
	var wechatCode=$("#wechatCode").val();
	var account=$("#account").val();
	var password=$("#password").val();
	
	if(account==""){
		$("#msg").html("账号不能为空！");
	}else if(password==""){
		$("#msg").html("密码不能为空！");
	}else if(password.length<6){
		$("#msg").html("密码格式不正确！");
	}else{
		$.post("<%=path%>/mob/getBind",{
			"wechatCode":wechatCode,
			"account":account,
			"password":password
		},function(data,status){
			if(data=="userIdNotExist"){
				$("#msg").html("用户账号不存在！");
			}else if(data=="alreadyBound"){
				$("#msg").html("该用户帐号已绑定！");
			}else if(data=="wrongPassword"){
				$("#msg").html("密码错误！");
			}else if(data=="success"){
				$("#content").html("<h2 style='color: green'>绑定成功！</h2>");
			}
		});
	}
}
</script>
</head>

<body>
<input type="hidden" id="wechatCode" value="${wechatCode }"/>
<div data-role="page">
<div class="content" data-role="content" id="content">
	<c:choose>
		<c:when test="${count>0 }">
			<h2 style='color: green'>该微信号已绑定！</h2>
		</c:when>
		<c:otherwise>
			<h3>请根据您分配到的学生账号密码完成绑定</h3>
			<div class="ui-field-contain" >
				<label style="color: red" id="msg" ></label>
			    <input type="text" id="account" class="ui-btn-inline" placeholder="输入您的账号" value=""><br/>
			    <input type="password" id="password" placeholder="输入您的密码" value="">
			</div>
			<button style="background-color: #3388cc;color: #fff;text-shadow: 0 0px 0 #F3F3F3" onclick="onSubmit();">绑定</button>
		</c:otherwise>
	</c:choose>
</div>
<footer data-role="footer" data-position="fixed"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>

</body>
</html>
