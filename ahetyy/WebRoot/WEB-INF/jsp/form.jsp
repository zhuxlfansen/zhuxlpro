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
	<link type="text/css"  href="static/commonCSS/bootstrap_3.1.min.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCSS/bootstrap-responsive.min.css" rel="stylesheet">
	<script src="static/commonJS/jquery-1.10.2.min.js"></script>
	<script src="static/commonJS/bootstrap_3.1.min.js"></script>
	<script src="static/commonJS/My97DatePicker/WdatePicker.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    function tapChange(type){
	   	 if(type=="xc"){
	   		$("#tapLable1").html("哮喘<span class='caret'></span>");
	   		$("#tapLable2").html("汤仲英<span class='caret'></span>");
	   		$("#expUL").html("<li><a href='javascript:;' onclick='tapChange2(this)'>汤仲英</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>华山</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>杨泽玉</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>毕良学</a></li>");
	   	 }else if(type=="sn"){
	   		$("#tapLable1").html("肾内<span class='caret'></span>");
	   		$("#tapLable2").html("江家云<span class='caret'></span>");
	   		$("#expUL").html("<li><a href='javascript:;' onclick='tapChange2(this)'>江家云</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>钟林</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>董扬</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>徐达良</a></li>");
	   	 }else if(type=="kf"){
	   		$("#tapLable1").html("康复<span class='caret'></span>");
	   		$("#tapLable2").html("张敏<span class='caret'></span>");
	   		$("#expUL").html("<li><a href='javascript:;' onclick='tapChange2(this)'>张敏</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>童光磊</a></li>");
	   	 }else if(type=="pw"){
	   		$("#tapLable1").html("普外科<span class='caret'></span>");
	   		$("#tapLable2").html("高群<span class='caret'></span>");
	   		$("#expUL").html("<li><a href='javascript:;' onclick='tapChange2(this)'>高群</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>刘翔</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>王永明</a></li>");
	   	 }else if(type=="xw"){
	   		$("#tapLable1").html("心外科<span class='caret'></span>");
	   		$("#tapLable2").html("丁力<span class='caret'></span>");
	   		$("#expUL").html("<li><a href='javascript:;' onclick='tapChange2(this)'>丁力</a></li>"
	   						+"<li><a href='javascript:;' onclick='tapChange2(this)'>张峰</a></li>");
	   	 }else if(type=="gk"){
	   		$("#tapLable1").html("骨科<span class='caret'></span>");
	   		$("#tapLable2").html("段贤伦<span class='caret'></span>");
	   		$("#expUL").html("<li><a href='javascript:;' onclick='tapChange2(this)'>段贤伦</a></li>");
	   	 }
   }
    
   function tapChange2(obj){
	 	$("#tapLable2").html($(obj).html()+"<span class='caret'></span>");
   }
    </script>
  </head>
  
  
  <body>
   <div class="container" style="width:100%;margin-top:10px; margin-left:-5px; margin-right:-5px;padding-left: 0px;padding-right: 0px">
      
      <div class="row marketing" style="margin-left: 0px">
        <div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading" >
		  <h3 class="text-muted" >在线挂号</h3>
		  </div>
		  <div class="panel-body" id="panelBody">
		  <form action="" method="post"  enctype="multipart/form-data">
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >患者姓名<font class="star_p" >*</font></div></span>
                      <input type="text" style="text-align: center;" class="form-control" placeholder="患者姓名" name="name" id="name" value="${student.name }"/>
                  </div>
                  
                   <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >性别</div></span>
                      &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" id="optionsRadios2" value="option2" checked>男   <input type="radio" name="gender" id="optionsRadios2" value="option2">女
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >年龄<font class="star_p" >*</font></div></span>
                      <input type="text" style="text-align: center;" class="form-control" placeholder="年龄" name="name" id="name" value="${student.name }"/>
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >身份证号<font class="star_p" >*</font></div></span>
                      <input type="text" style="text-align: center;" class="form-control" placeholder="身份证号" name="idCardNum" id="idCardNum" />
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >所属疾病<font class="star_p" >*</font></div></span>
                      <input type="text" style="text-align: center;" class="form-control" placeholder="所属疾病" name="idCardNum" id="idCardNum" />
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >预约专科名称<font class="star_p" >*</font></div></span>
                      <div class="btn-group">
						  <button class="btn btn-default  dropdown-toggle" id="tapLable1" type="button" data-toggle="dropdown">
						    选择专科 <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" style="text-align: left;">
						  	<li role="presentation" class="dropdown-header">内科</li>
						  	<li><a href="javascript:;" onclick="tapChange('xc')">哮喘</a></li>
						  	<li><a href="javascript:;" onclick="tapChange('sn')">肾内</a></li>
					    	<li><a href="javascript:;" onclick="tapChange('kf')">康复</a></li>
					    	<li role="presentation" class="divider"></li>
					    	<li role="presentation" class="dropdown-header">外科</li>
					    	<li><a href="javascript:;" onclick="tapChange('pw')">普外科</a></li>
					    	<li><a href="javascript:;" onclick="tapChange('xw')">心外科</a></li>
					    	<li><a href="javascript:;" onclick="tapChange('gk')">骨科</a></li>
						  </ul>
					  </div>
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >预约专家姓名<font class="star_p" >*</font></div></span>
                      <div class="btn-group">
						  <button class="btn btn-default  dropdown-toggle" id="tapLable2" type="button" data-toggle="dropdown">
						    选择专家 <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" style="text-align: left;" id="expUL">
						  <li><a href="javascript:;">请先选择专科</a></li>
						  </ul>
					  </div>
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >预约日期<font class="star_p" >*</font></div></span>
                      <input class="Wdate" type='text' readonly="readonly" style="height: 30px;margin-bottom:0px;" value="" onfocus="WdatePicker({dateFmt:'yyyy/MM/dd'})" />
                      <br>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="optionsRadios" id="optionsRadios2" checked value="option2">上午   <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">下午
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >您的姓名<font class="star_p" >*</font></div></span>
                      <input type="text" style="text-align: center;" class="form-control" placeholder="您的姓名" name="name" id="name" value="${student.name }"/>
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >联系地址</div></span>
                      <input type="text" style="text-align: center;" class="form-control" placeholder="联系地址" name="name" id="name" value="${student.name }"/>
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >电话号码</div></span>
                      <input type="text" style="text-align: center;" class="form-control" placeholder="电话号码" name="name" id="name" value="${student.name }"/>
                  </div>
                  
                  <div class="input-group" style="margin-bottom: 5px">
                      <span class="input-group-addon"><div class="input-banner" >手机号码<font class="star_p" >*</font></div></span>
                      <input type="text" style="text-align: center;" class="form-control" placeholder="手机号码" name="name" id="name" value="${student.name }"/>
                  </div>
                  
              </form>
          </div>
	

    </div>
	<button type="button" onclick="window.location.href='<%=path %>/static/page/tips.jsp'" class="btn btn-primary btn-lg btn-block">提交</button>
  </body>
</html>


			  	