<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<meta charset="utf-8">
<title>排班管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link type="text/css"  href="static/commonCSS/bootstrap.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCSS/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCSS/common.css" rel="stylesheet">
<link type="text/css"  href="static/commonCSS/fenye.css" rel="stylesheet">

<script src="static/commonJS/jquery-1.10.2.min.js"></script>
<script src="static/commonJS/bootstrap.min.js"></script>

<script type="text/javascript">
function test(obj){
	if($(obj).html()=="&nbsp;"){
		$(obj).css("background-color","#CC3300");
		$(obj).html("值班");
	}else{
		$(obj).css("background-color","#339999");
		$(obj).html("&nbsp;");
	}
}
</script>
</head>

<body>
	<!-- top -->
	<%@include file="header.jsp"%>
	<!-- .top -->
	<div class="container-fluid">
		<div class="row-fluid">
			
			<%@include file="navigation.jsp"%>
			
			<!-- right -->
			<div class="span9">
				<div class="hero-unit">
					<div class="control-group" >
						<div class="controls,input-append">
						本周：2014年5月15日-2014年5月22日&nbsp;&nbsp;
						<button class="btn btn-info " type="button" >确定</button>
						</div>
					</div>			
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						<table class="table table-bordered">
						  <tr>
						  	<th>姓名</th>
						  	<th>知名专家</th>
						  	<th>科室</th>
						  	<th>是否专科</th>
						  	<th>周一<br/>/上午</th>
						  	<th>周一<br/>/下午</th>
						  	<th>周二<br/>/上午</th>
						  	<th>周二<br/>/下午</th>
						  	<th>周三<br/>/上午</th>
						  	<th>周三<br/>/下午</th>
						  	<th>周四<br/>/上午</th>
						  	<th>周四<br/>/下午</th>
						  	<th>周五<br/>/上午</th>
						  	<th>周五<br/>/下午</th>
						  	<th>周六<br/>/上午</th>
						  	<th>周六<br/>/下午</th>
						  	<th>周日<br/>/上午</th>
						  	<th>周日<br/>/下午</th>
						  	
						  </tr>
						  <tr>
						  	<td>张三</td>
						  	<td>是</td>
						  	<td>内科</td>
						  	<td>是</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  </tr>
						  <tr>
						  	<td>李四</td>
						  	<td>--</td>
						  	<td>内科</td>
						  	<td>是</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  </tr>
						  <tr>
						  	<td>王五</td>
						  	<td>--</td>
						  	<td>内科</td>
						  	<td>是</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #CC3300;cursor: pointer;color: white;text-align: center;" onclick="test(this);">值班</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  	<td style="background-color: #339999;cursor: pointer;color: white;text-align: center;" onclick="test(this);">&nbsp;</td>
						  </tr>
						</table>
					</div>
				</div>
			</div>
			<!-- .right -->
		</div>
		<!--/row-->

		<hr>
	</div>
	
</body>
</html>
