<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
<title>studentlogin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="static/commonCss/bootstrap-3.min.css" rel="stylesheet">
<script src="static/commonJs/jquery-1.10.2.min.js"></script>
<script src="static/commonJs/bootstrap.min.js"></script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

</head>

<body>
<script type="text/javascript">
function checkForm(){
	var errorMsg = "";
	
	// 验证姓名
    var name = $("#name").val().replace(/(^\s*)|(\s*$)/g, "").length;
    if (name >= 50) {
    	errorMsg = errorMsg +"您输入的姓名过长...\n";
    }
    if (name == 0) {
    	errorMsg = errorMsg +"请输入姓名...\n" ;
    }
    
    // 验证手机
    var contact = $("#contact").val().replace(/(^\s*)|(\s*$)/g, "");
    if((/^0?1[0-9][0-9]\d{8}$/.test(contact)) == false ){
    	errorMsg = errorMsg +"请输入正确的手机号码...\n" ;
    }
    
    // 验证邮箱
    var email = $("#email").val().replace(/(^\s*)|(\s*$)/g, "");
    
    if((/^[\w.-]+@([0-9a-zA-Z\w-]+\.)+[0-9a-zA-Z]{2,8}$/.test(email))==false ){
    	errorMsg = errorMsg +"请输入正确的电子邮箱...\n" ;
    }
    
    // 验证学校
    var schoolId = $("#schoolId").val().replace(/(^\s*)|(\s*$)/g, "");
    if(schoolId=="" || schoolId==0 ){
    	errorMsg = errorMsg +"请选择所在学校...\n" ;
    }
    
    // 验证考生专业
    var studentMajor = $("#studentMajor").val().replace(/(^\s*)|(\s*$)/g, "").length;
    if (studentMajor >= 50) {
    	errorMsg = errorMsg +"您输入的专业名称过长...\n" ;
    }
    if (studentMajor == 0) {
    	errorMsg = errorMsg +"请输入专业...\n" ;
    }

    //验证报考专业
    var majorCode = $("#majorCode").val().replace(/(^\s*)|(\s*$)/g, "");
    if (majorCode == "" || majorCode == 0) {
    	errorMsg = errorMsg +"请选择报考专业...\n" ;
    }
    
    // 验证成绩
    var gpa = $("#gpa").val().replace(/(^\s*)|(\s*$)/g, "");
    
    if(gpa.length==0){
    	errorMsg = errorMsg +"请输入加权平均成绩...\n";
    }
    if(parseInt(gpa)>100){
    	errorMsg = errorMsg +"成绩栏请输入0-100的成绩...例：92.56\n" ;
    }
    
    // 验证班级人数和班级排名
    var classSize = $("#classSize").val().replace(/(^\s*)|(\s*$)/g, "");
    var studentRank = $("#studentRank").val().replace(/(^\s*)|(\s*$)/g, "");
    
    if(  (/^[1-9][0-9]*$/g.test(classSize))==false || (/^[1-9][0-9]*$/g.test(studentRank))==false ){
    	errorMsg = errorMsg +"班级人数和排名请输入正整数...\n" ;
    } else if( parseInt(studentRank)>parseInt(classSize) ){
    	errorMsg = errorMsg +"输入的排名不能大于班级人数...\n" ;
    }
    
	//验证图片格式 
    var imgFile = $("#imgFile").val();
    if(imgFile!=null&&imgFile!=''){
        if (!/.(gif|jpg|png|bmp)$/.test(imgFile)) {
        	errorMsg = errorMsg +"上传图片类型必须是gif,jpg,png,bmp中的一种...\n" ;
        }
    } else {
    	errorMsg = errorMsg +"请上传成绩单照片...\n" ;
    }
    
    if(errorMsg != ""){
    	alert(errorMsg);
    	return false;
    }
	
	return true;
}

function clearNoNum(obj) {
    obj.value = obj.value.replace(/[^\d.]/g, ""); 
    obj.value = obj.value.replace(/^\./g, ""); 
    obj.value = obj.value.replace(/\.{2,}/g, "."); 
    obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$",".");
    if(!/^-?\d+\.?\d{0,2}$/.test(obj.value)){
        obj.value=obj.value.substring(0,obj.value.length-1);
    }
}

