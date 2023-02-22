function taxonComplete(fieldId, taxonIdFieldId){
	 $("#" + fieldId).autocomplete({
  	    source: function(request, response) {
  	        $.ajax({
  	            url: "/taxon/ajax/listTaxon",
  	            dataType: "json",
  	            data: {
  	            	name: request.term
  	            },
  	            success: function(data) {
                     response($.map(data.listTaxonNameAndId, function(item) {
                    	 var id = item["taxon_id"];
                    	 var name = item["name"];
                    	 var label = name + " [Taxonomy ID: " + id + "]";
                         return { label: label, value: name, id: id };
                     }));
  	            }
  	        });
  	    },
     	select: function(event, ui){
				$("#" + taxonIdFieldId).val(ui.item.id);
     	},
       autoFocus:true,
       minLength:3,
       delay:300
      }); 
}
