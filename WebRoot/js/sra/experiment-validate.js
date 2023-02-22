function validateBioproject(){
	//accession = $("#accession").val();
	//var proId = $("#proId").val();
	var proId = $("#sel_project").val();
	var sampleId = $("#sel_sample").val();
	//alert("proId:"+proId);
	if(proId.replace(/(^\s*)|(\s*$)/g, "") == ""){
		$("#sel_project").css("border","1px solid red");
		alert("You must input accession number of your own projects!");
		$("#errorMsg").append("<li>You must input accession number of your own projects!</li>");
		return false;
	}
	if(sampleId.replace(/(^\s*)|(\s*$)/g, "") == ""){
		$("#sel_sample").css("border","1px solid red");
		alert("You must input accession number of your own samples!");
		$("#errorMsg").append("<li>You must input accession number of your own samples!</li>");
		return false;
	}
	return true;
}
$(function(){
	//alert("hello");
	jQuery.validator.addMethod("isEmpty", function(value, element) {     
		//alert("value:"+value);
		return this.optional(element) || (true);       
		}, "Incorrect accession number.");
	jQuery.validator.addMethod("isValidDate", function(value, element) {
		
		var relSampleTime = $("#sel_sample").find("option:selected").attr("relTime");
		//alert(relSampleTime);
		if(relSampleTime==null){
			//alert("null sample time");
			//alert("sample time:"+$("#sel_sample").attr("relTime"));
			relSampleTime = $("#sel_sample").attr("relTime");
		}
		relSampleTime = relSampleTime.replace(/-/g,"/");
		//alert (relSampleTime);
		//alert(relSampleTime);
		var relExpTime = $("#releaseTime").val();
		relExpTime = relExpTime.replace(/-/g,"/");
		//alert(relExpTime);
		var releaseSampleTime = new Date(relSampleTime);
		var releaseExpTime = new Date(relExpTime);
		//alert ("release sample time:" +releaseSampleTime);
		//alert ("release exp time:"+releaseExpTime);
		return this.optional(element) || (!(releaseExpTime<releaseSampleTime));       
		}, "InValid release date! Experiment must not be released before related sample.");

	$("#expSubmit").validate({
		errorLabelContainer: $("#errorMsg"),
		wrapper: "li",
		rules: {
			"alias": "required",
			"title": "required",
			"sel_project":{
				required:true,
				isEmpty:true
			},
			"sel_sample":{
				required:true,
				isEmpty:true
			},
			"plannedReadLength":"required",
			"plannedNumberOfCycles":"required",
			"plannedReadLengthMate1":"required",
			"plannedReadLengthMate2":"required",
			"releaseTime":"isValidDate"
		},
		messages:{
			"alias": "alias is required!",
			"title": "title is required",
			"sel_project":{
				"required":"project accession is required",
				"isEmpty":"project accession cannot be empty"
				},
			"sel_sample":{
					"required":"sample accession is required",
					"isEmpty":"sample accession cannot be empty"
					},
			"plannedReadLength":"planned Read Length required",
			"plannedNumberOfCycles":"planned Number Of Cycles required",
			"plannedReadLengthMate1":"planned Read Length Mate1 required",
			"plannedReadLengthMate2":"planned Read Length Mate2 required",
			"releaseTime":"InValid release date! Experiment must not be released before related sample."
				
		}
	});  
	$("#expSubmit").submit(function(){
		return validateBioproject();
	});	
});