
function validate(id,num,msg){
	var flag = true;
	var trs = $("#"+id+" tr");
	$.each(trs,function(){
		var count = 0;
		var inputs = $(this).find("input");
		$.each(inputs,function(){
			if($(this).val().trim().length <= 0){
				count++;
			}
		});
		if((count != num) && (count != 0)){
			flag = false;
			/*$(this).css("background-color","blue");*/
			$(this).find("input").css({
				 "border": "2px solid red"
			});
		}
	});
	if(!flag){
		$("#"+id+"Error").remove();
		$(".myErrorMsg").append("<li id="+id+"Error>"+msg+"</li>");
	}
	return flag;
}
	
