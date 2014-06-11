<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale-1,maximum-scale=1.0,user-scalable=no">
<title>手机摄影大赛</title>
<link type="text/css"  href="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<script src="<%=path %>/static/js/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/js/jqmobile/jquery.mobile-1.4.2.js"></script>
</head>

<body>
<div data-role="page" id="backPage" >
<!-- <header data-role="header">
<a data-rel="back" data-icon="back" data-iconpos="notext">后退</a>
<h1>关于邦华</h1>
<a href="../index.jsp" data-icon="home" data-iconpos="notext">后退</a>
</header> -->

<article data-role="content">
<h1 style="margin:0;">手机摄影大赛</h1>
<h6 style="margin:5px 0 5px 0;">2014-04-09  唐仲英德育基金会</h6>
<img alt="" src="../images/top.jpg" width="100%">
<p>为更好地开展“中国梦”宣传报道工作，进一步弘扬民族精神、凝聚中国力量，唐仲英德育基金会面向全国高校征集视角独特、积极上进的摄影作品以及其背后的故事，发动公民拿起手机，拍摄自己和身边人的“中国梦”。活动第一期（2013.12.6-2014.3.6）。</p>
<p>活动拍摄主题不限，参与者可围绕“旅游梦、美食梦”等多种原创主题进行拍摄。同时，大赛设置微博赛区，参赛者可关注活动官方微博了解话题内容。评委会由唐仲英德育基金会及国内外摄影界、传媒界专业人士组成。大赛将设置一、二、三等奖、幸运参与奖与投稿最高人气奖，奖品丰厚。</p>
<p>作为国内三大强势媒体、权威机构首次联手之作，活动力求打造影像行业内最高级别的手机摄影赛事与普通百姓以影像表达自我的公共平台。</p>
</article>
<footer data-role="footer"><h4>&copy; 2014 Code 瀚云微生活</h4></footer>
</div>
</body>
</html>
