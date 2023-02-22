function validateTaxon(){
	taxonName = $("#taxon").val();
	if(taxonName.replace(/(^\s*)|(\s*$)/g, "") == ''){
		$("#taxon").parent().attr("class", "form-group has-error");
		$("#taxonEmptyError").css("display", "block");
		$("#taxonIllegalError").css("display", "none");		
		return false;
	}else{
		$.ajax({
	            url: "/project/ajax/getTaxonNameAndIdByName",
	            dataType: "json",
	            data:{taxonName:taxonName},
	            async:false,
	            success: function(data) {
	            	list = data.taxonNameAndId;
	            	if(list == ""){
	            		$("#taxon-id").val("");
	            	}else{
	            		$("#taxon-id").val(data.taxonNameAndId[0]["taxon_id"]);
	            	}
	            	return;
	            }
	        });
		
	}
	taxonId = $("#taxon-id").val();
	if(taxonId.replace(/(^\s*)|(\s*$)/g, "") == ""){
		$("#taxon").parent().attr("class", "form-group has-error");
		$("#taxonEmptyError").css("display", "none");
		$("#taxonIllegalError").css("display", "block");
		return false;
	}
	return true;
}
$(document).on("focus","#taxon", function(){
	$(".help-block").css("display", "none");
	$(this).parent().attr("class", "form-group");
});
$("#submitter").submit(function(){
	return validateTaxon();
}); 