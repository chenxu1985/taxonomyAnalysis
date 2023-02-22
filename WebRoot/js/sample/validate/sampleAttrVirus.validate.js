/*$(function(){
	$("#sampleAttr").validate({
		errorLabelContainer: $(".errorMsg"),
		wrapper: "li",
		rules: {
			"sampleName": "required",
			"sampleAttrVirus.taxon.name":"required",
			"sampleAttrVirus.isolate":"required",
			"sampleAttrVirus.collectionDate":"required",
			"sampleAttrVirus.geographicLocation":"required",
			"sampleAttrVirus.isolationSource":"required",
		},
		messages:{
			"sampleName": "Sample name is required!",
			"sampleAttrVirus.taxon.name":"Organism is required!",
			"sampleAttrVirus.isolate":"Isolate is required!",
			"sampleAttrVirus.collectionDate":"Collection date is required!",
			"sampleAttrVirus.geographicLocation":"Geographic location is required!",
			"sampleAttrVirus.isolationSource":"Isolation source is required!"
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
        	'sampleAttrVirus.taxon.name': {
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

        	'sampleAttrVirus.isolationSource': {
        		validators: {
        			notEmpty: {
        				message: 'Isolation source is required.'
        			},
        			regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in isolation'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The isolation source must be less than 255 characters'
                    }
        		}
        	},

            'sampleAttrVirus.isolate': {
                validators: {
                    notEmpty: {
                        message: 'Isolate is required.'
                    },
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
            'sampleAttrVirus.collectionDate': {
            	validators: {
                    notEmpty: {
                        message: 'This field is required.'
                    },            		
                    date: {
                        format: 'YYYY-MM-DD'
                    }
            	}
            },
            'sampleAttrVirus.geographicLocation': {
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
            'sampleAttrVirus.strain': {
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
            'sampleAttrVirus.hostTaxon.name': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in name'
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: 'The name must be less than 50 characters'
                    }
            	}
            },
            'sampleAttrVirus.labHost': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in lab host'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The lab host must be less than 255 characters'
                    }
            	}
            },
            'sampleAttrVirus.altitude': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in latitude'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The latitude must be less than 100 characters'
                    }
            	}
            },
            'sampleAttrVirus.biomaterialProvider': {
            	validators: {
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
            'sampleAttrVirus.collectedBy': {
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
            'sampleAttrVirus.cultureCollection': {
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
            'sampleAttrVirus.depth': {
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
            'sampleAttrVirus.disease': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in disease'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The disease must be less than 255 characters'
                    }
            	}
            },
            'sampleAttrVirus.environmentBiome': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in environment'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The environment must be less than 255 characters'
                    }
            	}
            },
            'sampleAttrVirus.genotype': {
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
            'sampleAttrVirus.hostTissueSampled': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in host tissue'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The host tissue must be less than 255 characters'
                    }
            	}
            },
            'sampleAttrVirus.identifiedBy': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in identified'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The identified must be less than 255 characters'
                    }
            	}
            },
            'sampleAttrVirus.latitudeLongitude': {
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
            'sampleAttrVirus.passageHistory': {
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
            'sampleAttrVirus.sampleSize': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in sample size'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The sample size must be less than 255 characters'
                    }
            	}
            },
            'sampleAttrVirus.serotype': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in serotype'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The serotype must be less than 255 characters'
                    }
            	}
            },
            'sampleAttrVirus.specimenVoucher': {
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
            'sampleAttrVirus.temperature': {
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