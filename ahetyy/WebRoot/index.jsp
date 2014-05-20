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
	<title>考生信息一览画面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- Le styles -->
	<link type="text/css"  href="static/commonCSS/bootstrap_3.1.min.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCSS/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css"  href="static/commonCSS/style.css" rel="stylesheet">
	<script src="static/commonJS/jquery-1.10.2.min.js"></script>
	<script src="static/commonJS/bootstrap_3.1.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  
  
  <body>
    <div class="container">
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
        <h3 class="text-muted">Project name</h3>
      </div>

      <div class="jumbotron">
        <h1>Jumbotron heading</h1>
        <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        <p><a class="btn btn-lg btn-success" href="#" role="button">Sign up today</a></p>
      </div>

      <div class="row marketing">
        <div class="">
			<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading">Panel heading</div>
			  <div class="panel-body">
			    <p>...</p>
			  </div>
			  <!-- Table -->
			  <table class="table">
			  <tr>
			  	<td>123</td>
			  	<td>123</td>
			  </tr><tr>
			  	<td>123</td>
			  	<td>123</td>
			  </tr><tr>
			  	<td>123</td>
			  	<td>123</td>
			  </tr>
			  </table>
			</div>

        </div>

        <div class="col-lg-12">
          <h4>Subheading</h4>
          <p>Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.</p>

          <h4>Subheading</h4>
          <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum.</p>

          <h4>Subheading</h4>
          <p>Maecenas sed diam eget risus varius blandit sit amet non magna.</p>
        </div>
      </div>

      <div class="footer">
        <p>&copy; Company 2013</p>
      </div>

    </div>

  </body>
</html>


			  	