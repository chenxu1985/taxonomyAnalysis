function validate(id,num,msg){
	var flag = true;
	var trs = $("#"+id+" tr[class='row']");
	var size = $("#"+id+" tr[class='row']").size();
	if(size==0){
		msg="You must upload one file!"
		flag=false;
	}
	$.each(trs,function(){
		var count = 0;
		var inputs = $(this).find("input[type='text']");
		$.each(inputs,function(index,element){
//			alert($(element).val());
//			if($(this).val().trim().length <= 0){
//				count++;
//			}
			if($(element).val().trim().length<=0){
				count++;
			}
			if(index==0){
				var fileName = $(element).val().trim();
				if(!fileName.match(/(\w+)(\.tar\.gz|\.gz|\.zip|\.bz)$/)){
//					alert("wrong match");
					flag=false;
				}
			}
			if(index==1){
				if(!$(element).val().trim().match(/[a-zA-Z0-9]{32}/)){
					flag=false;
				}
			}
		});
		if((count != num) && (count != 0)){
			flag = false;
		}
		if(!flag){
			/*$(this).css("background-color","blue");*/
			$(this).find("input").css({
				 "border": "2px solid red"
			});
		}
	});
	if(!flag){
		$(".myErrorMsg").text("");
		$(".myErrorMsg").html("<li id="+id+"Error>"+msg+"</li>");
	}
	return flag;
}

$(function(){
	jQuery.validator.addMethod("isValidDate", function(value, element) {       
//		var releaseSampleTime = new Date($("#sel_sample").find("option:selected").attr("relTime"));
		var expRelTime = $("#expReleaseTime").val().replace(/-/g,"/");
		//alert(expRelTime);
		var relRunTime = $("#releaseTime").val().replace(/-/g,"/");
		//alert(relRunTime);
		var releaseExpTime = new Date(expRelTime);
		var releaseRunTime = new Date(relRunTime);
		//alert (releaseSampleTime);
		//alert (releaseExpTime);
		return this.optional(element) || (!(releaseRunTime<releaseExpTime));       
		}, "InValid release date! Run must not be released before related experiment."); 
	$("#runSubmit").validate({
		errorLabelContainer: $("#errorMsg"),
		wrapper: "li",
		rules: {
			"runDetail.alias": "required",
			//"runFileName":"required",
			//"md5":"required",
			"runDetail.releaseTime": "isValidDate"
		},
		messages:{
			"runDetail.alias": "alias is required!",
			//"runFileName":"file name is required!",		
			//"md5":"MD5 is required!",
			"runDetail.releaseTime":"InValid release date! Run must not be released before related experiment."
		}
	});  	
	$("form").submit(function(){
		var flag1 = validate("id_datafile",2,"Wrong file name or md5 checksum code! The run file name must be compressed format(e.g. *.zip or *.tar.gz) and the MD5 check code must be a 32-character alphanumeric string. ");
		var flag = flag1;
		return flag;
	});
});