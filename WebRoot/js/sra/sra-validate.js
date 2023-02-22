
$(function(){

	$("#sraSubmit").validate({
		errorLabelContainer: $("#errorMsg"),
		wrapper: "li",
		rules: {
			"alias": "required",
			"prjAccession":"required",
			"releaseTime":"required"
		},
		messages:{
			"alias": "alias is required!",
			"prjAccession":"Project accession is required!",		
			"releaseTime":"You should choose release date"
		}
	});  
});
