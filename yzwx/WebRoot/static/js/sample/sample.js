function fncSearch() {
	JCommonUtil.clearMessageArea();
	var obj={};
	obj['code']=$('#regionCode').val();
	$.ajax({
		url : searchUrl,
		type:'POST',
		data:obj,
		dataType:'json',
		cache:false,
		success:function(results){
			
			JCommonUtil.showAjaxMessages(results.messages);
			
			var resultTable=$('#resultTable');
			resultTable.empty();
			
			var arr = eval(results.data);
			$.each(arr, function (i, n) {
				var tr='<tr>';
				tr+='<td align="center" width="170"><font>'+n.code+'</font></td>';
				tr+='<td align="center" width="170"><font>'+n.name+'</font></td></tr>';
				$(tr).appendTo(resultTable);
			});
		}
		
	});
}