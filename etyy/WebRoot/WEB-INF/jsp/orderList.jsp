<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>主界面</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/commonJS/je/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/commonJS/je/css/icon.css">
	<script type="text/javascript" src="<%=path %>/static/commonJS/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/commonJS/je/js/jquery.easyui.min.js"></script>
	<style type="text/css">
		 .talbe {
		 	width:99%;
            border: 1px solid #B1CDE3 ;  
            border-collapse: collapse;  
        }  

        .talbe td {  
            border: 1px dashed  #CCCCCC ;  
            background: #fff ;  
            font-size:12px;  
            padding: 3px 3px 3px 8px;  
            text-align:center;
        } 
        .cc{
        	/* background: #CCFFFF ; */
        	cursor: pointer;
        	color: #669966; 
        }
        .talbe th {  
            border: 1px solid #B1CDE3 ;  
            background: #CCCCCC ;  
            font-size:12px;  
            padding: 3px 3px 3px 8px;  
            color: #4f6b72;  
        }  
	</style>
	<script type="text/javascript">
	function goPage(pageNum){
		var arg =	$("#arg").val();
		var data = "";
		data = "pageIndex2="+pageNum;
		if(arg != ""){
			data = data + "&arg="+arg;
		}
		window.location.href = "${pageContext.servletContext.contextPath}/work/queryOrderList?"+data;
		//window.location.href = "${pageContext.servletContext.contextPath}/work/queryOrderList?pageIndex2="+pageNum;
	} 
	 
	 
	 //跳转到多少页
	 function goPageNum(pageCount){
		var arg =	$("#arg").val();
		if(pageNum > pageCount || pageNum == 0){
			alert('请输入正确的页码数！');
		}else{
			var data = "";
			data = "pageIndex2="+pageNum;
			if(arg != ""){
				data = data + "&arg="+arg;
			}
			window.location.href = "${pageContext.servletContext.contextPath}/work/queryOrderList?"+data;
		}
	 }
	 
	 function submitForm(){
		 $("#form1").submit();
	 }
	</script>
</head>
<body style="margin:0px;padding:1px;">
	<input type="hidden" id="path" value="<%=path%>"/>
	<div id="tb" style="padding-top:10px;padding-left:5px;height:auto">
		<form action="<%=path %>/work/queryOrderList" id="form1" name="form1" class="form-horizontal" method="post">
		<div>
			<input type="text" name="arg" id="arg" value="${arg }"/>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="submitForm();">查询</a>
		</div>
		</form>
	</div>
	<div id="mainDIV" style="padding-top:10px;padding-left:5px;height:auto">
	<table id="dg" class="talbe">
		<thead>
			<tr>
				<th style="width: 100px">患者姓名</th>
				<th >年龄</th>
				<th >性别</th>
				<th >身份证号</th>
				<th >联系电话</th>
				<th >预约诊室</th>
				<th >病情描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.datas }" var="e">
			<tr>
				<td >${e.pName }</td>
				<td >${e.pAge }</td>
				<td >
					<c:choose>
						<c:when test="${e.pGender==0 }">男</c:when>
						<c:when test="${e.pGender==1 }">女</c:when>
						<c:otherwise>--</c:otherwise>
					</c:choose>
				</td>
				<td >${e.cardNum }</td>
				<td >${e.tel }/${e.phone }</td>
				<td >${e.mzName }</td>
				<td >${e.remark }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<table width="500" border="0" cellpadding="0" cellspacing="0" align="right" style="margin-top: 10px;font-size: 12px">
				<tr>
					<td width="60" height="26">
						<div>
							<c:choose>
								<c:when test="${page.pageIndex>1}">
									<a href="javascript:void(0);" onclick="goPage(${page.pageIndex-1})">上一页 </a>
								</c:when>
								<c:otherwise>上一页</c:otherwise>
							</c:choose>
						</div>
					</td>
					<td width="60">
						<div align="left">
							<c:choose>
								<c:when test="${page.pageIndex<page.pageCount}">
									<a href="javascript:void(0);" onclick="goPage(${page.pageIndex+1})">下一页 </a>
								</c:when>
								<c:otherwise>下一页</c:otherwise>
							</c:choose>
						</div>
					</td>
					<td width="150" align="center">共${page.pageCount}页 当前第${page.pageIndex}页 </td>
					<td width="38">到第</td>
					<td width="35"><input type="text" style="border: #dbdbdb solid 1px; width: 30px; height: 18px;"
												id="pageNum" onkeyup="value=value.replace(/[^\d]/g,'')"
												onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" /></td>
					<td width="19" class="wordblue">页</td>
					<td width="43">
						<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="goPageNum(${page.pageCount});">GO</a>
					</td>
					</td>
				</tr>
			</table>
	</div>
</body>

</html>


			  	