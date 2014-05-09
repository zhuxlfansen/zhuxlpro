<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="yzwx" uri="http://www.ustc.edu.cn/tags/yzwx"%>
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
<title>管理员添加画面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link type="text/css"  href="static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/common.css" rel="stylesheet">

<script src="static/commonJs/jquery-1.10.2.min.js"></script>
<script src="static/commonJs/bootstrap.min.js"></script>
<script src="static/commonJs/My97DatePicker/WdatePicker.js"></script>
<script src="static/commonJs/AntValidator.js"></script>
<script src="static/commonJs/AntValidatorRegex.js"></script>
<script type="text/javascript" src="static/commonJs/JCommonUtil.js"></script>

<style type="text/css">
.mytable  tr{height: 60px;}
.mytable  th{width: 120px;}
</style>

<script type="text/javascript" >
var g_MsgArea = [];
<c:forEach items="${pageMsgAreaData}" var="varMsgArea">
g_MsgArea.push(new I18nMessage('<c:out value="${varMsgArea.text}" />',
    '<c:out value="${varMsgArea.type}" />',
    '<c:out value="${varMsgArea.item}" />',
    '<c:out value="${varMsgArea.code}" />'));
</c:forEach>
$(document).ready(function(){
    $("#ul_li  li").each(function() {
        $(this).removeClass("active");
       }); 
    $("#adminAdd").addClass("active");
    
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
		$("#name").formValidator({onshow:"* 必填",onfocus:"请输入用户名",oncorrect:"&nbsp;"}).inputValidator({min:1,max:20,onerror: "用户名称长度为1-20位"});
		$("#password").formValidator({onshow:"* 必填",onfocus:"请输入密码",oncorrect:"&nbsp;"}).inputValidator({min:6,max:12,onerror: "密码长度为6-12位"});
		$("#password2").formValidator({onshow:"* 必填",onfocus:"请再次输入密码",oncorrect:"&nbsp;"}).inputValidator({min:6,max:12,onerror:"密码长度为6-12位"}).compareValidator({desid:"password",operateor:"=",onerror:"两次密码不一致!"});
	}
});
</script>

</head>

<body>
	<!-- top -->
	<%@include file="header.jsp"%>
	<!-- .top -->
	<div class="container-fluid">
		<div class="row-fluid">
			
			<%@include file="navigation.jsp"%>
			
			<div class="span9">
			    <div class="hero-unit">
                                新增系统管理员
                </div>
                <yzwx:MessageArea />
			   <form id="form1" name="form1" action="${pageContext.servletContext.contextPath}/admin/submitAdd" method="post">
				<table class="mytable">
					<tr>
						<th>用&nbsp;户&nbsp;名:</th>
						<td><input id="name" type='text' name="name" style="height: 26px;"/><span id="nameTip"></span>
						</td>
					</tr>
					<tr>
						<th>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</th>
						<td><input id="password" type='password' name="password" style="height: 26px;"/><span id="passwordTip"></span>
						</td>
					</tr>
					<tr>
						<th>确认密码:</th>
						<td><input id="password2" type='password' name="password2" style="height: 26px;"/><span id="password2Tip"></span>
						</td>
					</tr>	
					<tr>
						<th></th>
						<td>
						<input type="submit" class="btn btn-success" value="保存"  />
						<input type="reset" value="重填" class="btn" name=""   />
						</td>
					</tr>
				</table>
			  </form>
			</div>
		</div>
	</div>
	
	<%@include file="footer.jsp"%>
</body>
</html>
