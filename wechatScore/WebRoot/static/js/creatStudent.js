$(document).ready(function () {
 	
	var data = [
	{stuId:'20140101',stuName: '王飞',stuGender: '男', stuGrade:'2014', stuClass:'1'}
	];

	$('#excel').handsontable({
		data: data,
		minSpareRows: 3,
		colHeaders: true, 
		colHeaders:['学号','姓名','性别','年级','班级'],
		stretchH: 'all',
		columns: [
              {data: "stuId",type: 'numeric'},
              {data: "stuName",type: 'text'},
              {data: "stuGender",type:'text'},
              {data: "stuGrade",type:'numeric'},
              {data:"stuClass",type:'numeric'}
            ],
         contextMenu: true
  });
  
  function bindDumpButton() {
      $('body').on('click', 'button[name=dump]', function () {
    	JCommonUtil.clearMessageArea();
        dump = $(this).data('dump');
        $container = $(dump);
        json =SerializeJsonToStr($container.handsontable('getData'));
        chartData = eval('('+json+')');
        $.ajax({
    		url:creatStudentUrl,
    		type:'POST',
    		data:JSON.stringify(chartData),
    		contentType: "application/json; charset=utf-8",
    		dataType:'json',
    		cache:false,
    		success:function(results){
    			if(results.status=='OK') {
    				JCommonUtil.showAjaxMessages(results.messages);
    			}
    		}
    	});
      });
    }
  bindDumpButton();

});

