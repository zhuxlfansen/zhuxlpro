<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>活动二级管理员</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link type="text/css"  href="static/commonCss/bootstrap.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/common.css" rel="stylesheet">
<link type="text/css"  href="static/commonCss/fenye.css" rel="stylesheet">

<script src="static/commonJs/jquery-1.10.2.min.js"></script>
<script src="static/commonJs/bootstrap.min.js"></script>
<script src="static/commonJs/page.js"></script>
<script src="static/commonJs/My97DatePicker/WdatePicker.js"></script>
<script src="static/commonJs/AntValidator.js"></script>
<script src="static/commonJs/AntValidatorRegex.js"></script>


<script type="text/javascript" >

 $(document).ready(function() {
     $("#ul_li  li").each(function() {
         $(this).removeClass("active");
        }); 
    // $("#adminAdd").addClass("active");
    }); 
    
jQuery(function($){
    if($("#form1")){
        $.formValidator.initConfig({formid:"form1",errorfocus:false,onerror:function(msg){},onsuccess:function(){   
            return true;
        }});
        $.formValidator.getInitConfig("1").wideword = false;
        $("#username").formValidator({onshow:"* 必填",onfocus:"输入用户名",oncorrect:"&nbsp;"}).inputValidator({min:1,max:50,onerror: "用户名长度为1-50位"});
        $("#managerGrade").formValidator({onshow:"* 必选",onfocus:"选择年级",oncorrect:"&nbsp;"}).inputValidator({min:1,max:14,onerror: "请选择年级"});
        $("#managerClass").formValidator({onshow:"* 必选",onfocus:"选择班级",oncorrect:"&nbsp;"}).inputValidator({min:1,max:14,onerror: "请选择班级"});
    }
});

function add(){
    if(ajaxValidate){
        $("#form1").submit();
    }
}

var ajaxValidate = false;
function checkName(userName){
	var oldUserName = '${manager.username}';
	if(userName!=oldUserName){
		  if(userName!=""){
			    //--AJAX 判断账户名是否存在 
			        $.post("checkUserName",{"userName":userName},function(data){
			            if(data=='exist'){
			            $("#username").css("border","1px solid red");
			                $("#usernameTip").html('该账户名称已存在');
			                ajaxValidate = false;
			            }else{
			                ajaxValidate = true;
			                $("#usernameTip").html('');
			                $("#username").css("border","1px solid #ccc");
			            }
			        });
			    }
	}else{
		ajaxValidate = true;
        $("#usernameTip").html('');
        $("#username").css("border","1px solid #ccc");
	}
} 

</script>

</head>

<body>
    <!-- top -->
    <%@include file="header.jsp"%>
    <!-- .top -->
    <div class="container-fluid">
        <div class="row-fluid">
            
            <%@include file="navigation.jsp"%>
            
            <div class="span9">
               <form id="form1" name="form1" action="updateManager" method="post">
               <input name="managerId" type="hidden" value="${manager.managerId}">
               <h3>修改二级管理员</h3>
                <table style="margin-left: 50px;">
                    <tr>
                        <th>用户名:</th>
                        <td><input id="username" type='text' name="username" value="${manager.username}"  style="height: 26px;"  onblur="checkName(this.value);"/><span id="usernameTip"></span>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>年级:</th>
                        <td>
                        <input id="managerGrade" type="text" name="managerGrade" value="${manager.managerGrade}" onfocus="WdatePicker({dateFmt:'yyyy'})" style="height: 26px;"/>
                        <span id="managerGradeTip"></span>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>班级:</th>
                        <td>
                        <select id="managerClass" name="managerClass" style="width: 160px;">
                            <option value="">请选择</option>
                            <c:forEach items="${classList}" var="cla">
                               
                                        <c:choose>
                                            <c:when test="${manager.managerClass==cla.value}">
                                                <option value="${cla.value}" selected="selected">${cla.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                 <option value="${cla.value}">${cla.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                
                                
                            </c:forEach>
                        </select>
                        <span id="managerClassTip"></span>
                        </td>
                    </tr>
                    
                    <tr >
                        <th></th>
                        <td style="padding-top: 10px"><input type="button" value="保存" onclick="add()"  class="btn" />
                        <input type="button" value="取消" name="" class="btn" onclick="javascript:toBack();"/>
                        </td>
                    </tr>
                </table>
              </form>
            </div>
        </div>
    </div>
    
    <%@include file="footer.jsp"%>
</body>
</html>
