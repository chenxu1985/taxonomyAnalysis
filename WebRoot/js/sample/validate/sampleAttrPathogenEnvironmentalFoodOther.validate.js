/*$(function(){
	$("#sampleAttr").validate({
		errorLabelContainer: $(".errorMsg"),
		wrapper: "li",
		rules: {
			"sampleName": "required",
			"sampleAttrPathogenEnvironmental.taxon.name":"required",
			"sampleAttrPathogenEnvironmental.collectedBy":"required",
			"sampleAttrPathogenEnvironmental.collectionDate":"required",
			"sampleAttrPathogenEnvironmental.geographicLocation":"required",
			"sampleAttrPathogenEnvironmental.isolationSource":"required",
			"sampleAttrPathogenEnvironmental.latitudeLongitude":"required"
		},
		messages:{
			"sampleName": "Sample name is required!",
			"sampleAttrPathogenEnvironmental.taxon.name":"Organism is required!",
			"sampleAttrPathogenEnvironmental.collectedBy":"Collected_by source is required!",
			"sampleAttrPathogenEnvironmental.collectionDate":"Collection date is required!",
			"sampleAttrPathogenEnvironmental.geographicLocation":"Geographic location is required!",
			"sampleAttrPathogenEnvironmental.isolationSource":"Isolation is required!",
			"sampleAttrPathogenEnvironmental.latitudeLongitude":"Latitude and longitude is required!"			
		}
	});  
});
 */
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
        	'sampleAttrPathogenEnvironmental.taxon.name': {
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
        	'sampleAttrPathogenEnvironmental.isolationSource': {
        		validators: {
        			notEmpty: {
        				message: 'Isolation source is required.'
        			},
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
        	'sampleAttrPathogenEnvironmental.latitudeLongitude': {
        		validators: {
        			notEmpty: {
        				message: 'Latitude and longitude are required.'
        			},
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
            'sampleAttrPathogenEnvironmental.collectedBy': {
                validators: {
                    notEmpty: {
                        message: 'This field is required.'
                    },
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
            'sampleAttrPathogenEnvironmental.collectionDate': {
            	validators: {
                    notEmpty: {
                        message: 'This field is required.'
                    },            		
                    date: {
                        format: 'YYYY-MM-DD'
                    }
            	}
            },
            'sampleAttrPathogenEnvironmental.geographicLocation': {
            	validators: {
            		notEmpty: {
            			message: 'Geographic location is required.'
            		},
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in geographic location'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The geographic location must be less than 255 characters'
                    }
            	}
            },
            'sampleAttrPathogenEnvironmental.isolate': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in isolate'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The isolate must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenEnvironmental.strain': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in strain'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The strain must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenEnvironmental.cultureCollection': {
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
            'sampleAttrPathogenEnvironmental.genotype': {
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
            'sampleAttrPathogenEnvironmental.passageHistory': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in passage history'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The passage history must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenEnvironmental.serovar': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in serovar'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The serovar must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenEnvironmental.specimenVoucher': {
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
            'sampleAttrPathogenEnvironmental.subgroup': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in subgroup'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The subgroup must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenEnvironmental.subtype': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in subtype'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The subtype must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenEnvironmental.addAttribute': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in attribute'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The attribute must be less than 255 characters'
                    }
                }
            }
        }
	});
});