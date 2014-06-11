$(document).ready(function () {
	$('button[name=dump]').hide();
});

function chooseSubject(){
	excelDiv = $('#excel');
//	excelDiv.empty();
	
	headers=['学号','成绩'];
	columns=[{data: "stuId",type: 'numeric'},
             {data: "score",type: 'numeric'}];
	
	if($("#selectSubject").val()!='') {
		
		obj = {};
		obj['subjectId'] = $("#selectSubject").val();
		$.ajax({
			url:getQuestionTypeUrl,
			type:'POST',
			data:obj,
			dataType:'json',
			cache:false,
			success:function(results){
				arr = eval(results);
				$.each(arr, function (i, n) {
					headers.push(n.questionTypeName);
					columns.push({data:"scoreDetail["+i+"]",type:'numeric'});
				});
				
				excelDiv.handsontable({
					minSpareRows: 3,
					colHeaders: true,
					colHeaders:headers,
					stretchH :'all',
					columns: columns,
			        contextMenu: true
			  });
			}
		});
		
		$('button[name=dump]').show();
	} else {
		$('button[name=dump]').hide();
	}
}

function bindDumpButton(){
	JCommonUtil.clearMessageArea();
	dump = $('button[name=dump]').data('dump');
    $container = $(dump);
    json =SerializeJsonToStr($container.handsontable('getData'));
    alert(json);
    chartData = eval('('+json+')');
    obj = {};
    obj ['examName'] = $("#examName").val();
    obj['selectSubject'] = $("#selectSubject").val();
    obj['inputScore'] = JSON.stringify(chartData);
    $.ajax({
		url:inputScoreUrl,
		type:'POST',
		data:obj,
		contentType: "application/json; charset=utf-8",
		dataType:'json',
		cache:false,
		success:function(results){
			if(results.status=='OK') {
				JCommonUtil.showAjaxMessages(results.messages);
			}
		}
	});
}

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