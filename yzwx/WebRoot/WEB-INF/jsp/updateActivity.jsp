<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>list</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link type="text/css"  href="static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/common.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/fenye.css" rel="stylesheet">

<script src="static/commonJs/jquery-1.10.2.min.js"></script>
<script src="static/commonJs/bootstrap.min.js"></script>
<script src="static/commonJs/page.js"></script>
<script src="static/commonJs/My97DatePicker/WdatePicker.js"></script>
<script src="static/commonJs/AntValidator.js"></script>
<script src="static/commonJs/AntValidatorRegex.js"></script>

<script type="text/javascript" >
$(document).ready(function() {
	 $("#ul_li  li").each(function() {
		 $(this).removeClass("active");
	    }); 
	 $("#activityList").addClass("active");
	 
	 var pId = $("#province_select").val();
	 var cityId = '${activity.regionCode}';
	 selectFirstCg(pId,cityId);
	}); 
	
jQuery(function($){
	if($("#form1")){
		$.formValidator.initConfig({formid:"form1",errorfocus:false,onerror:function(msg){},onsuccess:function(){	
			return true;
		}});
		$.formValidator.getInitConfig("1").wideword = false;
		$("#name").formValidator({onshow:"* 必填",onfocus:"輸入活动名称",oncorrect:"&nbsp;"}).inputValidator({min:1,max:50,onerror: "活動名称长度为1-50位"});
		$("#content").formValidator({onshow:"* 必填",onfocus:"请输入活动内容",oncorrect:"&nbsp;"}).inputValidator({min:1,onerror: "请输入活动内容"});
		$("#startTime").formValidator({onshow:"* 必填",onfocs:"输入活动开始日期",oncorrect:"&nbsp;"}).inputValidator({min:1,onerror: "请选择开始日期"});
		$("#endTime").formValidator({onshow:"* 必填",onfocs:"输入活动结束日期",oncorrect:"&nbsp;"}).inputValidator({min:1,onerror: "请选择截止日期"});
		$("#address").formValidator({onshow:"* 必填",onfocus:"输入活动地址",onempty:"&nbsp;",oncorrect:"&nbsp;"})
                       .inputValidator({min:1,max:500,onerror: "输入长度长度为1-500位"});	
	}
});

function selectFirstCg(_value,cityId){
	$("#secCg").show();
	$("#secCg").empty();
	$("#secCg").css("border","1px solid #ccc");
	$.ajax({
		url : 'getCity?parentId='+_value,
		type : 'POST',
		contentType : 'application/json',
		dataType : 'json',
		success  :  function(data) {
				 if (data != '' && _value!='') {
					var datas = eval(data);
						$("#secCg").append("<option value=''>请选择...</option>");
						for ( var i = 0; i < datas.length; i++) {
			              		if(cityId==datas[i].id){
				              		$("#secCg").append("<option selected='selected' value='"+datas[i].id+"'>"+datas[i].name+"</option>");
				              	}else{
				              		$("#secCg").append("<option value='"+datas[i].id+"'>"+datas[i].name+"</option>");
				              		}
						}
				}else{
					$("#secCg").hide();
				}
			//	$("#regionCode").val($("#province_select").val());
			},
			 error: function () {
	                $("#secCg").hide();
	            }
	});
}

function copyCategoryValue(_value){
	$("#secCg").css("border","1px solid #ccc");
	$("#addressTip").html("");
	$("#regionCode").val($("#secCg").val());
}	

function update(){
	validateReg();
	if(validateRegion){
		$("#form1").submit();
	}
}

var validateRegion = false;
function validateReg(){
	var provinceId =  $("#province_select").val();
	var cityId =  $("#secCg").val();
	if(provinceId==0||provinceId==null){
		$("#province_select").css("border","1px solid red");
		$("#addressTip").html("请选择省市");
		validateRegion = false;
	}else{
		$("#province_select").css("border","1px solid #ccc");
		$("#addressTip").html("");
	}
	if(cityId ==0||cityId==null){
		$("#secCg").css("border","1px solid red");
		$("#addressTip").html("请选择省市");
		validateRegion = false;
	}else{
		$("#secCg").css("border","1px solid #ccc");
		$("#addressTip").html("");
		validateRegion = true;
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
			
			<div class="span9">
			   <form id="form1" name="form1" action="update" method="post">
			   <input name="id" type="hidden" value="${activity.id}" />
			   <input name="status" type="hidden" value="${activity.status}" />
			    <input id="regionCode" name="regionCode" type="hidden" value="${activity.regionCode}"/>
			   <h3>增加活动</h3>
				<table>
					<tr>
						<th>名称:</th>
						<td><input id="name" type='text' name="name" style="height: 26px;width: 370px;" value="${activity.name}"/><span id="nameTip"></span>
						</td>
					</tr>
					<tr>
						<th>内容:</th>
						<td>
						    <textarea name="content" id="content" style="height: 100px;width: 370px;">${activity.content}</textarea>
						<span id="contentTip"></span>
						</td>
					</tr>
					<tr>
						<th>开始时间:</th>
						<td><input id="startTime" type='text' style="height: 26px;" name="startTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-{%d+1}'})" value="<fmt:formatDate value="${activity.startTime}" pattern="yyyy-MM-dd HH:mm"/>"/><span id="startTimeTip"></span>
						</td>   
					</tr>
					<tr>
						<th>结束时间:</th>
						<td><input id="endTime" type="text" style="height: 26px;" name="endTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-{%d+1}'})" value="<fmt:formatDate value="${activity.endTime}" pattern="yyyy-MM-dd HH:mm"/>"/><span id="endTimeTip"></span>
						</td>
					</tr>
					<tr>
						<th>活动地址:</th>
						<td>
						<select id="province_select" onchange="selectFirstCg(this.value);" style="width: 160px;">
									<option value="0">——请选择——</option>
									<c:forEach items="${provinceList}" var="province">
										  <c:choose>
											<c:when test="${provinceId==province.id}">
												<option value="${province.id}" selected="selected">${province.name}</option>
											</c:when>
											<c:otherwise>
												 <option value="${province.id}">${province.name}</option>
											</c:otherwise>
										</c:choose>
										  
									</c:forEach>
						</select>
						<select id="secCg" name="secCg" onchange="copyCategoryValue(this.value);" style="width: 160px;"></select>
						<input id="address" name="address" type='text' style="height: 26px;" value="${activity.address}"/>
						<span id="addressTip"></span>
						</td>
					</tr>	
					<tr>
						<th></th>
						<td><input type="button" value="保存" onclick="update()"  class="SaveBtn" />
						<input type="button" value="取消" name="" class="SaveBtn" onclick="javascript:window.history.go(-1);"/>
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
