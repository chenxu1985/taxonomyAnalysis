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
			"sampleAttrModelAnimal.taxon.name":"required",
			//"sampleAttrModelAnimal.age":"positiveinteger",
			"sampleAttrModelAnimal.biomaterialProvider":"required",
			"sampleAttrModelAnimal.sex":"required",
			"sampleAttrModelAnimal.tissue":"required"
		},
		messages:{
			"sampleName": "Sample name is required!",
			"sampleAttrModelAnimal.taxon.name":"Organism is required!",
			//"sampleAttrModelAnimal.age":"Please enter a valid number for Age!",
			"sampleAttrModelAnimal.biomaterialProvider":"Biomaterial provider is required!",
			"sampleAttrModelAnimal.sex":"Sex is required!",
			"sampleAttrModelAnimal.tissue":"Tissue is required!"
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
        	'sampleAttrModelAnimal.taxon.name': {
        		validators: {
                    notEmpty: {
                        message: 'Organism name is required.'
                    },
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in taxon name'
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: 'The taxon name must be less than 50 characters'
                    }
        		}
        	},
        	'sampleAttrModelAnimal.biomaterialProvider': {
        		validators: {
        			notEmpty: {
        				message: 'Biomaterial provider is required.'
        			},
        			regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in provider'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The provider must be less than 100 characters'
                    }
        		}
        	},        	
            'sampleAttrModelAnimal.tissue': {
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
            'sampleAttrModelAnimal.sex': {
            	validators: {           		
                    notEmpty: {
                        message: 'Sex is required.'
                    }
            	}
            },    
            'sampleAttrModelAnimal.birthDate': {
            	validators: {           		
                    date: {
                        format: 'YYYY-MM-DD'
                    }
            	}
            },             
            'sampleAttrModelAnimal.deathDate': {
            	validators: {           		
            		date: {
            			format: 'YYYY-MM-DD'
            		}
            	}
            },             
            'sampleAttrModelAnimal.age': {
            	validators: {           		
            		numeric: {
            			message: 'you should give a number.'
            		},
                    stringLength: {
                        min: 0,
                        max: 10,
                        message: 'The age must be less than 10 bit numeric'
                    }
            	}
            },
            'sampleAttrModelAnimal.breed': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in breed'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The breed must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.strain': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in strain'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The strain must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.birthLocation': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in birth location'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The location must be less than 255 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.breedHistory': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in breed history'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The history must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.breedMethod': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in breed method'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The method must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.cellLine': {
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
            'sampleAttrModelAnimal.cellSubtype': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in cell subtype'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The cell subtype must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.cellType': {
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
            'sampleAttrModelAnimal.collectedBy': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in collected'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The collector must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.cultureCollection': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in culture collection'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The collection must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.devStage': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in development stage'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The development stage must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.disease': {
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
            'sampleAttrModelAnimal.diseaseStage': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in disease stage'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The stage must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.genotype': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in genotype'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The genotype must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.geographicLocation': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in geographic location'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The location must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.growthProtocol': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in growth protocol'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The protocol must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.healthState': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in health state'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The state must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.isolationSource': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in isolation source'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The source must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.latitudeLongitude': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in latitude longitude'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The latitude longitude must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.phenotype': {
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
            'sampleAttrModelAnimal.type': {
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
            'sampleAttrModelAnimal.specimenVoucher': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in specimen voucher'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The specimen voucher must be less than 255 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.storageConditions': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in storage conditions'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The condition must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.studbooknumber': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in study book number '
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The number must be less than 100 characters'
                    }
                }
            },
            'sampleAttrModelAnimal.treatment': {
                validators: {
                    regexp: {
                        regexp: englishRegExpTreatment,
                        message: 'Only ASCII characters may be used in treatment'
                    },
                    stringLength: {
                        min: 0,
                        max: 10,
                        message: 'The treatment must be less than 10 characters'
                    }
                }
            }
        }
	});
});