<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>省立儿童医院预约挂号系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="static/commonJS/jquery-1.8.0.min.js"></script>

 	<style type="text/css">
		 table {
		 	width:100%;
            border: 2px solid #66CC99;  
            border-collapse: collapse;  
        }  

        td {  
            border: 1px dashed  #66CC99 ;  
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
            border: 1px solid #66CC99 ;  
            background: #66CC99 ;  
            font-size:12px;  
            padding: 3px 3px 3px 8px;  
            color: #4f6b72;  
        }  
	</style>
	
 </head>
<body style="padding:5px 5px 0 5px;">
<table id="table">
	<thead>
		<th colspan="2" width="15%">科别</th>
		<th width="10%">星期<br/>/时间</th>
		<th>一</th>
		<th>二</th>
		<th>三</th>
		<th>四</th>
		<th>五</th>
		<th>六</th>
		<th>日</th>
		<th>备注</th>
	</thead>
</table>
<script type="text/javascript">
//alert("${list}");
var list=eval("${list}");
function trans(week,apm,mzId){
	var arr = new Array();
	for(var i=0;i<list.length;i++){
		if(list[i].week==week&&list[i].apm==apm&&list[i].mzId==mzId){
			arr.push(list[i]);
		}
	}
	if(arr.length>0){
		var str="";
		for(var i=0;i<arr.length;i++){
			//alert(arr[i].eName);
			str+=arr[i].eName+"<br/>";
		}
		return str;
	}else{
		return "";
	}
}
var tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='8'>知名专家</td>"+
"<td rowspan='2'>内科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,4)+"</td>"+
"<td>"+trans(2,0,4)+"</td>"+
"<td>"+trans(3,0,4)+"</td>"+
"<td>"+trans(4,0,4)+"</td>"+
"<td>"+trans(5,0,4)+"</td>"+
"<td>"+trans(6,0,4)+"</td>"+
"<td>"+trans(7,0,4)+"</td>"+
"<td rowspan='8'></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,4)+"</td>"+
"<td>"+trans(2,1,4)+"</td>"+
"<td>"+trans(3,1,4)+"</td>"+
"<td>"+trans(4,1,4)+"</td>"+
"<td>"+trans(5,1,4)+"</td>"+
"<td>"+trans(6,1,4)+"</td>"+
"<td>"+trans(7,1,4)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>保健科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,2)+"</td>"+
"<td>"+trans(2,0,2)+"</td>"+
"<td>"+trans(3,0,2)+"</td>"+
"<td>"+trans(4,0,2)+"</td>"+
"<td>"+trans(5,0,2)+"</td>"+
"<td>"+trans(6,0,2)+"</td>"+
"<td>"+trans(7,0,2)+"</td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,2)+"</td>"+
"<td>"+trans(2,1,2)+"</td>"+
"<td>"+trans(3,1,2)+"</td>"+
"<td>"+trans(4,1,2)+"</td>"+
"<td>"+trans(5,1,2)+"</td>"+
"<td>"+trans(6,1,2)+"</td>"+
"<td>"+trans(7,1,2)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>骨科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,3)+"</td>"+
"<td>"+trans(2,0,3)+"</td>"+
"<td>"+trans(3,0,3)+"</td>"+
"<td>"+trans(4,0,3)+"</td>"+
"<td>"+trans(5,0,3)+"</td>"+
"<td>"+trans(6,0,3)+"</td>"+
"<td>"+trans(7,0,3)+"</td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,3)+"</td>"+
"<td>"+trans(2,1,3)+"</td>"+
"<td>"+trans(3,1,3)+"</td>"+
"<td>"+trans(4,1,3)+"</td>"+
"<td>"+trans(5,1,3)+"</td>"+
"<td>"+trans(6,1,3)+"</td>"+
"<td>"+trans(7,1,3)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>眼科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,5)+"</td>"+
"<td>"+trans(2,0,5)+"</td>"+
"<td>"+trans(3,0,5)+"</td>"+
"<td>"+trans(4,0,5)+"</td>"+
"<td>"+trans(5,0,5)+"</td>"+
"<td>"+trans(6,0,5)+"</td>"+
"<td>"+trans(7,0,5)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,5)+"</td>"+
"<td>"+trans(2,1,5)+"</td>"+
"<td>"+trans(3,1,5)+"</td>"+
"<td>"+trans(4,1,5)+"</td>"+
"<td>"+trans(5,1,5)+"</td>"+
"<td>"+trans(6,1,5)+"</td>"+
"<td>"+trans(7,1,5)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);


tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='2' colspan='2'>内科专家</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,24)+"</td>"+
"<td>"+trans(2,0,24)+"</td>"+
"<td>"+trans(3,0,24)+"</td>"+
"<td>"+trans(4,0,24)+"</td>"+
"<td>"+trans(5,0,24)+"</td>"+
"<td>"+trans(6,0,24)+"</td>"+
"<td>"+trans(7,0,24)+"</td>"+
"<td rowspan='2' ></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,24)+"</td>"+
"<td>"+trans(2,1,24)+"</td>"+
"<td>"+trans(3,1,24)+"</td>"+
"<td>"+trans(4,1,24)+"</td>"+
"<td>"+trans(5,1,24)+"</td>"+
"<td>"+trans(6,1,24)+"</td>"+
"<td>"+trans(7,1,24)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);


tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='18'>内科专科</td>"+
"<td rowspan='2'>哮喘</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,10)+"</td>"+
"<td>"+trans(2,0,10)+"</td>"+
"<td>"+trans(3,0,10)+"</td>"+
"<td>"+trans(4,0,10)+"</td>"+
"<td>"+trans(5,0,10)+"</td>"+
"<td>"+trans(6,0,10)+"</td>"+
"<td>"+trans(7,0,10)+"</td>"+
"<td rowspan='18'></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,10)+"</td>"+
"<td>"+trans(2,1,10)+"</td>"+
"<td>"+trans(3,1,10)+"</td>"+
"<td>"+trans(4,1,10)+"</td>"+
"<td>"+trans(5,1,10)+"</td>"+
"<td>"+trans(6,1,10)+"</td>"+
"<td>"+trans(7,1,10)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>肾内</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,9)+"</td>"+
"<td>"+trans(2,0,9)+"</td>"+
"<td>"+trans(3,0,9)+"</td>"+
"<td>"+trans(4,0,9)+"</td>"+
"<td>"+trans(5,0,9)+"</td>"+
"<td>"+trans(6,0,9)+"</td>"+
"<td>"+trans(7,0,9)+"</td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,9)+"</td>"+
"<td>"+trans(2,1,9)+"</td>"+
"<td>"+trans(3,1,9)+"</td>"+
"<td>"+trans(4,1,9)+"</td>"+
"<td>"+trans(5,1,9)+"</td>"+
"<td>"+trans(6,1,9)+"</td>"+
"<td>"+trans(7,1,9)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>康复</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,8)+"</td>"+
"<td>"+trans(2,0,8)+"</td>"+
"<td>"+trans(3,0,8)+"</td>"+
"<td>"+trans(4,0,8)+"</td>"+
"<td>"+trans(5,0,8)+"</td>"+
"<td>"+trans(6,0,8)+"</td>"+
"<td>"+trans(7,0,8)+"</td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,8)+"</td>"+
"<td>"+trans(2,1,8)+"</td>"+
"<td>"+trans(3,1,8)+"</td>"+
"<td>"+trans(4,1,8)+"</td>"+
"<td>"+trans(5,1,8)+"</td>"+
"<td>"+trans(6,1,8)+"</td>"+
"<td>"+trans(7,1,8)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>神内</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,33)+"</td>"+
"<td>"+trans(2,0,33)+"</td>"+
"<td>"+trans(3,0,33)+"</td>"+
"<td>"+trans(4,0,33)+"</td>"+
"<td>"+trans(5,0,33)+"</td>"+
"<td>"+trans(6,0,33)+"</td>"+
"<td>"+trans(7,0,33)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,33)+"</td>"+
"<td>"+trans(2,1,33)+"</td>"+
"<td>"+trans(3,1,33)+"</td>"+
"<td>"+trans(4,1,33)+"</td>"+
"<td>"+trans(5,1,33)+"</td>"+
"<td>"+trans(6,1,33)+"</td>"+
"<td>"+trans(7,1,33)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>心内</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,13)+"</td>"+
"<td>"+trans(2,0,13)+"</td>"+
"<td>"+trans(3,0,13)+"</td>"+
"<td>"+trans(4,0,13)+"</td>"+
"<td>"+trans(5,0,13)+"</td>"+
"<td>"+trans(6,0,13)+"</td>"+
"<td>"+trans(7,0,13)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,13)+"</td>"+
"<td>"+trans(2,1,13)+"</td>"+
"<td>"+trans(3,1,13)+"</td>"+
"<td>"+trans(4,1,13)+"</td>"+
"<td>"+trans(5,1,13)+"</td>"+
"<td>"+trans(6,1,13)+"</td>"+
"<td>"+trans(7,1,13)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>消化</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,11)+"</td>"+
"<td>"+trans(2,0,11)+"</td>"+
"<td>"+trans(3,0,11)+"</td>"+
"<td>"+trans(4,0,11)+"</td>"+
"<td>"+trans(5,0,11)+"</td>"+
"<td>"+trans(6,0,11)+"</td>"+
"<td>"+trans(7,0,11)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,11)+"</td>"+
"<td>"+trans(2,1,11)+"</td>"+
"<td>"+trans(3,1,11)+"</td>"+
"<td>"+trans(4,1,11)+"</td>"+
"<td>"+trans(5,1,11)+"</td>"+
"<td>"+trans(6,1,11)+"</td>"+
"<td>"+trans(7,1,11)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>血液</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,14)+"</td>"+
"<td>"+trans(2,0,14)+"</td>"+
"<td>"+trans(3,0,14)+"</td>"+
"<td>"+trans(4,0,14)+"</td>"+
"<td>"+trans(5,0,14)+"</td>"+
"<td>"+trans(6,0,14)+"</td>"+
"<td>"+trans(7,0,14)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,14)+"</td>"+
"<td>"+trans(2,1,14)+"</td>"+
"<td>"+trans(3,1,14)+"</td>"+
"<td>"+trans(4,1,14)+"</td>"+
"<td>"+trans(5,1,14)+"</td>"+
"<td>"+trans(6,1,14)+"</td>"+
"<td>"+trans(7,1,14)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>风湿免疫</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,7)+"</td>"+
"<td>"+trans(2,0,7)+"</td>"+
"<td>"+trans(3,0,7)+"</td>"+
"<td>"+trans(4,0,7)+"</td>"+
"<td>"+trans(5,0,7)+"</td>"+
"<td>"+trans(6,0,7)+"</td>"+
"<td>"+trans(7,0,7)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,7)+"</td>"+
"<td>"+trans(2,1,7)+"</td>"+
"<td>"+trans(3,1,7)+"</td>"+
"<td>"+trans(4,1,7)+"</td>"+
"<td>"+trans(5,1,7)+"</td>"+
"<td>"+trans(6,1,7)+"</td>"+
"<td>"+trans(7,1,7)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>新生儿随访中心</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,12)+"</td>"+
"<td>"+trans(2,0,12)+"</td>"+
"<td>"+trans(3,0,12)+"</td>"+
"<td>"+trans(4,0,12)+"</td>"+
"<td>"+trans(5,0,12)+"</td>"+
"<td>"+trans(6,0,12)+"</td>"+
"<td>"+trans(7,0,12)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,12)+"</td>"+
"<td>"+trans(2,1,12)+"</td>"+
"<td>"+trans(3,1,12)+"</td>"+
"<td>"+trans(4,1,12)+"</td>"+
"<td>"+trans(5,1,12)+"</td>"+
"<td>"+trans(6,1,12)+"</td>"+
"<td>"+trans(7,1,12)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);


tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='14'>外科专科</td>"+
"<td rowspan='2'>普外科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,18)+"</td>"+
"<td>"+trans(2,0,18)+"</td>"+
"<td>"+trans(3,0,18)+"</td>"+
"<td>"+trans(4,0,18)+"</td>"+
"<td>"+trans(5,0,18)+"</td>"+
"<td>"+trans(6,0,18)+"</td>"+
"<td>"+trans(7,0,18)+"</td>"+
"<td rowspan='14'></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,18)+"</td>"+
"<td>"+trans(2,1,18)+"</td>"+
"<td>"+trans(3,1,18)+"</td>"+
"<td>"+trans(4,1,18)+"</td>"+
"<td>"+trans(5,1,18)+"</td>"+
"<td>"+trans(6,1,18)+"</td>"+
"<td>"+trans(7,1,18)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>心外科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,21)+"</td>"+
"<td>"+trans(2,0,21)+"</td>"+
"<td>"+trans(3,0,21)+"</td>"+
"<td>"+trans(4,0,21)+"</td>"+
"<td>"+trans(5,0,21)+"</td>"+
"<td>"+trans(6,0,21)+"</td>"+
"<td>"+trans(7,0,21)+"</td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,21)+"</td>"+
"<td>"+trans(2,1,21)+"</td>"+
"<td>"+trans(3,1,21)+"</td>"+
"<td>"+trans(4,1,21)+"</td>"+
"<td>"+trans(5,1,21)+"</td>"+
"<td>"+trans(6,1,21)+"</td>"+
"<td>"+trans(7,1,21)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>胸外科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,22)+"</td>"+
"<td>"+trans(2,0,22)+"</td>"+
"<td>"+trans(3,0,22)+"</td>"+
"<td>"+trans(4,0,22)+"</td>"+
"<td>"+trans(5,0,22)+"</td>"+
"<td>"+trans(6,0,22)+"</td>"+
"<td>"+trans(7,0,22)+"</td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,22)+"</td>"+
"<td>"+trans(2,1,22)+"</td>"+
"<td>"+trans(3,1,22)+"</td>"+
"<td>"+trans(4,1,22)+"</td>"+
"<td>"+trans(5,1,22)+"</td>"+
"<td>"+trans(6,1,22)+"</td>"+
"<td>"+trans(7,1,22)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>神经外科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,19)+"</td>"+
"<td>"+trans(2,0,19)+"</td>"+
"<td>"+trans(3,0,19)+"</td>"+
"<td>"+trans(4,0,19)+"</td>"+
"<td>"+trans(5,0,19)+"</td>"+
"<td>"+trans(6,0,19)+"</td>"+
"<td>"+trans(7,0,19)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,19)+"</td>"+
"<td>"+trans(2,1,19)+"</td>"+
"<td>"+trans(3,1,19)+"</td>"+
"<td>"+trans(4,1,19)+"</td>"+
"<td>"+trans(5,1,19)+"</td>"+
"<td>"+trans(6,1,19)+"</td>"+
"<td>"+trans(7,1,19)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>骨科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,16)+"</td>"+
"<td>"+trans(2,0,16)+"</td>"+
"<td>"+trans(3,0,16)+"</td>"+
"<td>"+trans(4,0,16)+"</td>"+
"<td>"+trans(5,0,16)+"</td>"+
"<td>"+trans(6,0,16)+"</td>"+
"<td>"+trans(7,0,16)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,16)+"</td>"+
"<td>"+trans(2,1,16)+"</td>"+
"<td>"+trans(3,1,16)+"</td>"+
"<td>"+trans(4,1,16)+"</td>"+
"<td>"+trans(5,1,16)+"</td>"+
"<td>"+trans(6,1,16)+"</td>"+
"<td>"+trans(7,1,16)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>泌尿外科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,17)+"</td>"+
"<td>"+trans(2,0,17)+"</td>"+
"<td>"+trans(3,0,17)+"</td>"+
"<td>"+trans(4,0,17)+"</td>"+
"<td>"+trans(5,0,17)+"</td>"+
"<td>"+trans(6,0,17)+"</td>"+
"<td>"+trans(7,0,17)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,17)+"</td>"+
"<td>"+trans(2,1,17)+"</td>"+
"<td>"+trans(3,1,17)+"</td>"+
"<td>"+trans(4,1,17)+"</td>"+
"<td>"+trans(5,1,17)+"</td>"+
"<td>"+trans(6,1,17)+"</td>"+
"<td>"+trans(7,1,17)+"</td>"+
"</tr>"+
"<tr>"+
"<td rowspan='2'>新生儿科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,20)+"</td>"+
"<td>"+trans(2,0,20)+"</td>"+
"<td>"+trans(3,0,20)+"</td>"+
"<td>"+trans(4,0,20)+"</td>"+
"<td>"+trans(5,0,20)+"</td>"+
"<td>"+trans(6,0,20)+"</td>"+
"<td>"+trans(7,0,20)+"</td>"+
"</tr>"+
"<tr >"+
"<td>下午</td>"+
"<td>"+trans(1,1,20)+"</td>"+
"<td>"+trans(2,1,20)+"</td>"+
"<td>"+trans(3,1,20)+"</td>"+
"<td>"+trans(4,1,20)+"</td>"+
"<td>"+trans(5,1,20)+"</td>"+
"<td>"+trans(6,1,20)+"</td>"+
"<td>"+trans(7,1,20)+"</td>"+
"</tr>"+
"<tr>"+
"</tbody>";
$("#table").append(tbody);

tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='2' colspan='2'>儿保科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,25)+"</td>"+
"<td>"+trans(2,0,25)+"</td>"+
"<td>"+trans(3,0,25)+"</td>"+
"<td>"+trans(4,0,25)+"</td>"+
"<td>"+trans(5,0,25)+"</td>"+
"<td>"+trans(6,0,25)+"</td>"+
"<td>"+trans(7,0,25)+"</td>"+
"<td rowspan='2' ></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,25)+"</td>"+
"<td>"+trans(2,1,25)+"</td>"+
"<td>"+trans(3,1,25)+"</td>"+
"<td>"+trans(4,1,25)+"</td>"+
"<td>"+trans(5,1,25)+"</td>"+
"<td>"+trans(6,1,25)+"</td>"+
"<td>"+trans(7,1,25)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);

tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='2' colspan='2'>心理咨询</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,30)+"</td>"+
"<td>"+trans(2,0,30)+"</td>"+
"<td>"+trans(3,0,30)+"</td>"+
"<td>"+trans(4,0,30)+"</td>"+
"<td>"+trans(5,0,30)+"</td>"+
"<td>"+trans(6,0,30)+"</td>"+
"<td>"+trans(7,0,30)+"</td>"+
"<td rowspan='2' ></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,30)+"</td>"+
"<td>"+trans(2,1,30)+"</td>"+
"<td>"+trans(3,1,30)+"</td>"+
"<td>"+trans(4,1,30)+"</td>"+
"<td>"+trans(5,1,30)+"</td>"+
"<td>"+trans(6,1,30)+"</td>"+
"<td>"+trans(7,1,30)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);

tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='2' colspan='2'>皮肤科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,29)+"</td>"+
"<td>"+trans(2,0,29)+"</td>"+
"<td>"+trans(3,0,29)+"</td>"+
"<td>"+trans(4,0,29)+"</td>"+
"<td>"+trans(5,0,29)+"</td>"+
"<td>"+trans(6,0,29)+"</td>"+
"<td>"+trans(7,0,29)+"</td>"+
"<td rowspan='2' ></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,29)+"</td>"+
"<td>"+trans(2,1,29)+"</td>"+
"<td>"+trans(3,1,29)+"</td>"+
"<td>"+trans(4,1,29)+"</td>"+
"<td>"+trans(5,1,29)+"</td>"+
"<td>"+trans(6,1,29)+"</td>"+
"<td>"+trans(7,1,29)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);

tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='2' colspan='2'>耳鼻喉</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,26)+"</td>"+
"<td>"+trans(2,0,26)+"</td>"+
"<td>"+trans(3,0,26)+"</td>"+
"<td>"+trans(4,0,26)+"</td>"+
"<td>"+trans(5,0,26)+"</td>"+
"<td>"+trans(6,0,26)+"</td>"+
"<td>"+trans(7,0,26)+"</td>"+
"<td rowspan='2' ></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,26)+"</td>"+
"<td>"+trans(2,1,26)+"</td>"+
"<td>"+trans(3,1,26)+"</td>"+
"<td>"+trans(4,1,26)+"</td>"+
"<td>"+trans(5,1,26)+"</td>"+
"<td>"+trans(6,1,26)+"</td>"+
"<td>"+trans(7,1,26)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);

tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='2' colspan='2'>口腔科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,28)+"</td>"+
"<td>"+trans(2,0,28)+"</td>"+
"<td>"+trans(3,0,28)+"</td>"+
"<td>"+trans(4,0,28)+"</td>"+
"<td>"+trans(5,0,28)+"</td>"+
"<td>"+trans(6,0,28)+"</td>"+
"<td>"+trans(7,0,28)+"</td>"+
"<td rowspan='2' ></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,28)+"</td>"+
"<td>"+trans(2,1,28)+"</td>"+
"<td>"+trans(3,1,28)+"</td>"+
"<td>"+trans(4,1,28)+"</td>"+
"<td>"+trans(5,1,28)+"</td>"+
"<td>"+trans(6,1,28)+"</td>"+
"<td>"+trans(7,1,28)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);

tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='2' colspan='2'>眼科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,31)+"</td>"+
"<td>"+trans(2,0,31)+"</td>"+
"<td>"+trans(3,0,31)+"</td>"+
"<td>"+trans(4,0,31)+"</td>"+
"<td>"+trans(5,0,31)+"</td>"+
"<td>"+trans(6,0,31)+"</td>"+
"<td>"+trans(7,0,31)+"</td>"+
"<td rowspan='2' ></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,31)+"</td>"+
"<td>"+trans(2,1,31)+"</td>"+
"<td>"+trans(3,1,31)+"</td>"+
"<td>"+trans(4,1,31)+"</td>"+
"<td>"+trans(5,1,31)+"</td>"+
"<td>"+trans(6,1,31)+"</td>"+
"<td>"+trans(7,1,31)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);

tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='2' colspan='2'>中医科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,32)+"</td>"+
"<td>"+trans(2,0,32)+"</td>"+
"<td>"+trans(3,0,32)+"</td>"+
"<td>"+trans(4,0,32)+"</td>"+
"<td>"+trans(5,0,32)+"</td>"+
"<td>"+trans(6,0,32)+"</td>"+
"<td>"+trans(7,0,32)+"</td>"+
"<td rowspan='2' ></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,32)+"</td>"+
"<td>"+trans(2,1,32)+"</td>"+
"<td>"+trans(3,1,32)+"</td>"+
"<td>"+trans(4,1,32)+"</td>"+
"<td>"+trans(5,1,32)+"</td>"+
"<td>"+trans(6,1,32)+"</td>"+
"<td>"+trans(7,1,32)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);

tbody="<tbody  style='border-bottom: 2px solid #66CC99;'>"+
"<tr>"+
"<td rowspan='2' colspan='2'>妇幼科</td>"+
"<td>上午</td>"+
"<td>"+trans(1,0,27)+"</td>"+
"<td>"+trans(2,0,27)+"</td>"+
"<td>"+trans(3,0,27)+"</td>"+
"<td>"+trans(4,0,27)+"</td>"+
"<td>"+trans(5,0,27)+"</td>"+
"<td>"+trans(6,0,27)+"</td>"+
"<td>"+trans(7,0,27)+"</td>"+
"<td rowspan='2' ></td>"+
"</tr>"+
"<tr>"+
"<td>下午</td>"+
"<td>"+trans(1,1,27)+"</td>"+
"<td>"+trans(2,1,27)+"</td>"+
"<td>"+trans(3,1,27)+"</td>"+
"<td>"+trans(4,1,27)+"</td>"+
"<td>"+trans(5,1,27)+"</td>"+
"<td>"+trans(6,1,27)+"</td>"+
"<td>"+trans(7,1,27)+"</td>"+
"</tr>"+
"</tbody>";
$("#table").append(tbody);
</script>
</body>
</html>
