<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="yzwx" uri="http://www.ustc.edu.cn/tags/yzwx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>活动添加画面</title>
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
<script type="text/javascript" src="<c:url value='/static/commonJs/JCommonUtil.js' />"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=l56EB0XkMM5pKGI41mYgCsxO"></script>

<script type="text/javascript" >

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
	
	activitySet();
});

jQuery(function($){
	activityTypeVal=$("#activityType").val();
	if($("#form1")){
		$.formValidator.initConfig({formid:"form1",errorfocus:false,onerror:function(msg){},onsuccess:function(){	
			return true;
		}});
		$.formValidator.getInitConfig("1").wideword = false;
		$("#name").formValidator({onshow:"* 必填",onfocus:"输入活动名称",oncorrect:"&nbsp;"}).inputValidator({min:1,max:50,onerror: "活动名称长度为1-50位半角或1-25位全角字符"});
		$("#content").formValidator({onshow:"* 必填",onfocus:"请输入活动内容",oncorrect:"&nbsp;"}).inputValidator({min:1,max:200,onerror: "活动内容长度为1-200位半角或1-100全角字符"});
		$("#startTime").formValidator({onshow:"* 必填",onfocs:"输入活动开始日期",oncorrect:"&nbsp;"}).inputValidator({min:1,onerror: "请选择开始日期"});
		$("#endTime").formValidator({onshow:"* 必填",onfocs:"输入活动结束日期",oncorrect:"&nbsp;"}).inputValidator({min:1,onerror: "请选择截止日期"});
		$("#address").formValidator({onshow:"* 必填",onfocus:"输入活动地址",onempty:"&nbsp;",oncorrect:"&nbsp;"});
		$("#facultySelect").formValidator({onshow:"* 必填",onfocs:"输入院系",oncorrect:"&nbsp;"});
	}
});

function selectFirstCg(obj){
	$("#secCg").show();
	$("#secCg").empty();
	$("#secCg").css("border","1px solid #ccc");
	$("#province_select").css("border","1px solid #ccc");
	//重置地图
	map.clearOverlays();   
    document.getElementById("lng").value="";
	document.getElementById("lat").value="";
	map.centerAndZoom(obj.options[obj.selectedIndex].text,13); 
	
	$.ajax({
		url : 'getCity?parentId='+obj.value,
		type : 'POST',
		contentType : 'application/json',
		dataType : 'json',
		success  :  function(data) {
				 if (data != '' && obj.value!='') {
					var datas = eval(data);
						$("#secCg").append("<option value='0'>请选择...</option>");
						for ( var i = 0; i < datas.length; i++) {
			              		$("#secCg").append("<option value='"+datas[i].id+"'>"+datas[i].name+"</option>");
						}
				}else{
					$("#secCg").hide();
				}
				$("#regionCode").val($("#province_select").val());
			},
			 error: function () {
	                $("#secCg").hide();
	            }
	});
}

function copyCategoryValue(obj){
	$("#secCg").css("border","1px solid #ccc");
	$("#addressTip").html("");
	$("#regionCode").val($("#secCg").val());
	
	//重置地图
	map.clearOverlays();   
    document.getElementById("lng").value="";
	document.getElementById("lat").value="";
	map.centerAndZoom(obj.options[obj.selectedIndex].text,13); 
}	

function add(){
	validateReg();
	if(validateRegion&&ajaxValidate){
		$("#form1").submit();
	}
}