function SerializeJsonToStr(oJson) {

	if (typeof (oJson) == typeof (false)) {
		return oJson;
	}
	if (oJson == null) {
		return "null";
	}
	if (typeof (oJson) == typeof (0))
		return oJson.toString();
	if (typeof (oJson) == typeof ('') || oJson instanceof String) {
		oJson = oJson.toString();
		oJson = oJson.replace(/\r\n/, '\\r\\n');
		oJson = oJson.replace(/\n/, '\\n');
		oJson = oJson.replace(/\"/, '\\"');
		return '"' + oJson + '"';
	}
	if (oJson instanceof Date) {
		return "parseDate('" + oJson.format("yyyy-MM-dd") + "')";
	}

	if (oJson instanceof Array) {
		var strRet = "[";
		for ( var i = 0; i < oJson.length; i++) {
			var value = SerializeJsonToStr(oJson[i]);
			if (value != "null") {
				if (strRet.length > 1) {
					strRet += ",";
				}
				strRet += value;
			}
		}
		strRet += "]";
		return strRet;
	}

	if (typeof (oJson) == typeof ({})) {
		var strRet = "{";
		var rowFlag = false;
		for ( var p in oJson) {
			if (strRet.length > 1)
				strRet += ",";
			var value = SerializeJsonToStr(oJson[p]);
			if (value != null && value != "null") {
				strRet += '"' + p.toString() + '":' + value;
				rowFlag = true;
			}
		}
		strRet += "}";
		if (!rowFlag) {
			return "null";
		}
		return strRet;
	}
}

function searchStu() {
	$('#pagingStuId').val($('#searchStuId').val());
	$('#pagingStu').val($('#searchStuName').val());
	$('#pagingStuGrade').val($('#searchStuGrade').val());
	$('#pagingStuClass').val($('#searchStuClass').val());
	
	obj={};
	obj['searchStuId'] = $('#searchStuId').val();
	obj['searchStuName'] = $('#searchStuName').val();
	obj['searchStuGrade'] = $('#searchStuGrade').val();
	obj['searchStuClass'] = $('#searchStuClass').val();
	obj['curPage'] = 1;
	obj['pageSize'] = pageSize;
	
	doAjax(obj);
	
//	$.ajax({
//		url:searchStudentUrl,
//		type:'POST',
//		data:obj,
//		dataType:'json',
//		cache:false,
//		success:function(results){
//			resultTable=$('#resultTable');
//			resultTable.empty();
//			pagingDiv = $('#pagingDiv');
//			pagingDiv.empty();
//			head = '<tr><th style="padding-left: 20px;">学号</th><th>姓名</th><th>性别</th><th>年级</th><th>班级</th><th style="padding-right: 20px;">操作</th></tr>';
//			$head.appendTo(resultTable);
//			pagingResult = eval(results);
//			$.each(pagingResult.Result, function (i, n) {
//				tr = '<tr><td  style="padding-left: 20px;">'+n.stuId+'</td>';
//				tr+='<td>'+n.stuName+'</td>';
//				tr+='<td>'+n.stuGender+'</td>';
//				tr+='<td>'+n.stuGrade+'</td>';
//				tr+='<td>'+n.stuClass+'</td>';
//				tr+='<td><a href="#">冻结账户</a></td>';
//				$(tr).appendTo(resultTable);
//			});
//			paging = '<div class="LoopPage">';
//			paging+='<p>第<strong>'+pagingResult.curPage+'</strong>页<strong>'+'</strong>共<strong>'+pagingResult.pageCount+'</strong>页<strong>'+pagingResult.count+'</strong>条记录&nbsp;&nbsp;转到第<input type="text" class="TxtInp" value="'+pagingResult.curPage+'" name="curPage" id="curPage"/>页<input type="submit" class="goTo" value="go" name="" class="Btn" onclick="paging('+pagingResult.pageCount+');\" /></p>';
//			paging+='<ul><li><a href="javascript:paging(1,"'+pagingResult.pageCount+'");" title="第一页">&lt;&lt;</a></li>';
//			paging+='<li><a href="javascript:paging("'+(pagingResult.curPage-1)+'","'+pagingResult.pageCount+'");" title="上一页">&lt;</a></li>';
//			if(pagingResult.pageCount<=6){
//				//全部显示
//				paging+=printNum(1,pagingResult.Count,pagingResult);
//			}else{
//				if(pagingResult.curPage<=3){
//					paging+=printNum(1,6,pagingResult);
//				}else if(pagingResult.curPage>3&&pagingResult.curPage<pagingResult.pageCount-3){
//					paging+=printNum(pagingResult.curPage-2,pagingResult.curPage+3,pagingResult);
//				}else{
//					paging+=printNum(pagingResult.pageCount-6,pagingResult.pageCount,pagingResult);
//				}
//			}
//			paging+='<li><a href="javascript:paging("'+(pagingResult.curPage+1)+'","'+pagingResult.pageCount+'");" title="下一页">&gt;</a></li>';
//			paging+='<li><a href="javascript:paging("'+pagingResult.pageCount+'","'+pagingResult.pageCount+'");" title="末页">&gt;&gt;</a></li></ul></div>';
//			$paging.appendTo(pagingDiv);
//		}
//	});
}

function printNum(beginNum,endNum,pagingResult) {
	print = "";
	for(var i=beginNum;i<=endNum;i++){
		if(i==pagingResult.curPage){
			print+='<li><a href="javascript:doPaging('+i+','+pagingResult.pageCount+');" title=""'+i+'"" class="ExtLoopLink">"'+i+'"</a></li>';
		}else{
			print+='<li><a href="javascript:doPaging('+i+','+pagingResult.pageCount+');" title=""'+i+'"">"'+i+'"</a></li>';
		}
	}
	return print;
}

function doAjax(obj) {
	$.ajax({
		url:searchStudentUrl,
		type:'POST',
		data:obj,
		dataType:'json',
		cache:false,
		success:function(results){
			resultTable=$('#resultTable');
			resultTable.empty();
			pagingDiv = $('#pagingDiv');
			pagingDiv.empty();
			head = '<tr><th style="padding-left: 20px;">学号</th><th>姓名</th><th>性别</th><th>年级</th><th>班级</th><th style="padding-right: 20px;">操作</th></tr>';
			$(head).appendTo(resultTable);
			pagingResult = eval(results);
			$.each(pagingResult.result, function (i, n) {
				tr = '<tr><td  style="padding-left: 20px;">'+n.stuId+'</td>';
				tr+='<td>'+n.stuName+'</td>';
				tr+='<td>'+n.stuGender+'</td>';
				tr+='<td>'+n.stuGrade+'</td>';
				tr+='<td>'+n.stuClass+'</td>';
				tr+='<td><a href="#">冻结账号</a></td>';
				$(tr).appendTo(resultTable);
			});
			paging = '<div class="LoopPage">';
			paging+='<p>第<strong>'+pagingResult.curPage+'</strong>页<strong>'+'</strong>共<strong>'+pagingResult.pageCount+'</strong>页<strong>'+pagingResult.count+'</strong>条记录&nbsp;&nbsp;转到第<input type="text" class="TxtInp" value="'+pagingResult.curPage+'" id="curPageInput"/>页<input type="button" class="goTo" value="go" class="Btn" onclick="goPaging('+pagingResult.pageCount+');" /></p>';
			paging+='<ul><li><a href="javascript:doPaging(1,'+pagingResult.pageCount+');" title="第一页">&lt;&lt;</a></li>';
			paging+='<li><a href="javascript:doPaging('+(pagingResult.curPage-1)+','+pagingResult.pageCount+');" title="上一页">&lt;</a></li>';
			if(pagingResult.pageCount<=6){
				//全部显示
				paging+=printNum(1,pagingResult.Count,pagingResult);
			}else{
				if(pagingResult.curPage<=3){
					paging+=printNum(1,6,pagingResult);
				}else if(pagingResult.curPage>3&&pagingResult.curPage<pagingResult.pageCount-3){
					paging+=printNum(pagingResult.curPage-2,pagingResult.curPage+3,pagingResult);
				}else{
					paging+=printNum(pagingResult.pageCount-6,pagingResult.pageCount,pagingResult);
				}
			}
			paging+='<li><a href="javascript:doPaging('+(pagingResult.curPage+1)+','+pagingResult.pageCount+');" title="下一页">&gt;</a></li>';
			paging+='<li><a href="javascript:doPaging('+pagingResult.pageCount+','+pagingResult.pageCount+');" title="末页">&gt;&gt;</a></li></ul></div>';
			$(paging).appendTo(pagingDiv);
		}
	});
}

function goPaging(pageCount){
	doPaging(Number($('#curPageInput').val()),pageCount);
}

function doPaging(curPage,pageCount) {
	obj={};
	obj['searchStuId'] = $('#pagingStuId').val();
	obj['searchStuName'] = $('#pagingStuName').val();
	obj['searchStuGrade'] = $('#pagingStuGrade').val();
	obj['searchStuClass']= $('#pagingStuClass').val();
	obj['curPage'] = curPage;
	obj['pageSize'] = pageSize;
	
	doAjax(obj);
}
