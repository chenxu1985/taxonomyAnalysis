$(function(){
	 $( "#taxon" ).autocomplete({
  	    source: function(request, response) {
  	        $.ajax({
  	            url: "/project/ajax/listTaxon",
  	            dataType: "json",
  	            data: {
  	            	name: request.term
  	            },
  	            success: function(data) {
//  	            	ids = []
//  	            	names = []
//  	            	data.listTaxonNameAndId.forEach(function(map){
//  	            		var id = map["taxon_id"];
//  	            		var name = map["name"];
//  	            		ids.push(id);
//  	            		names.push(name);
//  	            	});
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
				$("#taxon-id").val(ui.item.id);
     	},
       autoFocus:true,
       minLength:3,
       delay:300
      });
	 
});