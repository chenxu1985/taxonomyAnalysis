$(function(){
	 $( "#prjAccession" ).autocomplete({
  	    source: function(request, response) {
  	        $.ajax({
  	            url: "/sample/ajax/listProSampleByUserId",
  	            dataType: "json",
  	            success: function(data) {
            		response($.map(data.listProSample, function(proSample) {
            			return { label: proSample.accession, value: proSample.accession};
            		}));
  	            }
  	        });
  	    },
  	    select: function(event, ui){
  	    	$("#prjAccession").val(ui.item.value);
  	    	$("#submitter").data('bootstrapValidator').updateStatus('accession', 'NOT_VALIDATED').validateField('accession');  	    	
  	    },
        autoFocus:true,
        minLength:0,
        delay:500
      }).focus(function(){     
    	  $(this).autocomplete("search");
      });
	 
});