var validateRegion = false;
function validateReg(){
	
	activityTypeVal=$("#activityType").val();
	
	if("report"==activityTypeVal) {
		var provinceId =  $("#province_select").val();
		var cityId =  $("#secCg").val();
		var address = $("#address").val();
		
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
		if(address==null||address==""){
			$("#address").css("border","1px solid #red");
			$("#addressTip").html("请输入活动地址");
		}else{
			if(address.length<1||address.length>200){
				$("#address").css("border","1px solid #red");
				$("#addressTip").html("活动地址请输入1-200位半角或1-100全角字符");
			}else {
				$("#address").css("border","1px solid #ccc");
				$("#addressTip").html("");
			}
		}
		$("input[name$='.boardingInfo']").each(function(i, o){
			if($.trim($(o).val())==""){
				$("#boardingTip").html("乘车线路信息信息不能为空");
		    	$(o).focus();
		    	validateRegion = false;
		    	return false;
		    } else {
		    	$("#boardingTip").html("");
		    	validateRegion = true;
		    }
		});
	} else {
		majorId = $("#facultySelect").val();
		if(majorId==0||majorId==null){
			$("#facultySelect").css("border","1px solid red");
			$("#facultyTip").html("请选择选择院系");
			validateRegion = false;
		}else {
			$("#facultySelect").css("border","1px solid #ccc");
			$("#facultyTip").html("");
			validateRegion = true;
		}
	}
	
}

function toBack(){
	window.location.href='<c:url value="/toActivityList" />';
}

var ajaxValidate = false;
function checkName(activityName){
	if(activityName!=""){
	//--AJAX 判断活动名是否存在 
		$.post("checkActivityName",{"activityName":activityName},function(data){
			if(data=='existed'){
			$("#name").css("border","1px solid red");
	  			$("#nameTip").html('该活动名称已存在');
	  			ajaxValidate = false;
			}else{
				ajaxValidate = true;
			    $("#nameTip").html('');
				$("#name").css("border","1px solid #ccc");
			}
		});
	}
}

