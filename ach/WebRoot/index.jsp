<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="http://www.skypeassets.com/i/scom/js/skype-uri.js"></script>
	<script type="text/javascript">
	//window.location.href="/static/demo/index.html";
	</script>
  </head>
  
  <body>
  <a href="skype:echo123?chats">Call</a> the Skype Echo / Sound Test Service
    <div id="call_32" style="width:20%;background-color:#0094ff">
   <script type="text/javascript">
        Skype.ui({
            name: "call",
            element: "call_32",
            participants: ["echo123"],
            imageSize: 32,
            imageColor: "white"
        });
    </script>
</div>
    </div>
  </body>
</html>