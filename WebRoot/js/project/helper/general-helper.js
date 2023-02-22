var relevances = ["Agricultural","Medical","Industrial","Environmental","Evolution","Model organism"];
$("#relevance").autocomplete({
	source: relevances,
	delay:500,
	minLength:0,
    select: function(event, ui){
    	$("#relevance").val(ui.item.value);
    	$("#submitter").data('bootstrapValidator').updateStatus('generalInfo.relevance', 'NOT_VALIDATED').validateField('generalInfo.relevance');  	    	
    },	
	autoFocus:true
}).focus(function(){     
	  $(this).autocomplete("search");
});