function activitySet(){
	activityTypeVal=$("#activityType").val();
	if("report"==activityTypeVal) {
		$("#facultyInfo").hide();
		$("#addressInfo").show();
		$("#busInfo").show();
		$("#mapInfo").show();
	}else {
		$("#facultyInfo").show();
		$("#addressInfo").hide();
		$("#busInfo").hide();
		$("#mapInfo").hide();
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
			   <form id="form1" name="form1" action="addAction" method="post">
			   <input name="status" type="hidden" value="1" />
			    <input id="regionCode" name="regionCode" type="hidden" />
			   <h3>增加活动</h3>
			   <yzwx:MessageArea />
				<table width="100%">
					<tr>
						<th>名称:</th>
						<td><input id="name" type='text' name="name" value="${activity.name}" style="height: 26px;width: 370px;"  onblur="checkName(this.value);"/><span id="nameTip"></span>
						</td>
					</tr>
					<tr>
						<th>活动类型:</th>
						<td>
						<select id="activityType" name="type" style="width: 160px;" onchange="activitySet();">
							<option value="report">科学家报告会</option>
							<option value="camp">夏令营</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>内容:</th>
						<td><!-- <input id="content" type='text' name="content" style="height: 26px;"/> -->
						<textarea name="content" id="content" style="height: 100px;width: 370px;">${activity.content}</textarea><span id="contentTip"></span>
						</td>
					</tr>
					<tr>
						<th>开始时间:</th>
						<td><input id="startTime" type='text' style="height: 26px;" name="startTime" value="<fmt:formatDate value="${activity.startTime}" pattern="yyyy-MM-dd HH:mm"/>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-{%d+1}'})" /><span id="startTimeTip"></span>
						</td>
					</tr>
					<tr>
						<th>结束时间:</th>
						<td><input id="endTime" type="text" style="height: 26px;" name="endTime" value="<fmt:formatDate value="${activity.endTime}" pattern="yyyy-MM-dd HH:mm"/>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-{%d+1}'})"/><span id="endTimeTip"></span>
						</td>
					</tr>
					<tr id="facultyInfo">
						<th>院系：</th>
						<td>
							<select id="facultySelect" name="majorCode">
								<option value="0">——请选择——</option>
								<c:forEach items="${parentMajorList}" var="major">
									<option value="${major.code}">${major.name}</option>
								</c:forEach>
							</select>
							<span id="facultyTip"></span>
						</td>
					</tr>
					<tr id="addressInfo">
						<th>活动地址：</th>
						<td>
						<select id="province_select" onchange="selectFirstCg(this);" style="width: 160px;">
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
						<select id="secCg" name="secCg" onchange="copyCategoryValue(this);" style="display: none;width: 160px;"></select>
						<input id="address" name="address" type='text' style="height: 26px;" value="${activity.address}"/>
						<span id="addressTip"></span>
						
						</td>
					</tr>
					<tr id="busInfo">
						<th>乘车信息：</th>
						<td>
						<div><input name="boardingList[0].boardingInfo" type='text' style="height: 26px;width: 370px" value=""/>&nbsp;&nbsp;<a href="javascript:;" onclick="boardingPlus(this);"><i class="icon-plus"></i></a><span id="boardingTip"></span></div>
						<script type="text/javascript">
						var index = 0;
						function boardingPlus(obj){
							index+=1;
							$(obj).parent().append("<div><input name='boardingList["+index+"].boardingInfo' type='text' style='height: 26px;width: 370px' />&nbsp;&nbsp;<a href='javascript:;' onclick='boardingMinus(this);'><i class='icon-minus'></i></a></div>");
						}
						
						function boardingMinus(obj){
							$(obj).parent().remove();
						}
						</script>
						</td>
					</tr>
					<tr id="mapInfo">
						<th></th>
						<td>
						<div id="r-result"><label style="color: red;display: inline;">* 在下图中右击设置具体的地图位置</label> 地址查询：<input type="text" id="suggestId" style="height: 26px;" size="20" value="百度"  /></div><div id="searchResultPanel" style="display: none"></div>
						<input type="hidden" name="lng" id="lng"/><input type="hidden" name="lat" id="lat"/>
						<div id="container" style="width: 60%;height: 350px"></div>
						
						<script type="text/javascript">
						// 百度地图API功能
						function G(id) {
						    return document.getElementById(id);
						}
						
						var map = new BMap.Map("container");
						map.centerAndZoom("合肥",13);                   // 初始化地图,设置城市和地图级别。
						map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
						map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
						map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
						map.enableScrollWheelZoom();                            //启用滚轮放大缩小

						var contextMenu = new BMap.ContextMenu();
						var txtMenuItem = 
						  {
						   text:'在此添加标注',
						   callback:function(p){
							   	map.clearOverlays();
						    	var marker = new BMap.Marker(p), px = map.pointToPixel(p);
						    	map.addOverlay(marker);
						    	document.getElementById("lng").value=marker.getPosition().lng;
						    	document.getElementById("lat").value=marker.getPosition().lat;
						   }
						  };

						contextMenu.addItem(new BMap.MenuItem(txtMenuItem.text,txtMenuItem.callback,100));
						map.addContextMenu(contextMenu);
						 
						var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
								    {"input" : "suggestId"
								    ,"location" : map
						});

						ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
						var str = "";
						    var _value = e.fromitem.value;
						    var value = "";
						    if (e.fromitem.index > -1) {
						        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
						    }    
						    str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
						    
						    value = "";
						    if (e.toitem.index > -1) {
						        _value = e.toitem.value;
						        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
						    }    
						    str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
						    G("searchResultPanel").innerHTML = str;
						});

						var myValue;
						ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
						var _value = e.item.value;
						    myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
						    G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
						    
						    setPlace();
						});

						function setPlace(){
						    map.clearOverlays();    //清除地图上所有覆盖物
						    document.getElementById("lng").value="";
							document.getElementById("lat").value="";
						    function myFun(){
						        var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
						        map.centerAndZoom(pp, 18);
						        //map.addOverlay(new BMap.Marker(pp));    //添加标注
						    }
						    var local = new BMap.LocalSearch(map, { //智能搜索
						      onSearchComplete: myFun
						    });
						    local.search(myValue);
						}
						</script>
						</td>
					</tr>	
					<tr >
						<th></th>
						<td style="padding-top: 10px"><input type="button" value="保存" onclick="add()"  class="btn" />
						<input type="button" value="取消" name="" class="btn" onclick="javascript:toBack();"/>
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