</script>
	<div class="col-md-12" style="padding-left: 0px;padding-right: 0px;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4 class="panel-title" style="margin-top: 5px; margin-bottom: 5px;">活动报名页面</h4>
			</div>
			<div class="panel-body">
			    <form action="${pageContext.servletContext.contextPath}/student/submitLogin" method="post" onsubmit="return checkForm();" enctype="multipart/form-data">
			        <input name="wxCode" type="hidden" value="testWXcodehehe" />
					<div class="input-group">
						<span class="input-group-addon">姓名</span>
						<input type="text" class="form-control" placeholder="Username" name="name" id="name"/>
					</div>
					<br />
					<div class="input-group">
						<span class="input-group-addon">手机</span>
						<input type="text" class="form-control" placeholder="请输入11位的数字手机号码" name="contact" id="contact">
					</div>
					<br />
					<div class="input-group">
						<span class="input-group-addon">邮箱</span>
						<input type="text" class="form-control" placeholder="xxx@xxxx.xxxx" name="email" id="email">
					</div>
					<br />
					<div class="input-group">
						<span class="input-group-addon">地址</span>
						<button class="form-control btn btn-default "  data-toggle="modal" id="region-button-value"
							data-target="#chooseCity">点击选择所在地</button>
					</div>
					<br />
					<div class="input-group">
						<span class="input-group-addon">学校</span>
						<button class="form-control btn btn-default " data-toggle="modal"  id="school-button-value"
							data-target="#chooseSchool">点击选择学校</button>
						<input type="hidden" name="schoolId" id="schoolId" value="" />
					</div>
					<br/>
					<div class="input-group">
	                    <span class="input-group-addon">所学专业</span>
	                    <input type="text"  class="form-control" placeholder="Major" id="studentMajor" name="studentMajor" />
	                </div>
					<br />
					<div class="input-group">
						<span class="input-group-addon">报考专业</span>
						<button class="form-control btn btn-default " data-toggle="modal" id="major-button-value"
							data-target="#chooseMajor">点击选择专业</button>
						<input type="hidden" name="majorCode" id="majorCode" value="" />
					</div>
					<br />
					<div class="input-group">
						<span class="input-group-addon">加权平均分</span>
						<input type="text" class="form-control" placeholder="范围：0-100 例：89.76" name="gpa" id="gpa" onkeyup="clearNoNum(this)">
					</div>
					<br />
                    <div class="input-group">
                        <span class="input-group-addon">班级排名/人数</span>
                        <div class="form-control">
	                        <input type="text" size="2" placeholder="排名" name="studentRank" id="studentRank"/>/
	                        <input type="text" size="2" placeholder="人数" name="classSize" id="classSize" />
                        </div>
                    </div>
					<br/>
					<div class="input-group">
					   <span class="input-group-addon">上传成绩单</span>
					   <div class="form-control" >
	                    <input type="file"  name="imgFile" id="imgFile" />上传文件类型：gif|jpg|png|bmp
	                   </div>
	                </div>
					<br/>
					<button class="btn btn-primary " type="submit"  >提交</button>
				</form>
			</div>
		</div>
	</div>
	
	
	

	<!-- chooseCity -->
	<div class="modal fade" id="chooseCity" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<script src="static/commonJs/jquery-1.10.2.min.js"></script>
		<script src="static/js/region/provinceAndCity.js" type="text/javascript"></script>
			
		<script type="text/javascript">
			//加载用户原来的地址 
			var province = "${province}";
			var city = "${city}";
			var county = "${county}";
			
			$(document).ready(
			    function loadAddressMsg() {
			        loadProvinces();
			        if(province != null && province != ""){
			            loadCities(province);
			        }
			        if(city != null && city != ""){
			            loadCounties(city);
			        }
			    }
			);
			
			var datas = new Region();
			var provinces=datas.provinces;
			var cities=datas.cities;
			
			//获取省信息
			function loadProvinces(){
			    for ( var i in provinces) {
			        if (i == province) {
			            var option = new Option(provinces[i], i, false, true);
			        } else {
			            var option = new Option(provinces[i], i);
			        }
			        //$("#province").append(option); IE兼容性 存在问题
			        document.getElementById("province").add(option);
			    }
			}
			
			//获取市信息
			function loadCities(obj) {
			    province = obj;
			    if (obj == 0) {
			        $("#city").empty();
			        $("#city").append("<option value='0'>选择城市</option>");
			    }
			    if (obj in cities) {
			        $("#city").empty();
			        $("#city").append("<option value='0'>选择城市</option>");
			        for ( var i in cities[obj]) {
			            var option = new Option(cities[obj][i], i);
			            //$("#city").append(option);
			            document.getElementById("city").add(option);
			            if (i == city) {
			                option.selected = 'selected';
			            } 
			        }
			    }
			}
			
			$(document).ready(function(){
				
				// 选择省市后点击确定按钮
			  $("#citySubmit").click(function(){
				  var provinceId = $("#province").val();
                  var provinceName = $("#province").find("option:selected").text();
                  
				  var cityId = $("#city").val();
                  var cityName = $("#city").find("option:selected").text();
                  
                  if(provinceId==0 || cityId==0){
                	  alert("请正确选择省/市");
                	  return ;
                  }
				  
				  // 把选择城市按钮上的内容改为省市县
				  $("#region-button-value").empty();
				  
				  if(provinceId == cityId){
					  $("#region-button-value").append(provinceName  );
				  } else {
					  $("#region-button-value").append(provinceName + "&nbsp;&nbsp;" + cityName  );    
				  }
				  
				  //根据考生所在省份获得该省份学校学校
				  var url="${pageContext.servletContext.contextPath}/student/loadSchools";
				  $.post(url,
					  {
						  place:cityId,
					  },
					  
					  // 把该省的学校都放到 选择学校 的弹出框内
					  function(data,status){
						 if("success" == status){
							 var schoolCon = "" ;
							 for(var i=0 ;i<data.length ;i++){
								  schoolCon = schoolCon + "<input type='radio' value='"+data[i].id+"' name='schoolcoulmn' schoolname='"+data[i].name+"' >&nbsp;"+data[i].name+"<br/>";
							 }
							 
							 $("#chooseSchoolText").empty();
							 
							 $("#chooseSchoolText").append(schoolCon);
						 }
				    });
			     });
			  
			     // 选择学校后点击确定按钮
	             $("#schoolSubmit").click(function(){
	            	 
	                var schoolcoulmn = $("input[name='schoolcoulmn']:checked").val() ;
	                
	                if(schoolcoulmn == undefined){
	                	alert("请选择学校!");
	                	$("#schoolId").val(0);
	                	return ;
	                }
	                
	                $("#schoolId").val(schoolcoulmn);
	                
	                $("#school-button-value").empty();
	                $("#school-button-value").append($("input[name='schoolcoulmn']:checked").attr("schoolname"));
	                
	             });
			  
             });
			
			
		</script>

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">选择所在地</h4>
				</div>
				<div class="modal-body">
                                        所在地
                    <br/><br/>
                                        省份：
                    <select name="province" id="province"
                        class="w79 input_select"
                        onchange="loadCities(this.options[this.options.selectedIndex].value);">
                            <option value="0">选择省份</option>
                    </select>
                    <br/><br/>
                                         城市：
                    <select name="city" id="city" class="w79 input_select" >
                         <option value="0">选择城市</option>
                    </select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="citySubmit" data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.chooseCity -->
	
	<!-- chooseSchool -->
	<div class="modal fade" id="chooseSchool" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">选择学校</h4>
				</div>
				<div class="modal-body" id="chooseSchoolText">请先选择学校所在地...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="schoolSubmit">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.chooseSchool -->
	
	<!-- chooseMajor -->
	<div class="modal fade" id="chooseMajor" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<script type="text/javascript">
			// 选择学院后加载学院相关专业
	        function loadMajor(parentcode){
	            var url="${pageContext.servletContext.contextPath}/student/loadMajors";
	            $.post(url,
	                 {
	                     parentCode:parentcode
	                 },
	                 
	                 function(data,status){
	                    if("success" == status){
	                        var majorCon = "<option value='0'>选择专业</option>" ;
	                        for(var i=0 ;i<data.length ;i++){
	                            majorCon = majorCon + "<option value='"+data[i].code+"' > "+data[i].name+"</option>";
	                        }
	                        
	                        $("#major").empty();
	                        
	                        $("#major").append(majorCon);
	                    }
	               });
	        }
			
	        $(document).ready(function(){
		        // 选择专业后点击确定按钮
	            $("#majorSubmit").click(function(){
	                
	               var majorCode = $("#major").val();
	               var majorName = $("#major").find("option:selected").text();
	               
	               var parentMajorName = $("#parentMajor").find("option:selected").text();
	               
	               if(majorCode == 0){
	                   alert("请选择专业!");
	                   return ;
	               }
	               
	               $("#majorCode").val(majorCode);
	               
	               $("#major-button-value").empty();
	               $("#major-button-value").append(parentMajorName + "&nbsp;" + majorName);
	               
	            });
	        });
		</script>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">选择报考专业</h4>
				</div>
				<div class="modal-body">
				        报考专业
                    <br/><br/>
                                        学院：
                    <select name="parentMajor" id="parentMajor"
                        class="w79 input_select"
                        onchange="loadMajor(this.options[this.options.selectedIndex].value);">
                        <option value="0">选择学院</option>
					    <c:forEach var="parentMajor" items="${parentMajorList}">
					        <option value="${parentMajor.code}" >${parentMajor.name }</option>
					    </c:forEach>
                    </select>
                    <br/><br/>
                                         专业：
                    <select name="major" id="major" class="w79 input_select" >
                         <option value="0">选择专业</option>
                    </select>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="majorSubmit">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.chooseMajor -->

	<!-- Modal -->
	<div class="modal fade" id="mydetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">活动详情</h4>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
</body>
</html>
