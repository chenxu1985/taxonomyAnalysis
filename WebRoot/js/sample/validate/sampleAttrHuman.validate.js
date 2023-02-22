
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
                        message: 'Only ASCII characters may be used in name'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The name must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrHuman.isolate': {
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
                        max: 100,
                        message: 'The isolate must be less than 100 characters'
                    }
        		}
        	},
            'sampleAttrHuman.biomaterialProvider': {
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
            'sampleAttrHuman.tissue': {
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
            'sampleAttrHuman.age': {
            	validators: {
                    numeric: {
                       //regexp: /^[\d\.,\s]+$/,
                        message: 'The age must be a number'
                    },
                    stringLength: {
                        min: 0,
                        max: 6,
                        message: 'The age must be less than 10 bit numeric'
                    }
            	}
            },
            'sampleAttrHuman.disease': {
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
            'sampleAttrHuman.cellLine': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in cellLine'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The cell line must be less than 100 characters'
                    }
            	}
            },
            'sampleAttrHuman.cellSubtype': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in cellSubtype'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The cell subtype must be less than 100 characters'
                    }
            	}
            },
            'sampleAttrHuman.cellType': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in cellType'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The cell type must be less than 100 characters'
                    }
            	}
            },
            'sampleAttrHuman.cultureCollection': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in cultureCollection'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The culture collection must be less than 100 characters'
                    }
            	}
            },
            'sampleAttrHuman.devStage': {
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
            'sampleAttrHuman.diseaseStage': {
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
            'sampleAttrHuman.ethnicity': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in ethnicity'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The ethnicity must be less than 100 characters'
                    }
            	}
            },
            'sampleAttrHuman.healthState': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in healthState'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The health state must be less than 100 characters'
                    }
            	}
            },
            'sampleAttrHuman.karyotype': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in karyotype'
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The karyotype must be less than 100 characters'
                    }
            	}
            },
            'sampleAttrHuman.phenotype': {
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
            'sampleAttrHuman.population': {
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
            'sampleAttrHuman.race': {
            	validators: {
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in race'
                    }
            	}
            },
            'sampleAttrHuman.type': {
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
            'sampleAttrHuman.treatment': {
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
            },
        }
	});
});