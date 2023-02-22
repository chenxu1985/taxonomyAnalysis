function cellComplete(fieldId){
	$("#" + fieldId).autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "/sample/ajax/listCell",
				dataType: "json",
				data: {
					cellName: request.term
				},
				success: function(data) {
					response($.map(data.listCell, function(item) {
						return { label: item['name'], value:item['name']};
					}));
				}
			});
		},
/*		select: function(event, ui){
			$("#cellType").val(ui.item.value);
			$("form").data('bootstrapValidator')
			.updateStatus(field, 'NOT_VALIDATED')
			.validateField(field);  	    	
		}, */
		autoFocus:true,
		minLength:3,
		delay:500
	});	 
}
