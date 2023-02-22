function diseaseComplete(fieldId){
	$( "#" + fieldId).autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "/sample/ajax/listDisease",
				dataType: "json",
				data: {
					diseaseName: request.term
				},
				success: function(data) {
					response($.map(data.listHumanDisease, function(item) {
						return { label: item['name'], value:item['name']};
					}));
				}
			});
		},
/*		select: function(event, ui){
			$("#disease").val(ui.item.value);
			$("#submitter").data('bootstrapValidator').updateStatus(field, 'NOT_VALIDATED').validateField(field);
		}, */ 	    
		autoFocus:true,
		minLength:3,
		delay:500
	});	 
}

