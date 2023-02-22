function validateTaxon(){
	var taxonName = $("#taxon").val();
	if(taxonName.replace(/(^\s*)|(\s*$)/g, "") == ''){
		$("#taxon").css("border","1px solid red");
		$(".myErrorMsg").append("<li id='taxonError'>Organism is required!</li>");
		return false;
	}else{
		$.ajax({
	            url: "/taxon/ajax/getTaxonByName",
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
		$("#taxon").css("border","1px solid red");
		$(".myErrorMsg").append("<li id='taxonError'>You must select from the hint list!</li>");
		return false;
	}
	return true;
}

$(function(){
	 $( "#taxon" ).autocomplete({
  	    source: function(request, response) {
  	        $.ajax({
  	            url: "/taxon/ajax/listTaxon.action",
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
				$("#taxon-id").val(ui.item.id);
     	},
       autoFocus:true,
       minLength:3,
       delay:500
      });
	 
	$("form").submit(function(){
		return validateTaxon();
	});	 
});