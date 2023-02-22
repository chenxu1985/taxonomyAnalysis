function writeRunDataFiles(list){
	$("#id_datafile tr:gt(0)").remove();
	list = list.reverse();
	$.each(list, function(index,value){
		var trStr='';
		var status = value.status;
		if(status>1){
			trStr='<tr class="row">\
				<td>\
				<input type="hidden" name="runDataFileList['+index+'].runFileId" value="'+value.runFileId+'"/>\
				<input type="hidden" name="runDataFileList['+index+'].status" value="'+value.status+'"/>\
				<input type="text" style="width:230px;" name="runDataFileList['+index+'].runFileName" value="'+value.runFileName+'" disabled="disabled"/>\
			</td>\
			<td><input type="text" style="width:230px;" name="runDataFileList['+index+'].md5" value="'+value.md5+'" disabled="disabled"/>\
			</td>\
			<td>\
			<img id="delete_'+value.runFileId+'" src="/img/index0011.png" disabled="disabled"/>\
			</td>\
	</tr>';
		}else{
			trStr='<tr class="row">\
				<td>\
				<input type="hidden" name="runDataFileList['+index+'].runFileId" value="'+value.runFileId+'"/>\
				<input type="hidden" name="runDataFileList['+index+'].status" value="'+value.status+'"/>\
				<input type="text" style="width:230px;" name="runDataFileList['+index+'].runFileName" value="'+value.runFileName+'"/>\
			</td>\
			<td><input type="text" style="width:230px;" name="runDataFileList['+index+'].md5" value="'+value.md5+'"/>\
			</td>\
			<td>\
			<img class="deleteImg" id="delete_'+value.runFileId+'" src="/img/index0011.png" />\
			</td>\
	</tr>';
		}
		$("#id_datafile tr:eq(0)").after(trStr);
	});
}
function howToWriteListRunDataFiles(runDataFiles, flag){
	if(flag){
		writeRunDataFiles(runDataFiles);
	}else{
		var runId = $("#runId").val();
		var param={runId:runId};
		$.ajax({
			url:'/run/ajax/listRunFiles.action',
			type:'post',
			data:param,
			async:false,
			dataType:'json',
			success:function(data){
				if(data.runDataFileList != null && data.runDataFileList.length>0){
					//alert("hhh");
					writeRunDataFiles(data.runDataFileList);
				}
			}
		});	
	}
}

$(function(){	
	var v = /value="(.*?)"/g;
	var s =  "<tr class='row'>"+$(".row").html()+"</tr>";
	s = s.replace(v,'value=""');
	var r = new RegExp("\\[\\d+\\]","g");
	$(document).on("click",".add-row",function(){
		size = $(".row").size();
		//alert("size:"+size);
		if(size == 0){
			$("#id_datafile tr:last").after(s.replace(r,"["+size+"]"));				
		}else{
			$(".row:last").after(s.replace(r,"["+size+"]"));
		}
   	});
		

	$(document).on("click",".deleteImg",function(){
		var size = $(".row").size();
		if(size==1){
			$(".myErrorMsg").text("");
			$(".myErrorMsg").html("<li>You must upload at least one file.</li>");
//			alert("You must upload at least one file.");
			return;
		}
		var runFileId = $(this).attr("id");
		if(runFileId){
			runFileId = runFileId.substring(7,runFileId.length);
			var param={runFileId:runFileId};
			$.ajax({
				url:'/run/ajax/deleteRunFile.action',
				type:'post',
				data:param,
				async:false,
				dataType:'json',
				success:function(){
					$("#delete_"+runFileId).parent().parent().remove();
				},
				error:function(){
					alert("Delete error.");
				}
			});	
			
		}
		else{
			$(this).parent().parent().remove();
		}

		$(".row").each(function(index,value){
			$(this).find("input").each(function(){
				var name = $(this).attr("name").replace(r,"["+index+"]");
				$(this).attr("name",name);
			});
		});
	});

});



