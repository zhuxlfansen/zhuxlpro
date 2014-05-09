<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>活动详细报告画面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="This is my page">
<!-- Le styles -->
<link type="text/css" href="<%=path%>/static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="<%=path%>/static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css" href="<%=path%>/static/commonCss/common.css" rel="stylesheet">


<script type="text/javascript" src="<%=path%>/static/commonJs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/commonJs/bootstrap.min.js"></script>
<style type="text/css">
.conDIV{border-radius: 3px;width:99%; border:1px solid #EEEEEE;padding:10px;margin-bottom: 20px}
h4{color: #0088CC}
a:focus {
  outline:none;
  -moz-outline:none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	 $("#ul_li  li").each(function() {
		 $(this).removeClass("active");
	    }); 
	 $("#reportPartakeChart").addClass("active");
	}); 
function saveImg(type){
	var imgObj;
	if(type=="chart1"){
		imgObj = myChart1.getImage("png");
	}else if(type=="chart2"){
		imgObj = myChart2.getImage("png");
	}else if(type=="chart3"){
		imgObj = myChart3.getImage("png");
	}
	
	$("#imgDIV").html("<img src='"+imgObj.src+"' />");
}
</script>
</head>

<body>
	<input type="hidden" id="path" value="<%=path%>"/>
	<!-- top -->
	<%@include file="../header.jsp"%>
	<!-- .top -->
	<div class="container-fluid">
		<div class="row-fluid">
			<%@include file="../navigation.jsp"%>
			<!-- right -->
			<div class="span9">
			
			<!--检索区-->
			<div class="hero-unit">
				<table width="100%">
					<tr>
						<td colspan="2">
							<form id="form2" name="form2" class="form-inline">
							<label>请选择活动年份：</label>
							<select id="yearSel" style="width: 100px" onchange="yearChange(this);">
								<c:choose>
								   	<c:when test="${fn:length(yearList)>0}">
									   	<c:forEach items="${yearList}" var="year">
										<option value="${year}">-${year}年-</option>
										</c:forEach>
									</c:when>
								   	<c:otherwise><option value="-1">-暂无记录-</option></c:otherwise>
								</c:choose>
							</select>
							</form>								
						</td>
					</tr>
				</table>
			</div>
			<script type="text/javascript">
			function yearChange(obj){
				$.post("${pageContext.servletContext.contextPath}/prchart/getReportListByYear",{year:obj.value},function(data,status){
					if(status=="success"){
						var li="<li class='active'><a href='javascript:;' id='-1' onclick='reportTabClick(this);'>总览</a></li>";
						$.each(data,function(i,v){
							li+="<li><a href='javascript:;' onclick='reportTabClick(this);' id='"+v.id+"'>"+v.name+"</a></li>";
						});
						$("#reportUL").html(li);
						if(data.length!=0){
							//清除按钮组样式
							$("#chartTypeBtnGroup button").attr("class", "btn");
							$("#studentMajor").attr("class", "btn btn-info");
							$("#btnGroup").html("");
							//重置考生统计页面
							myChart1.clear;
							myChart1.dispose;
							myChart2.clear;
							myChart2.dispose;
							drawPieChart("<c:url value='/prchart/studentMajor' />",$("#tabType").val(),obj.value);
							drawLineChart();
						}else{
							alert("没有数据！");
						}
					}else{
						alert("操作失败");
					}
				});
			}
			</script>
			<!--.检索区-->
			
			<!--活动tab-->
			<input type="hidden" id="tabType" value="-1"/>
			<ul id="reportUL" class="nav nav-tabs">
				<li class="active"><a href="javascript:;" id="-1" onclick="reportTabClick(this);">总览</a></li>
				<c:if test="${reportList!=null }">
				<c:forEach items="${reportList }" var="report">
					<li><a href="javascript:;" onclick="reportTabClick(this);" id="${report.id }">${report.name }</a></li>
				</c:forEach>
				</c:if>
			</ul>
			<script type="text/javascript">
			Date.prototype.format = function(format){ 
				var o = { 
					"M+" : this.getMonth()+1, //month 
					"d+" : this.getDate(), //day 
					"h+" : this.getHours(), //hour 
					"m+" : this.getMinutes(), //minute 
					"s+" : this.getSeconds(), //second 
					"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
					"S" : this.getMilliseconds() //millisecond 
				};
				if(/(y+)/.test(format)) { 
					format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
				} 
				for(var k in o) { 
					if(new RegExp("("+ k +")").test(format)) { 
						format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
					} 
				} 
				return format; 
			};

			function reportTabClick(obj){
				
				if(obj.id!=-1){
					//隐藏满意度图标板块
					$("#satisInfo").css("display","none"); 
					$("#satisInfo").html("");
					//加载活动的基本信息板块
					$.post("${pageContext.servletContext.contextPath}/prchart/getReportInfo",{activityId:obj.id},function(data,status){
						if(status=="success"){
							var start=new Date();
							start.setTime(data.startTime);
							var end=new Date();
							end.setTime(data.endTime);
							var htm="<div class='page-header' style='margin: 0 0 10px 0'><h4>基本信息 </h4></div>"
								+"<p ><strong>活动简介：</strong>"+data.content+"</p>"
								+"<p><strong>地址：</strong>"+data.address+"</p>"
								+"<p><strong>时间：</strong>"+start.format('yyyy-MM-dd hh:mm')+" / "+end.format('yyyy-MM-dd hh:mm')+"</p>";
							if(data.boarding.length>0){
								htm+="<p><strong>乘车路线：</strong><br/>";
								$.each(data.boarding,function(i,o){
									htm+=o.boardingInfo+"  (已报名"+o.totalStu+"人)<br/>";
								});
							}
							htm+="<button class='btn btn-success' type='button' onclick=\"window.location.href='"+$("#path").val()+"/createExcel?activityId="+$("#tabType").val()+"'\">导出学生列表</button>";
							$("#reportInfo").css("display","block"); 
							$("#reportInfo").html(htm);
						}else{
							alert("操作失败");
						}
					});
					//加载满意度列表板块
					$.post("${pageContext.servletContext.contextPath}/prchart/suggestionList",{activityId:obj.id},function(data,status){
						if(status=="success"){
							var htm="<div class='page-header' style='margin: 0 0 10px 0'><h4>满意度统计</h4></div>"
							if(data.satisList.length>0){
								htm+="<div style='height:75%;width:20%;padding:10px;float: left;border-right:1px solid #EEEEEE '>"
									+"<table width='100%'>"
									+"<tr><td width='90px'><strong>反馈人数：</strong></td>"
									+"<td valign='middle'>"+data.satisMap.sum+"人</td></tr>"
									+"<tr><td width='90px'><strong>活动组织：</strong></td>"
									+"<td valign='middle'>"
									+"<div style='margin: 0' class='progress progress-info'><div class='bar' style='width: "+(data.satisMap.satisZZ*20)+"%'>"+Math.round(data.satisMap.satisZZ*100)/100+"分</div></div>"
									+"</td></tr>"
									+"<tr><td width='90px'><strong>报告会内容：</strong></td>"
									+"<td valign='middle'>"
									+"<div style='margin: 0' class='progress progress-success'><div class='bar' style='width: "+(data.satisMap.satisNR*20)+"%'>"+Math.round(data.satisMap.satisNR*100)/100+"分</div></div>"
									+"</td></tr>"
									+"<tr><td width='90px'><strong>咨询解答：</strong></td>"
									+"<td valign='middle'>"
									+"<div style='margin: 0' class='progress progress-warning'><div class='bar' style='width: "+(data.satisMap.satisJD*20)+"%'>"+Math.round(data.satisMap.satisJD*100)/100+"分</div></div>"
									+"</td></tr>"
									+"</table>"	
									+"</div>"
									+"<div id='main2' style='width:75%;max-height:400px;padding:10px;overflow:auto;float: left'>"
									+"<table class='table'>"
									+"<thead>"
									+"<tr><th>南京站活动评论列表</th></tr>"
									+"</thead>";
									$.each(data.satisList,function(i,n){
										htm+="<tr>"
											+"<td width='5%'><span class='label label-info'>"+n.studentName+"/"+n.schoolName+"/"+n.majorName+"</span></td>"
											+"<td><p>"+n.suggestion+"</p></td>"
											+"</tr>";
									})
									htm+="</table></div>";
							}else{
								htm+="暂无数据！";
							}
							$("#satisForReport").css("display","block"); 
							$("#satisForReport").html(htm);
						}else{
							alert("操作失败");
						}
					});
				}else{
					//总览下隐藏基本信息
					$("#reportInfo").css("display","none"); 
					$("#reportInfo").html("");
					//总览下隐藏评论列表
					$("#satisForReport").css("display","none"); 
					$("#satisForReport").html("");
					
					//总览下满意度表
					var htm="<div class='page-header' style='margin: 0 0 10px 0'><h4>基本信息</h4></div>"
						+"<label style='margin-top: 15px;color: red;' id='fkSum'></label>"
						+"<div id='m3' style='height:500px;width:100%;padding:10px;'></div>";
					$("#satisInfo").css("display","block"); 
					$("#satisInfo").html(htm);
					drawLineChart();
				}
				
				
				//tab样式改变
				$("#reportUL li").removeClass();
				$(obj).parent().addClass("active");
				$("#tabType").val(obj.id);
				//清除按钮组样式
				$("#chartTypeBtnGroup button").attr("class", "btn");
				$("#studentMajor").attr("class", "btn btn-info");
				$("#btnGroup").html("");
				//重置考生统计页面
				myChart1.clear;
				myChart1.dispose;
				myChart2.clear;
				myChart2.dispose;
				drawPieChart("<c:url value='/prchart/studentMajor' />",obj.id,$("#yearSel").val());
			}
			</script>
		    <!--.活动tab-->
		    
		    <!--基本信息-->
		   	<div class="conDIV" id="reportInfo" style="display:none">
		    </div>
		    <!--.基本信息-->
		    
		    
		    <!--考生分布统计-->
		    <div class="conDIV">
			    <div class="page-header" style="margin: 0 0 10px 0">
			    	<h4 >考生分布统计</h4>
			    </div>
			   
			    <div class="btn-group " id="chartTypeBtnGroup">
					<button class="btn btn-info" onclick="buttonClick(this);" id="studentMajor">拟报考专业分布</button>
					<button class="btn" onclick="buttonClick(this);" id="studentSchool">学校分布</button>
					<button class="btn" onclick="buttonClick(this);" id="studentGPA">成绩分布</button>
					<button class="btn" onclick="buttonClick(this);" id="schoolArea">地域分布</button>
					<input type="hidden" id="chartType" value="studentMajor"/>
				</div>
				<div class="btn-group " id="btnGroup">
				</div>
				<script type="text/javascript">
				function buttonClick(obj) {
					if(obj.id=="studentGPA"){
						$("#btnGroup").html("<button class='btn btn-info' onclick='scoreButtonClick(this);' id='gpa'>按加权平均成绩统计</button>"+
								"<button class='btn' onclick='scoreButtonClick(this);' id='rank'>按班级成绩排名统计</button>");
					}else{
						$("#btnGroup").html("");
					}
					$("#chartTypeBtnGroup button").attr("class", "btn");
					$(obj).attr("class", "btn btn-info");
					//重置考生统计页面
					myChart1.clear;
					myChart1.dispose;
					myChart2.clear;
					myChart2.dispose;
					$("#chartType").val(obj.id);
					drawPieChart("<%=path%>/prchart/"+obj.id,$("#tabType").val(),$("#yearSel").val());
				}
				
				function scoreButtonClick(obj){
					$("#btnGroup button").attr("class", "btn");
					$(obj).attr("class", "btn btn-info");
					var chartType=obj.id=="gpa"?"studentGPA":"studentRank";
					myChart1.clear;
					myChart1.dispose;
					myChart2.clear;
					myChart2.dispose;
					$("#chartType").val(chartType);
					drawPieChart("<%=path%>/prchart/"+chartType,$("#tabType").val(),$("#yearSel").val());
				}

				</script>
				<label style="margin-top: 15px;color: red;" id="bmSum"></label>
				<div id="m1" style="height:500px;padding:10px;"></div>
				<label style="margin-top: 15px;color: red;" id="qdSum"></label>
				<div id="m2" style="height:500px;padding:10px;"></div>
				<!-- <table width="100%"> 
				<tr>
					<td width="50%">
						
					</td>
					<td width="50%">
						
					</td>
				</tr>
				</table> -->
			    <script src="<%=path%>/static/commonJs/echarts-plain.js"></script>
				<script type="text/javascript">
				var myChart1,mychart2;
				function drawPieChart(url,activityId,year) {
					myChart1 = echarts.init(document.getElementById('m1'));
					myChart2 = echarts.init(document.getElementById('m2'));
					$.ajax({
						url : url,
						type : 'POST',
						data : {'activityId':activityId,'type':null,'year':year},
						dataType : 'json',
						cache : false,
						success : function(results) {
							var arr = eval(results);
							if(arr.length>0){
								var title = new Array();
								var obj;
								var jsonArr = new Array();
								var sum=0;
								$.each(arr, function(i, n) {
									if(n.value>0){
										title.push(n.name);
										obj = {"name" : n.name,"value" : n.value};
										jsonArr.push(obj);
										if(n.stuCount){
											sum=n.stuCount;
										}else{
											sum+=n.value;
										}
									}
								});
								
								
								$("#bmSum").html("反馈人数（报名）："+sum+"&nbsp;&nbsp;&nbsp;<button class='btn btn-warning' onclick='saveImg(\"chart1\");' data-toggle='modal' data-target='#myModal'>生成图片</button>");
								myChart1.showLoading({text:"正在加载，请稍候..."});
								myChart1.setOption({
									title : {text: '考生报名统计',x:'center'},
								    tooltip : {trigger: 'item',formatter: "{a} <br/>{b} : {c} ({d}%)"},
								    legend: {orient : 'vertical',x : 'left',data:title},
								    series : [{name:'详情',type:'pie',radius : '55%',center: ['50%', 225],
								    	itemStyle : {
							                normal : {
							                    label : {
							                        position : 'outer',
							                        formatter : function(a,b,c,d) {return b+c+'人'+d + '%'},
							                    },
							                    labelLine : {
							                        show : true
							                    }
							                }
							            },
								    	data:jsonArr}]
								});
							}else {
								$("#bmSum").html("反馈人数（报名）：0");
								$("#m1").html("暂无数据！");
							}
							
							
						}

					});
					$.ajax({
						url : url,
						type : 'POST',
						data : {'activityId':activityId,'type':'signed','year':year},
						dataType : 'json',
						cache : false,
						success : function(results) {
							var arr = eval(results);
							if(arr.length>0){
								var title = new Array();
								var obj;
								var jsonArr = new Array();
								var sum=0;
								$.each(arr, function(i, n) {
									if(n.value>0){
										title.push(n.name);
										obj = {"name" : n.name,"value" : n.value};
										jsonArr.push(obj);
										if(n.stuCount==undefined){
											sum+=n.value;
										}else{
											sum=n.stuCount;
										}
									}
								});
								
								$("#qdSum").html("反馈人数（签到）："+sum+"&nbsp;&nbsp;&nbsp;<button class='btn btn-warning' onclick='saveImg(\"chart2\");' data-toggle='modal' data-target='#myModal'>生成图片</button>");
								myChart2.showLoading({text:"正在加载，请稍候..."});
								myChart2.setOption({
									title : {text: '考生签到统计',x:'center'},
								    tooltip : {trigger: 'item',formatter: "{a} <br/>{b} : {c} ({d}%)"},
								    legend: {orient : 'vertical',x : 'left',data:title},
								    series : [{name:'title',type:'pie',radius : '55%',center: ['50%', 225],
								    	itemStyle : {
							                normal : {
							                    label : {
							                        position : 'outer',
							                        formatter : function(a,b,c,d) {return b+c+'人'+d + '%'},
							                    },
							                    labelLine : {
							                        show : true
							                    }
							                }
							            },
								    	data:jsonArr}]
								});
							}else{
								$("#qdSum").html("反馈人数（签到）：0");
								$("#m2").html("暂无数据！");
							}
							
						}

					});
				}
				drawPieChart("<c:url value='/prchart/studentMajor' />",$("#tabType").val(),$("#yearSel").val());
				</script>
		    </div>
		    <!--.考生分布统计-->
		    
		    
		    <!--满意度统计1-->
		    <div style="height:500px;display:none" class="conDIV" id="satisForReport">
		    </div>
		    <!--.满意度统计1-->
		    
		    <!--满意度统计2-->
		    <div class="conDIV" id="satisInfo" >
			    <div class="page-header" style="margin: 0 0 10px 0">
				<h4 >满意度统计</h4>
				</div>
				<label style="margin-top: 15px;color: red;" id="fkSum"></label>
		    	<div id="m3" style="height:500px;width:100%;padding:10px;"></div>
		    	<script type="text/javascript">
				var myChart3;
				
				function drawLineChart(){
					myChart3 = echarts.init(document.getElementById('m3'));
					$.ajax({
						url : "<%=path%>/prchart/satisfaction",
						type : 'POST',
						data : {'year':$("#yearSel").val()},
						dataType : 'json',
						cache : false,
						success : function(results) {
							
							$("#fkSum").html("反馈人数："+results.sum+"&nbsp;&nbsp;&nbsp;<button class='btn btn-warning' onclick='saveImg(\"chart3\");' data-toggle='modal' data-target='#myModal'>生成图片</button>");
							if(results.satisZZList.length>0||results.satisNRList.length>0||results.satisJDList.length>0){
								var title = new Array();
								var obj;
								var jsonArrZZ = new Array();
								var jsonArrNR = new Array();
								var jsonArrJD = new Array();
								$.each(results.satisZZList, function(i, n) {
									title.push(n.name);
									obj = {"name" : n.name,"value" : n.value};
									jsonArrZZ.push(obj);
								});
								$.each(results.satisNRList, function(i, n) {
									obj = {"name" : n.name,"value" : n.value};
									jsonArrNR.push(obj);
								});
								$.each(results.satisJDList, function(i, n) {
									obj = {"name" : n.name,"value" : n.value};
									jsonArrJD.push(obj);
								});
								
								myChart3.showLoading({text:"正在加载，请稍候..."});
								myChart3.setOption({
									tooltip : {trigger: 'axis'},
								    legend: {data:['活动组织','报告会内容','咨询解答']},
								    dataZoom : {show : true,realtime : true,start : 0,end : 100},
								    xAxis : [
								        {
								            type : 'category',
								            boundaryGap : false,
								            data : title
								        }
								    ],
								    yAxis : [{type : 'value',splitArea : {show : true}}],
								    series : [
								        {name:'活动组织',type:'line',data:jsonArrZZ},
								        {name:'报告会内容',type:'line',data:jsonArrNR},
								        {name:'咨询解答',type:'line',data:jsonArrJD}
								    ]
								});
							}else{
								$("#fkSum").html("反馈人数：0");
								$("#m3").html("暂无数据！");
							}
						}

					});
				}
				drawLineChart();
				</script>
		    </div>
		    <!--.满意度统计2-->
		    
			</div>
			<!-- .right -->
		</div>
		<!--/row-->
		<hr>
	</div>
	<!-- Modal -->
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1000px">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h4 id="myModalLabel">右击保存图片</h4>
		  </div>
		  <div class="modal-body" id="imgDIV">
		  </div>
		</div>
	<%@include file="../footer.jsp"%>
</body>
</body>
</html>
				