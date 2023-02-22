(function($) {
    $.fn.bootstrapValidator.validators.projectAccession = {
        /**
         * @param {BootstrapValidator} validator The validator plugin instance
         * @param {jQuery} $field The jQuery object represents the field element
         * @param {Object} options The validator options
         * @returns {boolean}
         */
        validate: function(validator, $field, options) {
            // You can get the field value
            // var value = $field.val();
            // Perform validating
            // return true if the field value is valid
            // otherwise return false
        	var accession = $field.val();
        	var v;
    		$.ajax({
	            url: "/sample/ajax/ajaxValidateProjectAccession",
	            dataType: "json",
	            data: {accession:accession},
	            async:false,
	            success: function(data) {
	            	v = data.accessionValidator;
	            	return data.accessionValidator;
	            }
	        });   
    		return v;
        }
    };
}(window.jQuery));

$(function(){
	$("#submitter").bootstrapValidator({
		message: 'This value is not valid',
        feedbackIcons: {
            //valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'accession': {
        		//enabled: false,
        		validators: {
        			notEmpty: {
        				message: 'Project accession is required'
        			},
        			regexp: {
                        regexp: /^[\w\s]+$/,
                        message: 'Only ASCII characters may be used in Project accession'
                    },
                    stringLength: {
                        min: 0,
                        max: 32,
                        message: 'The accession must be less than 32 characters'
                    }
        		}
        	},
        	'generalInfo.releaseTime': {
        		//enabled: false,
        		validators: {
                    notEmpty: {
                        message: 'Please give a specified date'
                    },        			
                    date: {
                        format: 'YYYY-MM-DD'
                    }
        		}
        	},
            'generalInfo.title': {
                validators: {
                    notEmpty: {
                        message: 'Sample title is required'
                    },
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in Sample title'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The title must be less than 255 characters'
                    }
                }
            },
            'generalInfo.publicDescription': {
            	validators: {
            		notEmpty: {
            			message: 'You should give some description'
            		},
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in description'
                    },
                    stringLength: {
                        min: 0,
                        max: 500,
                        message: 'The description must be less than 500 characters'
                    }
            	}
            }           
        }
	});
});