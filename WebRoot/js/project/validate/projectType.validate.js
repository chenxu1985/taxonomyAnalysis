$(document).ready(function() {
    $('#submitter').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	'dataTypes.dataTypeId': {
                    validators: {
                        notEmpty: {
                            message: 'Data type is required'
                        }
                    }
                },
                'dataTypeName': {
                	validators: {
                		notEmpty: {
                			message: 'Project data type description is required'
                		},
                		regexp: {
                            regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                            message: 'The Project data type description can only consist of English character'
                        }
                	}
                },
                'sampleScope.sampleScopeName': {
                	validators: {
                		notEmpty: {
                			message: 'Description is required'
                		},
                		regexp: {
                            regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                            message: 'The description can only consist of English character'
                        }
                	}
                },
                "sampleScope.sampleScopeId":{
                	validators: {
                		notEmpty: {
                			message: 'Sample Scope is required'
                		}
                	}
                }
            }
        })
     .find('input[type="checkbox"][name="dataTypes.dataTypeId"]')
        .on('change', function() {
    	var other = $("input[type=checkbox][value=-1]:checked").size();
        switch (true) {
            case (1 == other):
            	$("#other_data_type_description").css("display", "block");
                $('#submitter').bootstrapValidator('addField', 'dataTypeName', {
                    validators: {
                        notEmpty: {
                            message: 'Project data type description is required'
                        }
                    }
                });
                break;
            case (1 != other):
            	$("#other_data_type_description").css("display", "none");
                $('#submitter').bootstrapValidator('removeField', 'dataTypeName');
                break;
        }
    });
     $('#submitter').bootstrapValidator().find("#sample_scope")
    	.on("change",function(){
			var checkedOpt = $(this).find("option:selected").val();
			switch (true){
				 case (checkedOpt == -1):
					 $("#otherSampleScope").css("display", "block");
					 $('#submitter').bootstrapValidator('addField', 'sampleScope.sampleScopeName', {
						 validators: {
							 notEmpty: {
								 message: 'Description is required'
							 }
						 }
					 });
					 break;
				 case (checkedOpt != -1):
					 $("#otherSampleScope").css("display", "none");
				 	 $('#submitter').bootstrapValidator('removeField', 'sampleScope.sampleScopeName');
					 break;  	   
			 }
       });
     
});