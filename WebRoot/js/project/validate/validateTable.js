
function validate(id,num,msg){
	var flag = true;
	var rows = $("#"+id+" .row");
	$.each(rows, function(){
		var count = 0;
		var inputs = $(this).find("input");
		$.each(inputs, function(){
			var value = $(this).val().trim();
			if(value.length <= 0 || value == '0'){
				count++;
			}
			
		});
		if((count != num) && (count != 0)){
			$(this).attr("class", "row has-error has-feedback")
			flag = false;
		}
	});
	if(!flag){
		$("#"+id+"Error").remove();
		$("#errorMsg").append("<li id="+id+"Error>"+msg+"</li>");
	}
	return flag;
}
	
