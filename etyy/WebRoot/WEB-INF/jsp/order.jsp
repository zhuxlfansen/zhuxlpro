<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>在线挂号</title>
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- Le styles -->
	<link type="text/css"  href="<%=path %>/static/commonCSS/bootstrap_3.1.min.css" rel="stylesheet">
	<link type="text/css"  href="<%=path %>/static/commonCSS/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css"  href="<%=path %>/static/commonCSS/bootstrap-datetimepicker.css" rel="stylesheet">
	<script src="<%=path %>/static/commonJS/jquery-1.8.0.min.js"></script>
	<script src="<%=path %>/static/commonJS/bootstrap_3.1.min.js"></script>
	<script src="<%=path %>/static/commonJS/bootstrap-datetimepicker.js"></script>
	<script src="<%=path %>/static/commonJS/bootstrap-datetimepicker.zh-CN.js"></script>
	
<%-- 	<script src="<%=path %>/static/commonJS/My97DatePicker/WdatePicker.js"></script>
 --%>    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    input {
    } 
    </style>
    
  </head>
  
  
  <body>
   <div class="container" style="width:100%;margin-top:10px; margin-left:-5px; margin-right:-5px;padding-left: 0px;padding-right: 0px">
      <input type="hidden" id="path" value="<%=path%>"/>
      <div class="row marketing" style="margin-left: 0px">
        <div class="panel panel-default" style="border: 0px">
		  <!-- Default panel contents -->
		  <div class="panel-heading" style="text-align: center;background: #8bca2b">
		  	<h3 class="text-muted" style="color: #3a3a3a">在线挂号</h3>
		  </div>
		  <div class="panel-body" id="panelBody" style="border: 0px;background: #f9fcf3">
		  <form action="<%=path %>/work/createOrder" method="post" id="form1" name="form1" class="form-horizontal" role="form">
			  <div class="form-group">
			    <label for="pName" class="col-sm-2 control-label">姓名：</label>
			    <div class="col-sm-10" >
			      <input type="text" class="form-control" name="pName" id="pName" placeholder="姓名">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="pGender" class="col-sm-2 control-label">性别：</label>
			    <div class="col-sm-10">
			      	<select class="form-control" name="pGender" id="pGender">
						  <option value="0">男</option>
						  <option value="1">女</option>
					</select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="pAge" class="col-sm-2 control-label">年龄：</label>
			    <div class="col-sm-10" >
			      <input type="text" class="form-control" name="pAge" id="pAge" placeholder="年龄">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="pIDCardNum" class="col-sm-2 control-label">身份证号：</label>
			    <div class="col-sm-10" >
			      <input type="text" class="form-control" name="pIDCardNum" id="pIDCardNum" placeholder="身份证号">
			    </div>
			  </div>
              <div class="form-group">
			    <label for="remark" class="col-sm-2 control-label">病情描述：</label>
			    <div class="col-sm-10" >
			      <input type="text" class="form-control" name="remark" id="remark" placeholder="病情描述">
			    </div>
			  </div>
			  <div class="form-group">
                <label for="orderDate" class="col-sm-2 control-label">预约日期：</label>
                <div class="col-sm-10" >
                <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" name="dateSel" id="dateSel" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
                </div>
              </div>
              <div class="form-group">
			    <label for="apm" class="col-sm-2 control-label">时间：</label>
			    <div class="col-sm-10">
			      	<select class="form-control" name="apm" id="apm">
						  <option value="0">上午</option>
						  <option value="1">下午</option>
					</select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="mzId" class="col-sm-2 control-label">选择门诊：</label>
			    <div class="col-sm-10" >
			      	<select class="form-control" name="mzId" id="mzId" onmousedown="sclick();" onchange="queryExpertForOrder(this);">
						  <option value="">==请选择门诊==</option>
						  <c:forEach items="${mzList }" var="mz">
							  <c:if test="${mz.pId!=null }"><option value="${mz.mzId }">（${mz.pName}）${mz.mzName }</option></c:if>
						  </c:forEach>
					</select>
			    </div>
			  </div>
			  <div class="form-group" id="eDIV" style="display: none">
			    <label for="eId" class="col-sm-2 control-label">选择专家：</label>
			    <div class="col-sm-10">
			      	<select class="form-control"  name="eId" id="eId">
						  <option value="">--请选择专家--</option>
					</select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="oName" class="col-sm-2 control-label">预约人姓名：</label>
			    <div class="col-sm-10" >
			      <input type="text" class="form-control" name="oName" id="oName" placeholder="预约人姓名">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="address" class="col-sm-2 control-label">联系地址：</label>
			    <div class="col-sm-10" >
			      <input type="text" class="form-control" name="address" id="address" placeholder="联系地址">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="tel" class="col-sm-2 control-label">电话号码：</label>
			    <div class="col-sm-10" >
			      <input type="text" class="form-control" name="tel" id="tel" placeholder="电话号码">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="phone" class="col-sm-2 control-label">手机号码：</label>
			    <div class="col-sm-10" >
			      <input type="text" class="form-control" name="phone" id="phone" placeholder="手机号码">
			    </div>
			  </div>
              </form>
          </div>
	<button type="button"  style="background-color: #8bca2b;border-color: #97bd56" onclick="submitForm();" class="btn btn-primary btn-lg btn-block">提交</button>

    </div>
	<script type="text/javascript">
	$('.form_date').datetimepicker({
		language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	
	function submitForm(){
		document.getElementById("form1").submit(); 
	}
	
	function sclick(){
		if($("#dateSel").val()==""){
			alert("请先选择日期！");
		}
	}
	
	function queryExpertForOrder(obj){
		if(obj.value==2||obj.value==3||obj.value==4||obj.value==5){
			$.ajax({
				url : $("#path").val()+"/work/queryExpertForOrder",
				type : 'POST',
				data : {"mzId":obj.value,"apm":$("#apm").val(),"dateSel":$("#dateSel").val()},
				dataType : 'json',
				cache : false,
				success : function(r) {
					if(r!=null){
						$("#eDIV").css("display","block");
						var arr = eval(r);
						if(arr.length>0){
							var option="<option value=''>--请选择专家--</option>";
							$.each(arr, function(i, n) {
								option+="<option value='"+n.eId+"'>"+n.eName+"</option>";
							});
							$("#eId").html(option);
						}else{
							$("#eId").html("<option value=''>暂无专家</option>");
						}
					}else{
						alert("获取数据失败！");
					}
				}
			})
		}else{
			$("#eId").html("<option value=''>--请选择专家--</option>");
			$("#eDIV").css("display","none");
		}
		
	}
</script>
  </body>
</html>


			  	