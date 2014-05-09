<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="yzwx" uri="http://www.ustc.edu.cn/tags/yzwx"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>研招系统登录画面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="研招系统登录画面">

<link type="text/css" href="static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css" href="static/commonCss/common.css" rel="stylesheet">

<script type="text/javascript" src="<c:url value='/static/commonJs/jquery-1.10.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/commonJs/bootstrap.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/commonJs/JCommonUtil.js' />"></script>
<script src="static/commonJs/My97DatePicker/WdatePicker.js"></script>
<script src="static/commonJs/AntValidator.js"></script>
<script src="static/commonJs/AntValidatorRegex.js"></script>

<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

#form1{padding-left: 100px;padding-right: 100px;max-width: 340px;border: 1px solid #357EBD;}
.form-signin-heading{margin-left: -100px;margin-right: -100px;width: 540px;background-color: #357EBD;color: white;margin-top: -20px;line-height: 80px;border-radius:5px;text-align: center;}
.control-group{width: 340px;}

</style>

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

jQuery(function($){
    if($("#form1")){
        $.formValidator.initConfig({formid:"form1",errorfocus:false,onerror:function(msg){},onsuccess:function(){   
            return true;
        }});
        $.formValidator.getInitConfig("1").wideword = false;
        $("#name").formValidator({onshow:"* 必填",onfocus:"请输入用户名",oncorrect:"ok"}).inputValidator({min:1,max:20,onerror: "用户名长度:1-20"});
        $("#password").formValidator({onshow:"  * 必填",onfocus:"  请输入密码",oncorrect:"ok"}).inputValidator({min:6,max:12,onerror: "  密码长度:6-12"});
    }
});
</script>

</head>

<body>
	<div class="container" style="margin-top: 100px;">
		<form class="form-signin bs-docs-example form-horizontal" action="<%=request.getContextPath()%>/login" method="POST"  id="form1"  >
		  
			<h3 class="form-signin-heading" >
			 科大研招微信平台后台管理系统
			</h3>
			<br/>
			<yzwx:MessageArea/>
			
			 <div class="control-group">
			     <label class="control-label" for="username" style="width: auto;">用户名</label>
				<div class="controls" style="margin-left: 50px;">
				    <input placeholder="用户名" type="text" name="username" id="name" style="width: 150px;"/>&nbsp;&nbsp;<span id="nameTip" class="mytip"></span>
				</div>
			</div>
			<div class="control-group" >
				<label class="control-label" for="inputPassword"  style="width: auto;">密&nbsp;&nbsp;码</label>
				<div class="controls input-block-level" style="margin-left: 50px;">
				    <input placeholder="密码" type="password" name="password" id="password" style="width: 150px;"/>&nbsp;&nbsp;<span id="passwordTip" class="mytip"></span>
				</div>
			</div>
			<div class="control-group">
				<button class="btn btn-large btn-primary" type="submit">登录</button> &nbsp;&nbsp;
				<button class="btn btn-large btn-default" type="reset">重填</button> 
            </div>
		</form>
	</div>
	<!-- /container -->
</body>
</html>
