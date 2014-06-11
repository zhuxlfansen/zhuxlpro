     var tr0="<tr><th style='width: 16%;'>星期</th><th style='width: 42%;' >上午</th><th >下午</th></tr>";
     function tapChange(type){
    	 var str="";
		 var cl="";
    	 if(type=="zmzj"){
    		 $("#tapLable").html("知名专家<span class='caret'></span>");
    		 $("#tapValue").val("zmzj");
    		 for(var i=0;i<list1_1.length;i++){
    			if(i==0){
       				cl="class='active'";
       				$("#dept").val(list1_1[i].deptId);
       			}else{
       				cl="";
       			}
     		    str+="<li "+cl+"><a href='javascript:;' onclick='deptChange(this,"+list1_1[i].deptId+");'>"+list1_1[i].deptName+"</a></li>";
     		 }
      		 $("#navUL").html(str);
      		 $("#tab").html(tr0+buildTR());
    	 }else if(type=="nkzj"){
    		 $("#tapLable").html("内科专家<span class='caret'></span>");
    		 $("#tapValue").val("nkzj");
    		 $("#dept").val(-1);
    		 $("#navUL").html(" <li class='active'><a href='javascript:;' onclick='deptChange(this,-1);'>内科专家</a></li>");
    		 $("#tab").html(tr0+buildTR());
    	 }else if(type=="nkzk"){
    		 $("#tapLable").html("内科专科<span class='caret'></span>");
    		 $("#tapValue").val("nkzk");
    		 for(var i=0;i<list3_1.length;i++){
   			 	if(i==0){
       				cl="class='active'";
       				$("#dept").val(list3_1[i].deptId);
       			}else{
       				cl="";
       			}
   		        str+="<li "+cl+"><a href='javascript:;' onclick='deptChange(this,"+list3_1[i].deptId+");'>"+list3_1[i].deptName+"</a></li>";
   		     }
    		 $("#navUL").html(str);
    		 $("#tab").html(tr0+buildTR());
    	 }else if(type=="wkzk"){
    		 $("#tapLable").html("外科专科<span class='caret'></span>");
    		 $("#tapValue").val("wkzk");
    		 for(var i=0;i<list4_1.length;i++){
     			if(i==0){
     				cl="class='active'";
     				$("#dept").val(list4_1[i].deptId);
     			}else{
     				cl="";
     			}
    		    str+="<li "+cl+"><a href='javascript:;' onclick='deptChange(this,"+list4_1[i].deptId+");'>"+list4_1[i].deptName+"</a></li>";
    		 }
     		 $("#navUL").html(str);
     		 $("#tab").html(tr0+buildTR());
    	 }else if(type=="qt"){
    		 $("#tapLable").html("其他科室<span class='caret'></span>");
    		 $("#tapValue").val("qt");
    		 for(var i=0;i<list5_1.length;i++){
    			if(i==0){
      				cl="class='active'";
      				$("#dept").val(list5_1[i].deptId);
      			}else{
      				cl="";
      			}
    		    str+="<li "+cl+"><a href='javascript:;' onclick='deptChange(this,"+list5_1[i].deptId+");'>"+list5_1[i].deptName+"</a></li>";
    		 }
     		 $("#navUL").html(str);
     		 $("#tab").html(tr0+buildTR());
    	 }
     }
     
     function buildTR(){
    	 var tr="";
    	 var td10="";td11="",td20="",td21="",td30="",td31="",td40="",td41="",td50="",td51="",td60="",td61="",td70="",td71="";
    	 var deptId=$("#dept").val();
    	 
    	 var tapValue=$("#tapValue").val();
    	 var arr=new Array;
    	 if(tapValue=="zmzj"){
    		 arr=list1;
    	 }else if(tapValue=="nkzj"){
    		 arr=list2;
    	 }else if(tapValue=="nkzk"){
    		 arr=list3;
    	 }else if(tapValue=="wkzk"){
    		 arr=list4;
    	 }else if(tapValue=="qt"){
    		 arr=list5;
    	 }
    	 for(var i=0;i<arr.length;i++){
    		if(deptId==-1){
    			deptId=arr[i].deptId;
    		}
   			if(arr[i].apm==0&&arr[i].week==1&&arr[i].deptId==deptId){
   				td10+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==1&&arr[i].week==1&&arr[i].deptId==deptId){
   				td11+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==0&&arr[i].week==2&&arr[i].deptId==deptId){
   				td20+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==1&&arr[i].week==2&&arr[i].deptId==deptId){
   				td21+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==0&&arr[i].week==3&&arr[i].deptId==deptId){
   				td30+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==1&&arr[i].week==3&&arr[i].deptId==deptId){
   				td31+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==0&&arr[i].week==4&&arr[i].deptId==deptId){
   				td40+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==1&&arr[i].week==4&&arr[i].deptId==deptId){
   				td41+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==0&&arr[i].week==5&&arr[i].deptId==deptId){
   				td50+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==1&&arr[i].week==5&&arr[i].deptId==deptId){
   				td51+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==0&&arr[i].week==6&&arr[i].deptId==deptId){
   				td60+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==1&&arr[i].week==6&&arr[i].deptId==deptId){
   				td61+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==0&&arr[i].week==7&&arr[i].deptId==deptId){
   				td70+=arr[i].name+"&nbsp;&nbsp;";
   			}else if(arr[i].apm==1&&arr[i].week==7&&arr[i].deptId==deptId){
   				td71+=arr[i].name+"&nbsp;&nbsp;";
   			}
   	     }
    	 tr="<tr><th style='width: 60px;'>一</th><td>"+td10+"</td><td>"+td11+"</td></tr>"
    	 	+"<tr><th style='width: 60px;'>二</th><td>"+td20+"</td><td>"+td21+"</td></tr>"
    	 	+"<tr><th style='width: 60px;'>三</th><td>"+td30+"</td><td>"+td31+"</td></tr>"
    	 	+"<tr><th style='width: 60px;'>四</th><td>"+td40+"</td><td>"+td41+"</td></tr>"
    	 	+"<tr><th style='width: 60px;'>五</th><td>"+td50+"</td><td>"+td51+"</td></tr>"
    	 	+"<tr><th style='width: 60px;'>六</th><td>"+td60+"</td><td>"+td61+"</td></tr>"
    	 	+"<tr><th style='width: 60px;'>日</th><td>"+td70+"</td><td>"+td71+"</td></tr>";
    	 return tr;
     }
     
     function deptChange(obj,val){
    	 $("#navUL li").each(function() {
    		 $(this).removeClass("active");
    	    }); 
    	 $(obj).parent().addClass("active");
    	 $("#dept").val(val);
    	 $("#tab").html(tr0+buildTR());
     }
     $(document).ready(function() {
    	 $("#tab").html(tr0+buildTR());
     })