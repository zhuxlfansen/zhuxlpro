
$(document).ready(function() {
	var td01="",td02="",td03="",td04="",td10="",td11="",td20="",td21="",td30="",td31="",td40="",td41="",td50="",td51="",td60="",td61="",td70="",td71="";
	for(var i=0;i<expList.length;i++){
		td01="<td>"+expList[i].name+"</td>";
		if(expList[i].isExp>0){
			td02="<td>是</td>";
		}else{
			td02="<td>--</td>";
		}
		td03="<td>"+expList[i].deptName+"</td>";
		/*if(expList[i].isSep>0){
			td04="<td>是</td>";
		}else{
			td04="<td>--</td>";
		}*/
		if(dutyList.length>0){
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==0&&dutyList[j].week==1&&dutyList[j].expertId==expList[i].id){
					td10="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,1,0,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td10="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,1,0,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==1&&dutyList[j].week==1&&dutyList[j].expertId==expList[i].id){
					td11="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,1,1,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td11="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,1,1,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==0&&dutyList[j].week==2&&dutyList[j].expertId==expList[i].id){
					td20="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,2,0,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td20="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,2,0,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==1&&dutyList[j].week==2&&dutyList[j].expertId==expList[i].id){
					td21="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,2,1,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td21="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,2,1,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==0&&dutyList[j].week==3&&dutyList[j].expertId==expList[i].id){
					td30="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,3,0,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td30="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,3,0,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==1&&dutyList[j].week==3&&dutyList[j].expertId==expList[i].id){
					td31="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,3,1,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td31="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,3,1,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==0&&dutyList[j].week==4&&dutyList[j].expertId==expList[i].id){
					td40="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,4,0,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td40="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,4,0,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==1&&dutyList[j].week==4&&dutyList[j].expertId==expList[i].id){
					td41="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,4,1,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td41="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,4,1,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==0&&dutyList[j].week==5&&dutyList[j].expertId==expList[i].id){
					td50="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,5,0,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td50="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,5,0,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==1&&dutyList[j].week==5&&dutyList[j].expertId==expList[i].id){
					td51="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,5,1,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td51="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,5,1,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==0&&dutyList[j].week==6&&dutyList[j].expertId==expList[i].id){
					td60="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,6,0,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td60="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,6,0,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==1&&dutyList[j].week==6&&dutyList[j].expertId==expList[i].id){
					td61="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,6,1,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td61="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,6,1,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==0&&dutyList[j].week==7&&dutyList[j].expertId==expList[i].id){
					td70="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,7,0,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td70="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,7,0,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
			for(var j=0;j<dutyList.length;j++){
				if(dutyList[j].apm==1&&dutyList[j].week==7&&dutyList[j].expertId==expList[i].id){
					td71="<td style='background-color: #CC3300;cursor: pointer;color: white;text-align: center;' onclick='test(this,7,1,"+expList[i].id+");'>值班</td>";
					break;
				}else{
					td71="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,7,1,"+expList[i].id+");'>&nbsp;</td>";
				}
			}
		}else{
			td10="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,1,0,"+expList[i].id+");'>&nbsp;</td>";
			td11="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,1,1,"+expList[i].id+");'>&nbsp;</td>";
			td20="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,2,0,"+expList[i].id+");'>&nbsp;</td>";
			td21="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,2,1,"+expList[i].id+");'>&nbsp;</td>";
			td30="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,3,0,"+expList[i].id+");'>&nbsp;</td>";
			td31="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,3,1,"+expList[i].id+");'>&nbsp;</td>";
			td40="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,4,0,"+expList[i].id+");'>&nbsp;</td>";
			td41="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,4,1,"+expList[i].id+");'>&nbsp;</td>";
			td50="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,5,0,"+expList[i].id+");'>&nbsp;</td>";
			td51="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,5,1,"+expList[i].id+");'>&nbsp;</td>";
			td60="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,6,0,"+expList[i].id+");'>&nbsp;</td>";
			td61="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,6,1,"+expList[i].id+");'>&nbsp;</td>";
			td70="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,7,0,"+expList[i].id+");'>&nbsp;</td>";
			td71="<td style='background-color: #339999;cursor: pointer;color: white;text-align: center;' onclick='test(this,7,1,"+expList[i].id+");'>&nbsp;</td>";
		}
		 $("#tab").append("<tr>"+td01+td02+td03+td10+td11+td20+td21+td30+td31+td40+td41+td50+td51+td60+td61+td70+td71+"</tr>");
	}
})

function test(obj,week,apm,id){
/*     var bodyWidth = document.documentElement.clientWidth;   
    var bodyHeight =Math.max(document.documentElement.clientHeight,document.body.scrollHeight);       
    $("<div class='wrap'></div>").appendTo("body");$(".wrap").width(bodyWidth);$(".wrap").height(bodyHeight); 
    //document.getelementbyid(id).style.cursor="wait"; */
	$.ajax({
		  type: 'POST',
		  url: $("#path").val()+"/work/doDuty",
		  data: {"id":id,"apm":apm,"week":week},
		  success: function(data){
				if(data=="error"){
					alert("设置失败");
				}else{
					/* if($(obj).html()=="&nbsp;"){
						$(obj).css("background-color","#CC3300");
						$(obj).html("值班");
					}else{
						$(obj).css("background-color","#339999");
						$(obj).html("&nbsp;");
					} */
				}
			    //$(".wrap").remove();  
		  },
	});
    
	if($(obj).html()=="&nbsp;"){
		$(obj).css("background-color","#CC3300");
		$(obj).html("值班");
	}else{
		$(obj).css("background-color","#339999");
		$(obj).html("&nbsp;");
	}
	//alert("设置成功！");
	
}