/*$(function(){
	$("#sampleAttr").validate({
		errorLabelContainer: $(".errorMsg"),
		wrapper: "li",
		rules: {
			"sampleName": "required",
			"sampleAttrMicrobe.taxon.name":"required",
			"sampleAttrMicrobe.strain":"required",
			"sampleAttrMicrobe.isolationSource":"required",
			"sampleAttrMicrobe.collectionDate":"required",
			"sampleAttrMicrobe.geographicLocation":"required"
		},
		messages:{
			"sampleName": "Sample name is required!",
			"sampleAttrMicrobe.taxon.name":"Organism is required!",
			"sampleAttrMicrobe.strain":"Strain is required!",
			"sampleAttrMicrobe.isolationSource":"Isolation source is required!",
			"sampleAttrMicrobe.collectionDate":"Collection date is required!",
			"sampleAttrMicrobe.geographicLocation":"Geographic location is required!"
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
        	'sampleAttrMicrobe.taxon.name': {
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
        	'sampleAttrMicrobe.strain': {
        		validators: {
                    notEmpty: {
                        message: 'Strain is required.'
                    },
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
            'sampleAttrMicrobe.isolationSource': {
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
                        max: 100,
                        message: 'The isolation source must be less than 100 characters'
                    }
                }
            },
            'sampleAttrMicrobe.collectionDate': {
            	validators: {
                    notEmpty: {
                        message: 'Collection date is required.'
                    },            		
                    date: {
                        format: 'YYYY-MM-DD'
                    }
            	}
            },
            'sampleAttrMicrobe.geographicLocation': {
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
                        max: 100,
                        message: 'The geographic location must be less than 100 characters'
                    }
            	}
            },
            'sampleAttrMicrobe.altitude': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in altitude'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The altitude must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.biomaterialProvider': {
        		validators: {
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
        	'sampleAttrMicrobe.collectedBy': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in collected by'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The collector must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.cultureCollection': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in culture collection'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The culture collection must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.depth': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in depth'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The depth must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.environmentBiome': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in environment biome'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The environment biome must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.genotype': {
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
        	'sampleAttrMicrobe.hostTaxon.name': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in host taxon name'
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: 'The name must be less than 50 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.hostTissueSampled': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in host tissue sampled'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The host tissue must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.identifiedBy': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in identified '
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The identified must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.labHost': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in lab host'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The lab host must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.latitudeLongitude': {
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
        	'sampleAttrMicrobe.matingType': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in mating type'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The type must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.passageHistory': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in passage history'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The history must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.sampleSize': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in sample size'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The size must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.serotype': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in serotype'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The serotype must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.serovar': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in serovar'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The serovar must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.specimenVoucher': {
        		validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in specimen voucher'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The specimen voucher must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrMicrobe.temperature': {
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
        	}
        }
	});
});