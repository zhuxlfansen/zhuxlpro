/**
 * 定义echart对象
 */
var myChart;
var path=$("#path").val();
/**
 * 满意度统计
 * @param url
 */
function showBarChart(url){
	myChart.clear;
	myChart.dispose;
	drawBarChart(url);
}

/**
 * 将图表生成为图片
 */
function saveImg(){
	var imgObj = myChart.getImage("png");
	$("#imgDIV").html("<img src='"+imgObj.src+"' />");
}
/**
 * 实例化满意度统计图表
 * @param url
 */
function drawBarChart(url) {
	myChart = echarts.init(document.getElementById('main'));
	$.ajax({
		url : url,
		type : 'POST',
		data : {'startTime':$("#startTime").val(),'endTime':$("#endTime").val()},
		dataType : 'json',
		cache : false,
		success : function(results) {
			var arr = eval(results);
			var titleArr = new Array();
			var sfArr = new Array();
			var stArr = new Array();
			$.each(arr, function(i, n) {
				titleArr.push(n.name);
				sfArr.push(n.satisfaction);
				stArr.push(n.student);
			});
			myChart.showLoading({text:"正在加载，请稍候..."});
			myChart.setOption({
				title : {text: '活动满意度统计',subtext: '点击单个活动查询评论列表'},
			    color:['#87cefa'],
			    dataZoom:{show:true,orient:'vertical',x:930,width: 20,backgroundColor: 'rgba(221,160,221,0.5)',dataBackgroundColor: 'rgba(138,43,226,0.5)',fillerColor: 'rgba(38,143,26,0.6)',handleColor: 'rgba(128,43,16,0.8)'},
			    tooltip : {trigger: 'axis'},
			    toolbox: {show : true,feature : {dataView : {readOnly: true},magicType:['line', 'bar'],restore : true}},
			    calculable :false,
			    grid:{x:300},
			    xAxis : [{type : 'value',max:5,boundaryGap : [0, 0.01]}],
			    yAxis : [{type : 'category',data : titleArr}],
			    series : [{name:'满意度',type:'bar',data:sfArr}]
			});
			myChart.on("click", function(param) {
				var activityName=param.name;
				$.ajax({
					url : $("#path").val()+"/chart/suggestionList",
					type : 'POST',
					data : {'activityName':activityName},
					dataType : 'json',
					cache : false,
					success : function(r) {
						var arr = eval(r);
						$("#sugDIV").html("");
						$("#sugDIV").html("<h4>"+activityName+"</h4><p>评论列表</p>");
						var li="";
						$.each(arr, function(i, n) {
							li+="<li style='margin-bottom: 10px'><span class='label label-info'>"+n.studentName+" / "+n.schoolName+" / "+n.majorName+"</span><label>"+n.suggestion+"</label></li>"
						});
						$("#sugUL").html("");
						$("#sugUL").html(li);
					}
				})
			}
		)}
	});
}

/**
 * 统计类型
 * @param obj
 */
function buttonClick(obj) {
	if(obj.id=="studentGPA"){
		$("#btnGroup").html("<button class='btn btn-info' onclick='scoreButtonClick(this);' id='gpa'>按加权平均成绩统计</button>"+
				"<button class='btn' onclick='scoreButtonClick(this);' id='rank'>按班级成绩排名统计</button>");
	}else{
		$("#btnGroup").html("");
	}
	$("#chartTypeBtnGroup button").attr("class", "btn");
	$(obj).attr("class", "btn btn-info");
	myChart.clear;
	myChart.dispose;
	$("#chartType").val(obj.id);
	drawPieChart(path+"/chart/"+obj.id,$("#activityId").val());
}

/**
 * 成绩类型统计
 * @param obj
 */
function scoreButtonClick(obj){
	$("#btnGroup button").attr("class", "btn");
	$(obj).attr("class", "btn btn-info");
	var chartType=obj.id=="gpa"?"studentGPA":"studentRank";
	myChart.clear;
	myChart.dispose;
	$("#chartType").val(chartType);
	drawPieChart(path+"/chart/"+chartType,$("#activityId").val());
}

/**
 * 考生参与活动统计
 * @param url
 * @param activityId
 */
function drawPieChart(url,activityId) {
	
	myChart = echarts.init(document.getElementById('main'));
	$.ajax({
		url : url,
		type : 'POST',
		data : {'activityId':activityId},
		dataType : 'json',
		cache : false,
		success : function(results) {
			var arr = eval(results);
			var title = new Array();
			var obj;
			var jsonArr = new Array();
			$.each(arr, function(i, n) {
				title.push(n.name);
				obj = {"name" : n.name,"value" : n.value};
				jsonArr.push(obj);
			});
			myChart.showLoading({text:"正在加载，请稍候..."});
			myChart.setOption({
						title : {text : '活动参与情况统计',x : 'center'},
						tooltip : {trigger : 'item',formatter : "{a} <br/>{b} : {c} ({d}%)"},
						legend : {orient : 'vertical',padding : [100, 0,0, 10 ],x : 'left',data : title},
						toolbox : {show : true,feature : {mark : true,dataView : {readOnly : true},restore : true}
						},
						calculable : true,
						series : [{type : 'pie',radius : [ 30,110 ],roseType : 'area',data : jsonArr}]
					});
			myChart.on("click", function(param) {
				//alert(param.id);
			})
		}

	});
}

/**
 * 查询活动列表
 */
function showArctivityList(){
	$.post(path+'/chart/queryActivityList',{startTime:$("#startTime").val(),endTime:$("#endTime").val()},function(data) {
		var arr = eval(data);
		var option="<option value=''>-所有已结束活动-</option>";
		$.each(arr, function (i, n) {option+="<option value='"+n.id+"'>"+n.name+"</option>";});
		$("#activityId").html(option);
		myChart.clear;
		myChart.dispose;
		drawPieChart(path+"/chart/"+$("#chartType").val(),$("#activityId").val());
	});
}

/**
 * 根据条件统计
 */
function showPieChart(){
	myChart.clear;
	myChart.dispose;
	drawPieChart(path+"/chart/"+$("#chartType").val(),$("#activityId").val());
}

/*
 * 判断时间格式
 */
function dateLimit(type){
	var start = $("#startTime").val();
	var end = $("#endTime").val();
	var todayDate =new Date().Format('yyyy-MM-dd');
	var dateArray=[];
	if(type=="start"){
		if(end==""){
			dateArray=['',todayDate];
		}else{
			dateArray=['',end];
		}
	}else if(type=="end"){
		if(start!=""){
			dateArray=[start,todayDate];
		}else{
			dateArray=['',todayDate];
		}
	}else{
		dateArray=['',todayDate];
	}
	return dateArray;
}

Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
