<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>研招活动详情</title>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->
<link href="<%=path %>/static/commonCss/bootstrap-3.min.css" rel="stylesheet">
<script src="<%=path %>/static/commonJs/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/commonJs/bootstrap.min.js"></script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
<style type="text/css">  
.taskBoxLinks { float:left; width:200px; height:15px; font-size:0; line-height:0; background:#f2f2f2; border:1px solid #dedede;-moz-border-radius:6px;-webkit-border-radius:6px;border-radius:6px; position:relative;margin-right:10px; cursor:pointer;}  
.taskBoxLinks h3,.taskBoxLinks h4{ margin-top:0px;position:absolute; left:-1px; top:-1px; height:15px; font-size:0; line-height:20px; background:#a3d9f4; border:1px solid #187aab; -moz-border-radius:6px;-webkit-border-radius:6px;border-radius:6px; z-index:99;}  
.taskBoxLinks h4 { margin-top:0px;border:1px solid #91cdea; background:#f5fafc; z-index:88;}  
.taskBox { width:360px;  color:#666;}  
</style> 
<script type="text/javascript">
	$(document).ready( function() {  
	    $('.taskBox').delegate('.taskBoxLinks','mousemove',function(e){       
	        var $mouse = e.pageX - $(this).offset().left;  
	        var $span = Math.round($mouse/20);       
	        $(this).find('h4').stop().animate({width:$span*10+'%'},50);          
	        $(this).next('span').text($span/2);  
	    }).delegate('.taskBoxLinks','mouseleave',function(){  
	        $(this).find('h4').stop().animate({width:'10%'},50);  
	        var $mousex = $(this).find('h3').width();  
	        var $spanx = Math.round($mousex/20);  
	        $(this).next('span').text($spanx/2);    
	    }).delegate('.taskBoxLinks','click',function(e){  
	        var $mouse = e.pageX - $(this).offset().left;  
	        var $span = Math.round($mouse/20);  
	        $(this).find('h3').stop().animate({width:$span*10+'%'},100);
	        $("#satisZZ").val($("#satisZZscore").html());
	        $("#satisNR").val($("#satisNRscore").html());
	        $("#satisJD").val($("#satisJDscore").html());
	    });       
	});  
	function checkForm(url) {
		if($("#satisZZ").val()==0||$("#satisNR").val()==0||$("#satisJD").val()==0){
			alert("请评分后提交！");
		}else{
			$.ajax({
				url : $("#path").val()+"/mob/insertComment",
				type : 'POST',
				data : {
					'studentId':$("#studentId").val(),
					'activityId':$("#activityId").val(),
					'satisZZ':$("#satisZZ").val(),
					'satisNR':$("#satisNR").val(),
					'satisJD':$("#satisJD").val(),
					'suggestion':$("#suggestion").val()
				},
				dataType : 'json',
				cache : false,
				success : function(result) {
					if(result=="success"){
					}else{
						alert("提交失败！");
					}
					window.location.reload(); 
				}
			});
		}
	}
	
	// 分享
	var activityName = "${activity.name }";
    var activityContent = "${activity.content }";
    var activityId = "${activityId }";
	function shareFriend() {
	    WeixinJSBridge.invoke('sendAppMessage',{
						    	"appid"      : "wx794f444fa5c9e2ba",
					            "img_url"    : $("#path").val()+"/static/commonImg/logo_.jpg",
					            "img_width"  : "640",
					            "img_height" : "640",
					            "link"       : $("#path").val()+"/mob/toActivityDetail?id="+activityId,
					            "desc"       : activityContent,
					            "title"      : activityName
	                            }, function(res) {
	                            _report('send_msg', res.err_msg);
	                            });
	}
	function shareTimeline() {
	    WeixinJSBridge.invoke('shareTimeline',{
						    	"img_url"    : $("#path").val()+"/static/commonImg/logo_.jpg",
					            "img_width"  : "640",
					            "img_height" : "640",
					            "link"       : $("#path").val()+"/mob/toActivityDetail?id="+activityId,
					            "desc"       : activityContent,
					            "title"      : activityName
	                            }, function(res) {
	                            _report('timeline', res.err_msg);
	                            });
	}
	function shareWeibo() {
	    WeixinJSBridge.invoke('shareWeibo',{
	                            "content":activityContent,
	                            "url":$("#path").val()+"/mob/toActivityDetail?id="+activityId,
	                            }, function(res) {
	                            _report('weibo', res.err_msg);
	                            });
	}
	// 当微信内置浏览器完成内部初始化后会触发WeixinJSBridgeReady事件。
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {

	        // 发送给好友
	        WeixinJSBridge.on('menu:share:appmessage', function(argv){
	            shareFriend();
	            });

	        // 分享到朋友圈
	        WeixinJSBridge.on('menu:share:timeline', function(argv){
	            shareTimeline();
	            });

	        // 分享到微博
	        WeixinJSBridge.on('menu:share:weibo', function(argv){
	            shareWeibo();
	            });
	        }, false);
</script>
</head>

<body>
	<input type="hidden" id="path" value="<%=path%>"/>
	<input name="studentId" id="studentId" type="hidden" value="${studentId }" />
	<input name="activityId" id="activityId" type="hidden" value="${activityId }" />
	<div class="col-md-12" style="padding-left: 0px;padding-right: 0px;">
		<div class="panel panel-primary" style="border-color: ;">
			<div class="panel-heading" align="left">
				<h4 >${partakeRecord.activityName }
				<c:if test="${partakeRecord.type=='camp'}">
				<c:choose >
					<c:when test="${partakeRecord.auditStatus==0 }">
					<font>待审核</font>
					</c:when>
					<c:when test="${partakeRecord.auditStatus==1 }">
					<font>已审核（通过）</font>
					</c:when>
					<c:when test="${partakeRecord.auditStatus==2 }">
					<font style="color:red">已审核（未通过）</font>
					</c:when>
				</c:choose>
				</c:if>
				</h4>
			</div>
			<div class="panel-body" style="width:100%">
<!-- 		        <p ><a href="http://mp.weixin.qq.com/s?__biz=MzA4NDI0OTYzMA==&mid=10000009&idx=1&sn=e9ea2ee6860d79eccc41b068798248f2#rd">关于科大研招微信平台</a></p> -->
		        <p><strong>简介：</strong>${partakeRecord.activityContent }</p>
		        <p><strong>时间：</strong><fmt:formatDate value="${partakeRecord.startTime}" pattern="MM月dd日 HH:mm"/> － <fmt:formatDate value="${partakeRecord.endTime}" pattern="HH:mm"/></p>
		        <c:if test="${partakeRecord.type=='camp'}">
		        <p><strong>举办学院：</strong>${partakeRecord.acMajorName }</p>
		        </c:if>
		        <c:if test="${partakeRecord.type=='report'}">
		        <p><strong>地址：</strong>${partakeRecord.activityAddress }</p>
		        </c:if>
		    	<c:if test="${fn:length(boardingList) >0}">
		    	<p><strong>乘车路线：</strong><%-- <c:if test="${dateLimit}"> --%> <a href="#myModal" data-toggle="modal" data-target="#myModal">修改路线</a><%-- </c:if> --%> <br/><br/>
		    	<c:forEach items="${boardingList }" var="boarding">
		    	<label <c:if test='${partakeRecord.boardingId==boarding.id}'>style="color: red"</c:if>><span class="glyphicon glyphicon-chevron-right"></span>  ${boarding.boardingInfo }<c:if test="${partakeRecord.boardingId==boarding.id}">(已选则)</c:if></label><br/>
		    	</c:forEach>
		    	<label <c:if test='${partakeRecord.boardingId==-1}'>style="color: red"</c:if>><span class="glyphicon glyphicon-chevron-right"></span>  自行解决</label>
		    	</p>
		    	</c:if>
		    	<c:if test="${partakeRecord.lng!=null&&partakeRecord.lat!=null }">
		    	<p><a href="<%=path%>/static/map.jsp?lng=${partakeRecord.lng}&lat=${partakeRecord.lat}">点击此处查看地图</a> <input type="checkbox" name=""/></p>
		    	</c:if>
		    </div>
		    <c:if test="${partakeRecord.partakeStatus!=1 }">
			<div class="panel-body">
			    <form action="" id="form1" name="form1">
			        <div class="control-group">
					    <div class="taskBox">
					    <label class="control-label" style="display: block;">活动组织：</label>       
					       <div class="taskBoxLinks"><h3 style="width:${partakeRecord.satisZZ*20}%"></h3><h4></h4></div><span id="satisZZscore">${partakeRecord.satisZZ==null?0:partakeRecord.satisZZ}</span> 分 
					       <input type="hidden" name="satisZZ" id="satisZZ" value="${partakeRecord.satisZZ==null?0:partakeRecord.satisZZ}"/>
					    </div>
					    <div class="taskBox">
					    <label class="control-label" style="display: block;">报告会内容：</label>       
					       <div class="taskBoxLinks"><h3 style="width:${partakeRecord.satisNR*20}%"></h3><h4></h4></div><span id="satisNRscore">${partakeRecord.satisNR==null?0:partakeRecord.satisNR}</span> 分 
					       <input type="hidden" name="satisNR" id="satisNR" value="${partakeRecord.satisNR==null?0:partakeRecord.satisNR}"/>
					    </div>
					    <div class="taskBox">
					    <label class="control-label" style="display: block;" >咨询解答：</label>
					       <div class="taskBoxLinks"><h3 style="width:${partakeRecord.satisJD*20}%"></h3><h4></h4></div><span id="satisJDscore">${partakeRecord.satisJD==null?0:partakeRecord.satisJD}</span> 分 
					       <input type="hidden" name="satisJD" id="satisJD" value="${partakeRecord.satisJD==null?0:partakeRecord.satisJD}"/>
					    </div>
					</div>
			        <div class="control-group" style="margin-bottom: 10px">
						<textarea rows="3" name="suggestion" id="suggestion" style="width: 100%">${partakeRecord.suggestion }</textarea>					
					</div>
					<div class="control-group">
						<button class="btn btn-primary " type="button" onclick="checkForm();"  >提交</button>
					</div>
				</form>
			</div>
			</c:if>
		</div>
	</div>


	<!-- 弹出窗口 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">选择线路</h4>
	      </div>
	      <div class="modal-body">
	        <c:if test="${fn:length(boardingList) >0 }">
		    	<c:forEach items="${boardingList }" var="boarding">
		    	<label class="radio" ><input type="radio" name="boardingId" value="${boarding.id }" <c:if test='${partakeRecord.boardingId==boarding.id}'>checked="checked" </c:if>/>${boarding.boardingInfo }</label>
		    	</c:forEach>
		    	<label class="radio"><input type="radio" name="boardingId" value="-1" <c:if test='${partakeRecord.boardingId==-1}'>checked="checked" </c:if>/>自行解决</label>
		    </c:if>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" onclick="changeBoarding();">确定</button>
	        <script type="text/javascript">
		    	function changeBoarding(){
		    		$.post($("#path").val()+"/mob/changeBoarding",
			    		{
			    			"boardingId":$('input:radio[name="boardingId"]:checked').val(),
			    			"activityId":$("#activityId").val(),
			    			"studentId":$("#studentId").val()
			    		},
		    			function(data,status){
		    			if(status=="success"){
		    				alert("修改成功！");
		    				window.location.reload();
		    			}
		    		});
		    	}
		    	</script>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div>
</body>
</html>
