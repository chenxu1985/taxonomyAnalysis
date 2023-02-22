function validateTaxon(){
	var taxonName = $("#hostTaxonName").val();
	if(taxonName.replace(/(^\s*)|(\s*$)/g, "") == ''){
		//$("#hostTaxonName").css("border","1px solid red");
		//$(".myErrorMsg").append("<li id='taxonError'>Host Organism is required!</li>");
		return true;
	}else{
		$.ajax({
	            url: "/taxon/ajax/getTaxonByName",
	            dataType: "json",
	            data:{taxonName:taxonName},
	            async:false,
	            success: function(data) {
	            	list = data.taxonNameAndId;
	            	if(list == ""){
	            		$("#hostTaxonId").val("");
	            	}else{
	            		$("#hostTaxonId").val(data.taxonNameAndId[0]["taxon_id"]);
	            	}
	            	return;
	            }
	        });
		
	}
	var taxonId = $("#hostTaxonId").val();
	if(taxonId.replace(/(^\s*)|(\s*$)/g, "") == ""){
		$("#hostTaxonName").css("border","1px solid red");
		$(".myErrorMsg").append("<li id='taxonError'>You must select from the hint list!</li>");
		return false;
	}
	return true;
}

$(function(){
	 $( "#hostTaxonName" ).autocomplete({
  	    source: function(request, response) {
  	        $.ajax({
  	            url: "/taxon/ajax/listTaxon",
  	            dataType: "json",
  	            data: {
  	            	name: request.term
  	            },
  	            success: function(data) {
 	            	var ids = []; 
  	            	//var names = [];
  	            	var maps = {};
  	            	data.listTaxonNameAndId.forEach(function(map){
  	            		ids.push(map["taxon_id"]);
  	            		// names.push(map["name"]); 
  	            		maps[map["taxon_id"]] = map["name"];
  	            	});
                     response($.map(ids, function(item) {
                         return { label: maps[item], value:maps[item],id:item };
                     }));
  	            }
  	        });
  	    },
     	select: function(event, ui){
				$("#hostTaxonId").val(ui.item.id);
     	},
       autoFocus:true,
       minLength:3,
       delay:0
      });
	 
	$("form").submit(function(){
		return validateTaxon();
	});	 
});