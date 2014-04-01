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
<title>无标题文档</title>
<link type="text/css"  href="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.css" rel="stylesheet">
<script src="<%=path %>/static/jqmobile/jquery-1.10.2.min.js"></script>
<script src="<%=path %>/static/jqmobile/jquery.mobile-1.4.2.js"></script>
</head>

<body>
<div data-role="page" id="backPage" >
<header data-role="header">
<a data-rel="back" data-icon="back" data-iconpos="notext">后退</a>
<h1>品牌价值</h1>
</header>

<article data-role="content">
<h1 style="margin:0;">中海地产</h1>
<h6 style="margin:5px 0 5px 0;">2014-04-01  中海微信</h6>
<img alt="" src="../static/img/zh01.jpg" width="100%">
<p>“中海地产”是中国海外集团房地产业务的品牌统称。中国海外1979年成立于香港，并于1992年在香港联交所上市，首开中资企业以香港本地业务资产直接上市之先河（中国海外发展有限公司，00688.HK，简称“中国海外”）。</p>
<p style="color: red">2007年，中国海外率先入选香港恒生指数成份股。2010-2013年，连续4年获选“恒生可持续发展企业指数”，并于2010年荣登英国《金融时报》“全球500强”，为唯一上榜的中资房企。房地产开发是公司的核心业务，历经 30余年的发展，成功打造了中国房地产行业领导公司品牌“中海地产”。</p>
<p> 中海地产已形成以港澳地区、长三角、珠三角、环渤海、东北、中西部为重点区域的全国性均衡布局，业务遍布港澳及内地近50个经济活跃城市，为逾百万客户提供了数十万套中高端精品物业。截至2013年底，公司总资产达2965亿港元，净资产达1100亿港元。2013年，累计实现房地产销售额1385.2亿港元，净利润230.4亿港元，经营效益稳居行业第一。截至2013年底，公司拥有土地储备面积超过5000万平方米。</p>
</article>
</div>
</body>
</html>
