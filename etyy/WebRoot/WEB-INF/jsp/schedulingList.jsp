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
		 table {
		 	width:99%;
            border: 1px solid #B1CDE3 ;  
            border-collapse: collapse;  
        }  

        td {  
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
        th {  
            border: 1px solid #B1CDE3 ;  
            background: #CCCCCC ;  
            font-size:12px;  
            padding: 3px 3px 3px 8px;  
            color: #4f6b72;  
        }  
	</style>
	<script type="text/javascript">
	function pKSChange(obj){
		if(obj.value!=""){
			$.ajax({
				url : $("#path").val()+"/work/queryChildKSByPID",
				type : 'POST',
				data : {'pId':obj.value},
				dataType : 'json',
				cache : false,
				success : function(r) {
					var arr = eval(r);
					var option="<option value=''>--请选择二级科室--</option>";
					$.each(arr, function(i, n) {
						option+="<option value='"+n.cId+"'>"+n.cName+"</option>";
					});
					$("#cks").html(option);
				}
			})
		}else{
			$("#cks").html("<option value='-1'>--全部二级科室--</option>");
		}
	}
	
	function queryExpert(){
		var ksId=$("#cks").val();
		if(ksId!=""){
			$.ajax({
				url : $("#path").val()+"/work/queryExpertByKSID",
				type : 'POST',
				data : {'ksId':ksId},
				dataType : 'json',
				cache : false,
				success : function(r) {
					var arr = eval(r);
					if(arr.length>0){
						var tr="<table id='dg' ><thead><tr><th  >姓名</th><th >科室</th><th >周一<br/>上午</th><th >周一<br/>下午</th><th >周二<br/>上午</th><th >周二<br/>下午</th><th >周三<br/>上午</th><th >周三<br/>下午</th>"+
						"<th >周四<br/>上午</th><th >周四<br/>下午</th><th >周五<br/>上午</th><th >周五<br/>下午</th><th >周六<br/>上午</th><th >周六<br/>下午</th><th >周日<br/>上午</th><th >周日<br/>下午</th></tr></thead><tbody>";
						$.each(arr, function(i, n) {
							tr+="<tr><td >"+n.eName+"</td><td >"+n.ksName+"</td><td id='"+n.eId+"10' class='cc' onclick='toScheduling(this,"+n.eId+",1,0);' >"+n.s10+"</td><td id='"+n.eId+"11' class='cc' onclick='toScheduling(this,"+n.eId+",1,1);'>"+n.s11+"</td>"+
							"<td class='cc' id='"+n.eId+"20' onclick='toScheduling(this,"+n.eId+",2,0);' >"+n.s20+"</td><td id='"+n.eId+"21' class='cc' onclick='toScheduling(this,"+n.eId+",2,1);'>"+n.s21+"</td>"+
							"<td class='cc' id='"+n.eId+"30' onclick='toScheduling(this,"+n.eId+",3,0);' >"+n.s30+"</td><td id='"+n.eId+"31' class='cc' onclick='toScheduling(this,"+n.eId+",3,1);'>"+n.s31+"</td>"+
							"<td class='cc' id='"+n.eId+"40' onclick='toScheduling(this,"+n.eId+",4,0);' >"+n.s40+"</td><td id='"+n.eId+"41' class='cc' onclick='toScheduling(this,"+n.eId+",4,1);'>"+n.s41+"</td>"+
							"<td class='cc' id='"+n.eId+"50' onclick='toScheduling(this,"+n.eId+",5,0);' >"+n.s50+"</td><td id='"+n.eId+"51' class='cc' onclick='toScheduling(this,"+n.eId+",5,1);'>"+n.s51+"</td>"+
							"<td class='cc' id='"+n.eId+"60' onclick='toScheduling(this,"+n.eId+",6,0);' >"+n.s60+"</td><td id='"+n.eId+"61' class='cc' onclick='toScheduling(this,"+n.eId+",6,1);'>"+n.s61+"</td>"+
							"<td class='cc' id='"+n.eId+"70' onclick='toScheduling(this,"+n.eId+",7,0);' >"+n.s70+"</td><td id='"+n.eId+"71' class='cc' onclick='toScheduling(this,"+n.eId+",7,1);'>"+n.s71+"</td></tr>";
						});
						$("#mainDIV").html(tr+"</tbody></table>");
					}else{
						$("#mainDIV").html("暂无数据！");
					}
				
				}
			})
		}else{
			alert("请选择二级科室！");
		}
	}
	
	function pMZChange(obj){
		if(obj.value!=""){
			$.ajax({
				url : $("#path").val()+"/work/queryChildMZByPID",
				type : 'POST',
				data : {'pId':obj.value},
				dataType : 'json',
				cache : false,
				success : function(r) {
					var arr = eval(r);
					var option="<option value=''>--请选择二级门诊--</option>";
					$.each(arr, function(i, n) {
						option+="<option value='"+n.mzId+"'>"+n.mzName+"</option>";
					});
					$("#cmz").html(option);
				}
			})
		}
	}
	
	function toScheduling(obj,eId,week,apm){
		$(obj).css("background","#CCFFFF");
		$("#eId").val(eId);
		$("#week").val(week);
		$("#apm").val(apm);
		$('#dlg').dialog('open');
	}
	
	function doScheduling(){
		if($('#cmz').val()!=''){
			var eId=$("#eId").val();
			var week=$("#week").val();
			var apm=$("#apm").val();
			var mzId=$("#cmz").val();
			$.ajax({
				url : $('#path').val()+'/work/doScheduling',
				type : 'POST',
				data : {"eId":eId,"week":week,"apm":apm,"mzId":mzId},
				dataType : 'json',
				cache : false,
				success : function(r) {
					if(r==null){
						alert("设置失败！");
					}else{
						//alert("设置成功！");
						$("#"+eId+week+apm).css("background","#fff");
						$("#"+eId+week+apm).html(r.pmzName+"<br/>（"+r.mzName+"）");
						$('#dlg').dialog('close');
					}
				}
			});
		}else{
			alert('请选择二级门诊！');
		}
	}
	
	function delScheduling(){
		var eId=$("#eId").val();
		var week=$("#week").val();
		var apm=$("#apm").val();
		var html=$("#"+eId+week+apm).html();
		if(html==""){
			alert("无可删除项！");
		}else{
			$.ajax({
				url : $('#path').val()+'/work/delScheduling',
				type : 'POST',
				data : {"eId":eId,"week":week,"apm":apm},
				dataType : 'json',
				cache : false,
				success : function(r) {
					if(r=="success"){
						alert("删除成功！");
						$("#"+eId+week+apm).css("background","#fff");
						$("#"+eId+week+apm).html("");
						$('#dlg').dialog('close');
					}else{
						alert("删除失败！");
					}
				}
			});
		}
	}
	
	function cancel(){
		var eId=$("#eId").val();
		var week=$("#week").val();
		var apm=$("#apm").val();
		var html=$("#"+eId+week+apm).html();
		$("#"+eId+week+apm).css("background","#fff");
		$('#dlg').dialog('close');
	}
	</script>
</head>
<body style="margin:0px;padding:1px;">
<input type="hidden" id="path" value="<%=path%>"/>
	<div id="dlg" class="easyui-dialog" title="排班门诊"  style="width:400px;height:150px;padding:10px"
			data-options="
				modal:true,
				iconCls: 'icon-save',
				closed: true,
				buttons: [{
					text:'确认',
					iconCls:'icon-ok',
					handler:function(){
						doScheduling();
					}
				},{
					text:'删除当前排班',
					iconCls:'icon-no',
					handler:function(){
						delScheduling();
					}
				},{
					text:'取消',
					handler:function(){
						cancel();
					}
				}]
			">
			<form action="" name="form1" id="form1">
				<select onchange="pMZChange(this);" id="pmz" >
					<option value="">--请选择一级门诊--</option>
					<c:forEach items="${pmzList }" var="pmz">
						<option value="${pmz.mzId }" >${pmz.mzName }</option>
					</c:forEach>
				</select>
				<select  id="cmz" >
					<option value="">--请选择二级门诊--</option>
				</select>
				<input type="hidden" id="eId" />
				<input type="hidden" id="week" />
				<input type="hidden" id="apm" />
			</form>
	</div>
	<div id="tb" style="padding-top:10px;padding-left:5px;height:auto">
		<div>
			<select onchange="pKSChange(this);" id="pks">
				<option value="">--请选择一级科室--</option>
				<c:forEach items="${pList }" var="pks">
					<option value="${pks.pId }" >${pks.pName }</option>
				</c:forEach>
			</select>
			<select  id="cks" onchange="">
				<option value="">--请选择二级科室--</option>
			</select>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryExpert();">查询</a>
		</div>
	</div>
	<div id="mainDIV" style="padding-top:10px;padding-left:5px;height:auto">
	<table id="dg" >
		<thead>
			<tr>
				<th style="width: 65px">姓名</th>
				<th >科室</th>
				<th >周一<br/>上午</th>
				<th >周一<br/>下午</th>
				<th >周二<br/>上午</th>
				<th >周二<br/>下午</th>
				<th >周三<br/>上午</th>
				<th >周三<br/>下午</th>
				<th >周四<br/>上午</th>
				<th >周四<br/>下午</th>
				<th >周五<br/>上午</th>
				<th >周五<br/>下午</th>
				<th >周六<br/>上午</th>
				<th >周六<br/>下午</th>
				<th >周日<br/>上午</th>
				<th >周日<br/>下午</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${eList }" var="e">
			<tr>
				<td >${e.eName }</td>
				<td >${e.ksName }</td>
				<td class="cc" id="${e.eId }10" onclick="toScheduling(this,${e.eId },1,0);" >${e.s10 }</td>
				<td class="cc" id="${e.eId }11" onclick="toScheduling(this,${e.eId },1,1);" >${e.s11 }</td>
				<td class="cc" id="${e.eId }20" onclick="toScheduling(this,${e.eId },2,0);" >${e.s20 }</td>
				<td class="cc" id="${e.eId }21" onclick="toScheduling(this,${e.eId },2,1);" >${e.s21 }</td>
				<td class="cc" id="${e.eId }30" onclick="toScheduling(this,${e.eId },3,0);" >${e.s30 }</td>
				<td class="cc" id="${e.eId }31" onclick="toScheduling(this,${e.eId },3,1);" >${e.s31 }</td>
				<td class="cc" id="${e.eId }40" onclick="toScheduling(this,${e.eId },4,0);" >${e.s40 }</td>
				<td class="cc" id="${e.eId }41" onclick="toScheduling(this,${e.eId },4,1);" >${e.s41 }</td>
				<td class="cc" id="${e.eId }50" onclick="toScheduling(this,${e.eId },5,0);" >${e.s50 }</td>
				<td class="cc" id="${e.eId }51" onclick="toScheduling(this,${e.eId },5,1);" >${e.s51 }</td>
				<td class="cc" id="${e.eId }60" onclick="toScheduling(this,${e.eId },6,0);" >${e.s60 }</td>
				<td class="cc" id="${e.eId }61" onclick="toScheduling(this,${e.eId },6,1);" >${e.s61 }</td>
				<td class="cc" id="${e.eId }70" onclick="toScheduling(this,${e.eId },7,0);" >${e.s70 }</td>
				<td class="cc" id="${e.eId }71" onclick="toScheduling(this,${e.eId },7,1);" >${e.s71 }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>

</html>


			  	