function tissueComplete(fieldId){	
	$("#" + fieldId).autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "/sample/ajax/listTissue",
				dataType: "json",
				data: {
					tissueName: request.term
				},
				success: function(data) {
					response($.map(data.listTissue, function(item) {
						return { label: item['name'], value:item['name']};
					}));
				}
			});
		},
/*		select: function(event, ui){
			$("#tissue").val(ui.item.value);
			$("form").data('bootstrapValidator')
			.updateStatus(field, 'NOT_VALIDATED')
			.validateField(field); 
		},  */	    
		autoFocus:true,
		minLength:3,
		delay:500
	});
}