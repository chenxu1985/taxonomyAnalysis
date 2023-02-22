
function validateGroup(id,num,msg){
	/**
	 * @param id: id of group container
	 * @param num: count of one group include validations
	 * @param msg: if false, msg will display
	 * @return if valid return true, otherwise false
	 */
	var flag = true;
	var rows = $("#"+id+" .row");
	$.each(rows, function(){
		var count = 0; 
		var inputs = $(this).find("input");
		var selects = $(this).find("select");
		$.each(inputs, function(){
			var value = $(this).val().trim();
			if(value.length <= 0){
				count++;
			}
		});
		$.each(selects, function(){
			var value = $(this).val().trim();
			if(value.length <= 1){
				count++;
			}
		});
		
		
		if((count != num) && (count != 0)){
			$(this).attr("class", "row has-error has-feedback")
			flag = false;
		}
	});
	if(!flag){
		$("#"+id+"Error").remove();
		$("#errorMsg").append("<li id="+id+"Error>"+msg+"</li>");
	}
	return flag;
}

(function($) {
    $.fn.bootstrapValidator.validators.superproject = {
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
        	var display = $field.css("display");
        	
        	if(display == "block" && $field.val() == '0') return false;
        	return true;
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
        	'fourLevels.second.supPrjId': {
        		//enabled: false,
        		validators: {
        			superproject: {
        				message: 'this field is required'
        			}
        		}
        	},
        	'fourLevels.third.supPrjId': {
        		//enabled: false,
        		validators: {
        			superproject: {
        				message: 'this field is required'
        			}
        		}
        	},
        	'fourLevels.forth.supPrjId': {
        		//enabled: false,
        		validators: {
        			superproject: {
        				message: 'this field is required'
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
                        message: 'Project title is required'
                    },
                    regexp: {
                        regexp: titeRegExp,
                        message: 'The Project title can only consist of English character'
                    }
                }
            },
            'generalInfo.description': {
            	validators: {
            		notEmpty: {
            			message: 'You should give some project description'
            		},
            		regexp: {
                        regexp: despRegExp,
                        message: 'The Project description can only consist of English character'
                    }
            	}
            },
            'generalInfo.relevance': {
            	validators: {
            		notEmpty: {
            			message: 'Relevance field is required'
            		},
            		regexp: {
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'The relevance can only consist of alphabetical'
                    }
            	}
            },
           //
            'listExternalLinks[0].description':{
            	validators: {
            		regexp: {
            			regexp: despRegExp,
                        message: 'The description can only consist of English character'
                    }
            	}
            },
            'listExternalLinks[0].externalLinkUrl':{
            	validators: {
                    uri: {
                        allowLocal: true,
                        message: 'The input is not a valid URL'
                    }
            	}
            },
            //
            'listRelatedProjects[0].relatedPrjAccession':{
            	validators: {
            		regexp: {
                        regexp: /^PRJC[A-Z][0-9]{6}$/,
                        message: 'Wrong bioProject accession.'
                    }
            	}
            },
            'listRelatedProjects[0].description':{
            	validators: {
            		regexp: {
            			regexp: despRegExp,
                        message: 'The description can only consist of English character'
                    }
            	}
            },
            //
            'listRefProjects[0].refAccession':{
            	validators: {
            		regexp: {
                        regexp: /^[\w\s]+$/,
                        message: 'The Accession can only consist of English character'
                    }
            	}
            },
            'listRefProjects[0].refDbName':{
            	validators: {
            		regexp: {
                        regexp: /^[A-Z\s]+$/,
                        message: 'The database name can only consist of alphabetical'
                    }
            	}
            },
            //
            'listGrants[0].agency':{
            	validators: {
            		regexp: {
            			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                        message: 'The agency can only consist of English character'
                    }
            	}
            },
            'listGrants[0].agencyAbbr':{
            	validators: {
            		regexp: {
            			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                        message: 'The agency abbreviation can only consist of English character'
                    }
            	}
            },
            'listGrants[0].grantID':{
            	validators: {
            		regexp: {
                        regexp: /^[\w\s]+$/,
                        message: 'The grant ID can only consist of alphabetical and number'
                    }
            	}
            },
            'listGrants[0].grantTitle':{
            	validators: {
            		regexp: {
            			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                        message: 'The grant title can only consist of English character'
                    }
            	}
            },
            //
            'generalInfo.consertiumName':{
            	validators: {
            		regexp: {
            			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                        message: 'The consertium name can only consist of English character'
                    }
            	}
            },
            'generalInfo.consertiumUrl':{
            	validators: {
                    uri: {
                        allowLocal: true,
                        message: 'The input is not a valid URL'
                    }
            	}
            },
            'listDataProviders[0].providerName':{
            	validators: {
            		regexp: {
            			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                        message: 'The provider name can only consist of English character'
                    }
            	}
            },
            'listDataProviders[0].providerUrl':{
            	validators: {
                    uri: {
                        allowLocal: true,
                        message: 'The input is not a valid URL'
                    }
            	}
            },
            'generalInfo.biomaterialProvider':{
            	validators: {
            		regexp: {
            			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                        message: 'The biomaterial provider can only consist of English character'
                    }
            	}
            }
        }
	});
    $('input[name="generalInfo.isReleaseImmediately"]').on('change', function() {
        var bootstrapValidator = $('#submitter').data('bootstrapValidator');
        console.log(bootstrapValidator);
        var releaseNow = ($(this).val() == '0');
        releaseNow ? $("#specified_date").css("display", "block") : $("#specified_date").css("display", "none");
        bootstrapValidator.enableFieldValidators('generalInfo.releaseTime', releaseNow);         
    });	
	function recovery(id){
		$(document).on("focus","#"+id+" input",function(){
			$("#"+id+"Error").remove();
			$(this).parent().parent().parent().attr("class", "row");
		});
	}	
    recovery("externalLink");
    recovery("grants");
    recovery("dataProvider");
    recovery("refProject");
    recovery("relatedProject");	    
    $("#submitter").submit(function(){
		flag1 = validateGroup("externalLink",2,"External link's two componnents are linked!");
		flag2 = validateGroup("grants",4,"Grants' four componnents are linked!");
		flag3 = validateGroup("dataProvider",2,"Data provieder and data provider URL are linked!");
		flag4 = validateGroup("refProject",2,"accesion and database name are linked!");
		flag5 = validateGroup("relatedProject",2,"accession and description are both required!");
		flag = flag1 && flag2 && flag3 && flag4 && flag5;
		$("input[name=submit]").attr("disabled", false);
		return flag;
    }); 
    
});