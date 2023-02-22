/*jQuery.validator.addMethod("positiveinteger", function(value, element) {
   var aint=parseInt(value);	
    return aint>0&& (aint+"")==value;   
  }, "Please enter a valid number.");

$(function(){
	$("#sampleAttr").validate({
		errorLabelContainer: $(".errorMsg"),
		wrapper: "li",
		rules: {
			"sampleName": "required",
			"sampleAttrPlant.taxon.name":"required",
			"sampleAttrPlant.cultivar":"required",
			"sampleAttrPlant.biomaterialProvider":"required",
			"sampleAttrPlant.tissue":"required"
		},
		messages:{
			"sampleName": "Sample name is required!",
			"sampleAttrPlant.taxon.name":"Organism is required!",
			"sampleAttrPlant.cultivar":"Cultivar is required!",
			"sampleAttrPlant.biomaterialProvider":"Biomaterial provider is required!",
			"sampleAttrPlant.tissue":"Tissue is required!"
		}
	});  
});*/

$(function(){
	$("#submitter").bootstrapValidator({
		message: 'This value is not valid',
        feedbackIcons: {
            //valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'sampleName': {
        		validators: {
        			notEmpty: {
        				message: 'Sample name is required.'
        			},
        			regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in sample name'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The name must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrPlant.taxon.name': {
        		validators: {
                    notEmpty: {
                        message: 'Organism name is required.'
                    },
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in organism name'
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: 'The taxon name must be less than 50 characters'
                    }
        		}
        	},
        	'sampleAttrPlant.cultivar': {
        		validators: {
        			notEmpty: {
        				message: 'Cultivar is required.'
        			},
        			regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in cultivar'
                    }
        		}
        	},
        	'sampleAttrPlant.biomaterialProvider': {
        		validators: {
        			notEmpty: {
        				message: 'Biomaterial provider is required.'
        			},
        			regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in biomaterial provider'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The provider must be less than 100 characters'
                    }
        		}
        	},        	
            'sampleAttrPlant.tissue': {
                validators: {
                    notEmpty: {
                        message: 'Tissue is required.'
                    },
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in tissue'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The tissue must be less than 100 characters'
                    }
                }
            },
            'sampleAttrPlant.collectionDate': {
            	validators: {           		
                    date: {
                        format: 'YYYY-MM-DD'
                    }
            	}
            },            
            'sampleAttrPlant.age': {
            	validators: {           		
            		numeric: {
            			message: 'you should give a number.'
            		},
                    stringLength: {
                        min: 0,
                        max: 6,
                        message: 'The number must be less than 6 characters'
                    }
            	}
            },            
            'sampleAttrPlant.heightLength': {
            	validators: {           		
            		numeric: {
            			message: 'you should give a number.'
            		}
            	}
            },
            'sampleAttrPlant.cellLine': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in cell line'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The cell line must be less than 100 characters'
                    }
                }
            },
            'sampleAttrPlant.cellType': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in cell type'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The cell type must be less than 100 characters'
                    }
                }
            },
            'sampleAttrPlant.collectedBy': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in collected'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The collected must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPlant.cultureCollection': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in culture collection'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The culture collection must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPlant.devStage': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in development stage'
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: 'The development stage must be less than 50 characters'
                    }
                }
            },
            'sampleAttrPlant.disease': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in disease'
                    },
                    stringLength: {
                        min: 0,
                        max: 200,
                        message: 'The disease must be less than 200 characters'
                    }
                }
            },
            'sampleAttrPlant.diseaseStage': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in disease stage'
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: 'The disease stage must be less than 50 characters'
                    }
                }
            },
            'sampleAttrPlant.genotype': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in genotype'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The genotype must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPlant.growthProtocol': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in protocol'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The protocol must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPlant.isolationSource': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in isolation source'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The isolation source must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPlant.latitudeLongitude': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in latitude longitude'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The latitude longitude must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPlant.phenotype': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in phenotype'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The phenotype must be less than 100 characters'
                    }
                }
            },
            'sampleAttrPlant.population': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in population'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The population must be less than 100 characters'
                    }
                }
            },
            'sampleAttrPlant.type': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in type'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The type must be less than 100 characters'
                    }
                }
            },
            'sampleAttrPlant.specimenVoucher': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in voucher'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The voucher must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPlant.temperature': {
                validators: {
                    regexp: {
                        regexp: englishRegExpTreatment,
                        message: 'Only ASCII characters may be used in temperature'
                    },
                    stringLength: {
                        min: 0,
                        max: 10,
                        message: 'The temperature must be less than 10 characters'
                    }
                }
            },
            'sampleAttrPlant.treatment': {
                validators: {
                    regexp: {
                        regexp: englishRegExpTreatment,
                        message: 'Only ASCII characters may be used in treatment'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The treatment must be less than 255 characters'
                    }
                }
            }
        }
	});
});