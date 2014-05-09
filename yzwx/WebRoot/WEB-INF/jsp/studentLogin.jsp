<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="description" content="">
<meta name="author" content="">
<title>科大研招-考生信息</title>

<link href="static/commonCss/bootstrap_3.1.min.css" rel="stylesheet">
<script src="static/commonJs/jquery-1.10.2.min.js"></script>
<script src="static/commonJs/bootstrap-filestyle.min.js"> </script>
<script src="static/commonJs/bootstrap_3.1.min.js"></script>

<style type="text/css">
.star_p{color: red;}
.input-banner{width: 75px;}
.input-upload{width:64%;height:32}
</style>
</head>

<body>
<script type="text/javascript">
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    WeixinJSBridge.call('hideOptionMenu');
    });

function checkForm(){
	$.ajax({
		  type: 'POST',
		  url: "<%=path%>/mob/student/checkIdCardNum",
		  data: {"idCardNum":$("#idCardNum").val()},
		  success: function(data){
			  if(data=="error"){
					alert("该身份证已经注册过！");
					$("#idCardNum").val("");
				}
		  },
		  async:false
	});
	
	errorMsg = "";
    
    // 验证姓名
    name = $("#name").val().replace(/(^\s*)|(\s*$)/g, "").length;
    if (name >= 50) {
        errorMsg = errorMsg +"您输入的姓名过长...\n";
    }
    if (name == 0) {
        errorMsg = errorMsg +"请输入姓名...\n" ;
    }
    
 	// 验证身份证号
    idCardNum = $("#idCardNum").val().replace(/(^\s*)|(\s*$)/g, "").length;
    if (idCardNum >= 50) {
        errorMsg = errorMsg +"您输入的身份证号过长...\n";
    }
    if (idCardNum < 15) {
        errorMsg = errorMsg +"请输入正确的身份证号\n";
    }
    if (idCardNum == 0) {
        errorMsg = errorMsg +"请输入身份证号...\n" ;
    }
    
    // 验证手机
    contact = $("#contact").val().replace(/(^\s*)|(\s*$)/g, "");
    if((/^0?1[0-9][0-9]\d{8}$/.test(contact)) == false ){
        errorMsg = errorMsg +"请输入正确的手机号码...\n" ;
    }
    
    // 验证邮箱
    email = $("#email").val().replace(/(^\s*)|(\s*$)/g, "");
    
    if((/^[\w.-]+@([0-9a-zA-Z\w-]+\.)+[0-9a-zA-Z]{2,8}$/.test(email))==false ){
        errorMsg = errorMsg +"请输入正确的电子邮箱...\n" ;
    }
    
    // 验证学校
    schoolId = $("#schoolId").val().replace(/(^\s*)|(\s*$)/g, "");
    if(schoolId=="" || schoolId==0 ){
        errorMsg = errorMsg +"请选择所在学校...\n" ;
    }
    
    // 验证考生专业
    studentMajor = $("#studentMajor").val().replace(/(^\s*)|(\s*$)/g, "").length;
    if (studentMajor >= 50) {
        errorMsg = errorMsg +"您输入的专业名称过长...\n" ;
    }
    if (studentMajor == 0) {
        errorMsg = errorMsg +"请输入专业...\n" ;
    }

    //验证报考专业
     var majorcodess = $("input[name=majorcodes]");    
     if(majorcodess.length == 0){
         errorMsg = errorMsg +"请添加至少一个拟报考专业...\n" ;
     }
    
    // 验证成绩
    gpa = $("#gpa").val().replace(/(^\s*)|(\s*$)/g, "");
    
    /* if(gpa.length==0){
        errorMsg = errorMsg +"请输入加权平均成绩...\n";
    } */
    if(parseInt(gpa)>100){
        errorMsg = errorMsg +"成绩栏请输入0-100的成绩...例：92.56\n" ;
    }
    
    // 验证班级人数和班级排名
    classSize = $("#classSize").val().replace(/(^\s*)|(\s*$)/g, "");
    studentRank = $("#studentRank").val().replace(/(^\s*)|(\s*$)/g, "");
    
    if(classSize.length>0 || studentRank.length>0){
        if(  (/^[1-9][0-9]*$/g.test(classSize))==false || (/^[1-9][0-9]*$/g.test(studentRank))==false ){
            errorMsg = errorMsg +"班级人数和排名请输入正整数...\n" ;
        } else if( parseInt(studentRank)>parseInt(classSize) ){
            errorMsg = errorMsg +"输入的排名不能大于班级人数...\n" ;
        }
    }
    
    //验证图片格式 
     imgFile = $("#imgFile").val();
    if(imgFile!=null&&imgFile!=''){
        if (!/.(gif|jpg|png|bmp)$/.test(imgFile)) {
            errorMsg = errorMsg +"上传图片类型必须是gif,jpg,png,bmp中的一种...\n" ;
        }
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

function getBtnId(btnid) {
    $("#majorbtnid").val(btnid);
}

function majorMinus(obj){
    $(obj).prev().remove();
    $(obj).remove();
    var id = $(obj).attr("id");
    //alert(id);
    $("#"+id+"v").remove();
}

var majorNum = 1;
$(document).ready(function(){
//       $("#imgFileBtn").click(function(){
//           $("#imgFile").click();
//       });
      $("#addMajorBtn").click(function(){
          if(majorNum ==1 ){
              var len =  "${fn:length(majorcodes)}";
              if(len >0){
                    majorNum="${fn:length(majorcodes)}";
              }
          }
          
          if(majorNum>4){
              alert("拟报考专业可选不超过5个 ");
              return;
          }
          
          $("#majorsdiv").append("<button class='form-control btn btn-default' style='width: 70%' data-toggle='modal' data-target='#chooseMajor' id='major-button-value"+majorNum+"' onclick='getBtnId(this.id)'>点击选择专业</button>");
          $("#majorsdiv").append("<button type='button' class='btn btn-primary' style='width: 30%' onclick='majorMinus(this)' id='major-button-value"+majorNum+"_' >删除</button>");
          majorNum++;
      });
});


function checkIdCardExist(){
	idCardNum = $("#idCardNum").val().replace(/(^\s*)|(\s*$)/g, "").length;
	if (idCardNum < 15) {
        alert("请输入正确的身份证号!");
        return false;
    }
	$.post("<%=path%>/mob/student/checkIdCardNum",{"idCardNum":$("#idCardNum").val()},function(data){
		if(data=="error"){
			alert("该身份证已经注册过！");
			$("#idCardNum").val("");
			return false;
		}else{
			return true;
		}
	});	
}
</script>
    <div class="col-md-12" style="padding-left: 0px;padding-right: 0px;">
        <div class="panel panel-primary">
            <div class="panel-body">
                <form action="${pageContext.servletContext.contextPath}/mob/student/submitLogin" method="post" onsubmit="return checkForm();" enctype="multipart/form-data">
                    <input name="wxCode" type="hidden" value="${student.wxCode }" />
                    <input name="step" type="hidden" value="${step}" />
                    <input name="eventKey" type="hidden" value="${eventKey}" />
                    <div class="input-group" style="margin-bottom: 5px">
                        <span class="input-group-addon"><div class="input-banner" >姓名<font class="star_p" >*</font></div></span>
                        <input type="text" style="text-align: center;" class="form-control" placeholder="真实姓名" name="name" id="name" value="${student.name }"/>
                    </div>
                    <div class="input-group" style="margin-bottom: 5px">
                        <span class="input-group-addon"><div class="input-banner" >手机<font class="star_p" >*</font></div></span>
                        <input type="text" style="text-align: center;" class="form-control" placeholder="请输入11位的数字手机号码" name="contact" id="contact" value="${student.contact }" />
                    </div>
                    <div class="input-group" style="margin-bottom: 5px">
                        <span class="input-group-addon"><div class="input-banner" >身份证号<font class="star_p" >*</font></div></span>
                        <input type="text" style="text-align: center;" class="form-control" placeholder="身份证号" name="idCardNum" id="idCardNum" onblur="checkIdCardExist();" value="${student.idCardNum }"/>
                    </div>
                    <div class="input-group" style="margin-bottom: 5px">
                        <span class="input-group-addon"><div class="input-banner" >邮箱<font class="star_p" >*</font></div></span>
                        <input type="text" style="text-align: center;" class="form-control" placeholder="xxx@xxxx.xxxx" name="email" id="email" value="${student.email }" />
                    </div>
                    <div class="input-group" style="margin-bottom: 5px">
                        <span class="input-group-addon"><div class="input-banner" >地址<font class="star_p" >*</font></div></span>
                        <c:if test="${city!=null }">
                            <c:if test="${city.name!=province.name }">
	                            <button class="form-control btn btn-default "  data-toggle="modal" id="region-button-value"
	                                data-target="#chooseCity">${province.name }&nbsp;&nbsp;${city.name }</button>
                            </c:if>
                            <c:if test="${city.name==province.name }">
                                <button class="form-control btn btn-default "  data-toggle="modal" id="region-button-value"
                                    data-target="#chooseCity">${city.name }</button>
                            </c:if>
                        </c:if>
                        <c:if test="${city==null }">
                            <button class="form-control btn btn-default "  data-toggle="modal" id="region-button-value"
                                data-target="#chooseCity">点击选择所在地</button>
                        </c:if>
                    </div>
                    <div class="input-group" style="margin-bottom: 5px">
                        <span class="input-group-addon"><div class="input-banner" >学校<font class="star_p" >*</font></div></span>
                        <c:if test="${school!=null }">
                            <button class="form-control btn btn-default " data-toggle="modal"  id="school-button-value"
                                data-target="#chooseSchool">${school.name}</button>
                        </c:if>
                        <c:if test="${school==null }">
                            <button class="form-control btn btn-default " data-toggle="modal"  id="school-button-value"
                                data-target="#chooseSchool">请选择学校</button>
                        </c:if>
                    </div>
                    <input type="hidden" name="schoolId" id="schoolId" value=${student.school.id } />
                    <div class="input-group" style="margin-bottom: 5px">
                        <span class="input-group-addon"><div class="input-banner" >所学专业<font class="star_p" >*</font></div></span>
                        <input type="text" style="text-align: center;" class="form-control" placeholder="Major" id="studentMajor" name="studentMajor" value="${student.studentMajor}"/>
                    </div>
                    
                    <!-- 拟报考专业 -->
                    <div style="margin-bottom: 5px">
                        <div class="input-group" id="majorsdiv">
                            <span class="input-group-addon"><div class="input-banner" >拟报考专业<font class="star_p" >*</font></div></span>
                            
                            <c:if test="${majorcodes!=null }">
                               <c:forEach  var="major" items="${majorcodes}" varStatus="st">
                                   <c:if test="${st.index==0 }">
                                        <button class="form-control btn btn-default " style="width: 70%" data-toggle="modal" id="major-button-value0"
                                            data-target="#chooseMajor" onclick="getBtnId(this.id)">${major.mname }</button>
                                        <button type="button" class="btn btn-primary" style="width: 30%" id="addMajorBtn">添加</button>
                                    </c:if>
                                    <c:if test="${st.index!=0 }">
                                        <button class="form-control btn btn-default " style="width: 70%" data-toggle="modal" id="major-button-value${st.index }"
                                            data-target="#chooseMajor" onclick="getBtnId(this.id)">${major.mname }</button>
                                        <button type='button' class='btn btn-primary' style='width: 30%;' onclick='majorMinus(this)' id='major-button-value${st.index }_' >删除</button>
                                    </c:if>
                               </c:forEach>
                            </c:if>
                            
                            <c:if test="${majorcodes==null }">
                            <button class="form-control btn btn-default " style="width: 70%" data-toggle="modal" id="major-button-value0"
                                data-target="#chooseMajor" onclick="getBtnId(this.id)">点击选择专业</button>
                            <button type="button" class="btn btn-primary" style="width: 30%" id="addMajorBtn">添加</button>
                            </c:if>
                        </div>
                    </div>
                    拟报考专业可选不超过5个
                    <div id="addMajorDiv" >
                        <c:if test="${majorcodes!=null }">
                            <c:forEach  var="major" items="${majorcodes}" varStatus="st">
                                <input type='hidden' name='majorcodes' value='${major.mcode }' id='major-button-value${st.index }_v'/>
                            </c:forEach>
                        </c:if>
                    </div>
                    
                    
                    <div class="input-group" style="margin-bottom: 5px">
                        <span class="input-group-addon"><div class="input-banner" >加权平均分</div></span>
                        <input type="text" style="text-align: center;" class="form-control" placeholder="范围：0-100 例：89.76" name="gpa" id="gpa" onkeyup="clearNoNum(this)" value="${student.gpa}" />
                    </div>
                    <div class="input-group" style="margin-bottom: 5px">
                        <span class="input-group-addon"><div class="input-banner" >班排名/人数</div></span>
                        <div class="form-control" align="center">
                            <input type="text" style="text-align: center;" size="5" placeholder="排名" name="studentRank" id="studentRank" value="${student.studentRank}"/>/
                            <input type="text" style="text-align: center;" size="5" placeholder="人数" name="classSize" id="classSize" value="${student.classSize}"/>
                        </div>
                    </div>
                    <div class="input-group" style="margin-bottom: 5px">
                       <span class="input-group-addon"><div class="input-banner" >上传成绩单</div></span>
                       <div class="form-control" >
                        <input type="file" class="filestyle" data-icon="false" data-classInput="input-upload" data-classButton="btn btn-primary" data-buttonText="上传" name="imgFile" id="imgFile">
                        <script type="text/javascript">
                        $(":file").filestyle({icon: false,classButton: "btn btn-primary",buttonText: "上传",classInput: "input-upload"});
                        </script>
                       </div>
                    </div>
                    上传文件类型:gif，jpg，png，bmp
                    <br/>
                    注意：<font class="star_p" >*</font>为必填项
                    <br/><br/>
<!--                     <p ><a href="http://mp.weixin.qq.com/s?__biz=MzA4NDI0OTYzMA==&mid=10000009&idx=1&sn=e9ea2ee6860d79eccc41b068798248f2#rd">关于科大研招微信平台</a></p> -->
                    <button class="form-control btn btn-primary " type="submit">提交</button>
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
            province = "${province.id}";
            city = "${city.id}";
            schoolName = "${school.name}";
            
            $(document).ready(
                function loadAddressMsg() {
                    loadProvinces();
                    if(province != null && province != ""){
                        loadCities(province);
                    }
                    if(city != null && city != ""){
                        //根据考生所在省份获得该省份学校学校
                        url="${pageContext.servletContext.contextPath}/mob/student/loadSchools";
                        $.post(url,
                            {
                                place:city,
                            },
                            
                            // 把该市的学校都放到 选择学校 的弹出框内
                            function(data,status){
                               if("success" == status){
                                   schoolCon = "" ;
                                   for(var i=0 ;i<data.length ;i++){
                                	   if(data[i].name==schoolName){
	                                        schoolCon = schoolCon + "<input type='radio' checked='checked'  value='"+data[i].id+"' name='schoolcoulmn' schoolname='"+data[i].name+"' >&nbsp;"+data[i].name+"<br/>";
                                	   }
                                	   if(data[i].name!=schoolName){
                                		   schoolCon = schoolCon + "<input type='radio' value='"+data[i].id+"' name='schoolcoulmn' schoolname='"+data[i].name+"' >&nbsp;"+data[i].name+"<br/>";
                                	   }
                                   }
                                   $("#chooseSchoolText").empty();
                                   $("#chooseSchoolText").append(schoolCon);
                               }
                          });
                        
                    }
                }
            );
            
            datas = new Region();
            provinces=datas.provinces;
            cities=datas.cities;
            
            //获取省信息
            function loadProvinces(){
                for ( i in provinces) {
                    if (i == province) {
                        option = new Option(provinces[i], i, false, true);
                    } else {
                        option = new Option(provinces[i], i);
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
                    for ( i in cities[obj]) {
                        option = new Option(cities[obj][i], i);
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
                  provinceId = $("#province").val();
                  provinceName = $("#province").find("option:selected").text();
                  
                  cityId = $("#city").val();
                  cityName = $("#city").find("option:selected").text();
                  
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
                  url="${pageContext.servletContext.contextPath}/mob/student/loadSchools";
                  $.post(url,
                      {
                          place:cityId,
                      },
                      
                      // 把该省的学校都放到 选择学校 的弹出框内
                      function(data,status){
                         if("success" == status){
                             schoolCon = "" ;
                             for(i=0 ;i<data.length ;i++){
                                  schoolCon = schoolCon + "<input type='radio'  value='"+data[i].id+"' name='schoolcoulmn' schoolname='"+data[i].name+"' >&nbsp;"+data[i].name+"<br/>";
                             }
                             
                             $("#chooseSchoolText").empty();
                             
                             $("#chooseSchoolText").append(schoolCon);
                         }
                    });
                 });
                
                 // 选择学校后点击确定按钮
                 $("#schoolSubmit").click(function(){
                     
                    schoolcoulmn = $("input[name='schoolcoulmn']:checked").val() ;
                    
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
        </div>
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
        </div>
    </div>
    <!-- /.chooseSchool -->
    
    <!-- chooseMajor -->
    <div class="modal fade" id="chooseMajor" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <input type="hidden" id="majorbtnid" value=""/>
        <script type="text/javascript">
            // 选择学院后加载学院相关专业
            function loadMajor(parentcode){
                url="${pageContext.servletContext.contextPath}/mob/student/loadMajors";
                $.post(url,
                     {
                         parentCode:parentcode
                     },
                     
                     function(data,status){
                        if("success" == status){
                            majorCon = "<option value='0'>选择专业</option>" ;
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
                    
                   majorCode = $("#major").val();
                   majorName = $("#major").find("option:selected").text();
                   
                   parentMajorName = $("#parentMajor").find("option:selected").text();
                   
                   if(majorCode == 0){
                       alert("请选择专业!");
                       return ;
                   }
                   
                   var majorcodess = $("input[name=majorcodes]");    
                   for (var i = 0; i < majorcodess.length; i++) {
                       var code = $(majorcodess[i]).val();  
                       if(code==majorCode){
                           alert("您选择的拟报考专业重复了!");
                           return ;
                       }
                   }
                   
                   btnId = $("#majorbtnid").val();
                   //$("#majorCode").val(majorCode);
                   $("#"+ btnId +"_v").remove();
                   
                   $("#addMajorDiv").append("<input type='hidden' name='majorcodes' value='"+majorCode+"' id='"+btnId+"_v'/>");
                   
                   $("#"+btnId).empty();
                   $("#"+btnId).append(majorName);
                   
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
        </div>
    </div>
    <!-- /.chooseMajor -->

</body>
</html>
