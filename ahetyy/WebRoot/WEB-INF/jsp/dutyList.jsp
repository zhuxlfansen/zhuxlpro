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
	<title>省立儿童医院</title>
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- Le styles -->
	<link type="text/css"  href="static/commonCSS/bootstrap_3.1.min.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCSS/bootstrap-responsive.min.css" rel="stylesheet">
	<script src="static/commonJS/jquery-1.10.2.min.js"></script>
	<script src="static/commonJS/bootstrap_3.1.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    .yy th{text-align: center;vertical-align: middle;}
    </style>
    
    <script type="text/javascript">
	//var json ="${list1}";
    var list1=eval("${list1}");
    var list1_1=eval("${list1_1}");
    var list2=eval("${list2}");
    var list3=eval("${list3}");
    var list3_1=eval("${list3_1}");
    var list4=eval("${list4}");
    var list4_1=eval("${list4_1}");
    var list5=eval("${list5}");
    var list5_1=eval("${list5_1}");
    /* for(var i=0;i<list1.length;i++){
        alert(list1[i].week==1);
        alert(list1[i].week);
     } */

    
    </script>
    <script src="static/js/list.js"></script>
  </head>
  
  
  <body>
    <div class="container" style="width:100%;margin-top:10px; margin-left:-5px; margin-right:-5px;padding-left: 0px;padding-right: 0px">
     <!--  <div class="header">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
        <h3 class="text-muted">Project name</h3>
      </div>

      <div class="jumbotron">
        <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        <p><a class="btn btn-lg btn-success" href="#" role="button">Sign up today</a></p>
      </div> -->
      <!-- <div class="header">
        <h3 class="text-muted">排班表</h3>
      </div> -->
      
      <div class="row marketing" style="margin-left: 0px">
        <div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading" style="text-align: right;">
		  <h3 class="text-muted" style="float: left;margin-top: 5px">排班表</h3>
		  <div class="btn-group">
		  <input type="hidden" value="zmzj" id="tapValue"/>
		  <button class="btn btn-default  dropdown-toggle" id="tapLable" type="button" data-toggle="dropdown">
		    知名专家 <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu" style="text-align: left;">
		  	<li><a href="javascript:;" onclick="tapChange('zmzj')">知名专家</a></li>
		  	<li><a href="javascript:;" onclick="tapChange('nkzj')">内科专家</a></li>
	    	<li><a href="javascript:;" onclick="tapChange('nkzk')">内科专科</a></li>
	    	<li><a href="javascript:;" onclick="tapChange('wkzk')">外科专科</a></li>
	    	<li><a href="javascript:;" onclick="tapChange('qt')">其他科室</a></li>
		  </ul>
		</div>
		  </div>
		  <div class="panel-body" id="panelBody">
		  	<input type="hidden" value="" id="dept"/>
			<ul class="nav nav-pills" id="navUL">
			<c:forEach items="${list1_0 }" var="dept" varStatus="i">
			  <li <c:if test="${i.index==0}">class="active"</c:if>><a href="javascript:;" onclick="deptChange(this,${dept.deptId });">${dept.deptName }</a></li>
			  <c:if test="${i.index==0}">
			  <script>
			  $("#dept").val('${dept.deptId }');
			  </script>
			  </c:if>
			 </c:forEach>
			</ul>
		  </div>
		  <!-- Table -->
		  <table class="table table-bordered yy" id="tab">
		  <tr>
		  	<th style="width: 16%;">星期</th>
		  	<th style="width: 42%;">上午</th>
		  	<th >下午</th>
		  </tr>
		  <!-- <tr>
		  	<th >一</th>
		  	<td>王丽丽、王丽丽<br/>张三、张三<br/>张三、张三<br/>张三、张三<br/>张三、张三</td>
		  	<td>王丽丽、张三<br/>张三、张三<br/>张三、张三<br/>张三</td>
		  </tr>
		  <tr>
		  	<th >二</th>
		  	<td>123</td>
		  	<td>123</td>
		  </tr>
		  <tr>
		  	<th >三</th>
		  	<td>123</td>
		  	<td>123</td>
		  </tr>
		  <tr>
		  	<th >四</th>
		  	<td>123</td>
		  	<td>123</td>
		  </tr>
		  <tr>
		  	<th >五</th>
		  	<td>123</td>
		  	<td>123</td>
		  </tr>
		  <tr>
		  	<th >六</th>
		  	<td>123</td>
		  	<td>123</td>
		  </tr>
		  <tr>
		  	<th >日</th>
		  	<td>123</td>
		  	<td>123</td>
		  </tr> -->
		  </table>
		</div>
	<button type="button" onclick="window.location.href='<%=path %>/work/form'" class="btn btn-primary btn-lg btn-block">在线挂号</button>

    </div>

  </body>
</html>


			  	