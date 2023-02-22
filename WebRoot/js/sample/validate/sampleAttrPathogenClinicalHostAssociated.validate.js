
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
                        message: 'Only ASCII characters may be used in sample name '
                    },
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The name must be less than 100 characters'
                    }
        		}
        	},
        	'sampleAttrPathogenClinicalHost.taxon.name': {
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
        	'sampleAttrPathogenClinicalHost.hostTaxon.name': {
        		validators: {
        			notEmpty: {
        				message: 'Host taxon name is required.'
        			},
        			regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in host taxon name '
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: 'The taxon name must be less than 50 characters'
                    }
        		}
        	},
        	'sampleAttrPathogenClinicalHost.hostDisease': {
        		validators: {
        			notEmpty: {
        				message: 'Host disease is required.'
        			},
        			regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in host disease name'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The disease name must be less than 255 characters'
                    }
        		}
        	},
        	'sampleAttrPathogenClinicalHost.isolationSource': {
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
        	'sampleAttrPathogenClinicalHost.latitudeLongitude': {
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
            'sampleAttrPathogenClinicalHost.collectedBy': {
                validators: {
                    notEmpty: {
                        message: 'This field is required.'
                    },
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in collected '
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The collected must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenClinicalHost.collectionDate': {
            	validators: {
                    notEmpty: {
                        message: 'This field is required.'
                    },            		
                    date: {
                        format: 'YYYY-MM-DD'
                    }
            	}
            },
            'sampleAttrPathogenClinicalHost.hostAge': {
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
            'sampleAttrPathogenClinicalHost.geographicLocation': {
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
            'sampleAttrPathogenClinicalHost.isolate': {
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
            'sampleAttrPathogenClinicalHost.strain': {
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
            'sampleAttrPathogenClinicalHost.cultureCollection': {
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
            'sampleAttrPathogenClinicalHost.genotype': {
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
            'sampleAttrPathogenClinicalHost.hostDescription': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in host description'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The description must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenClinicalHost.hostDiseaseStage': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in disease stage'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The disease stage must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenClinicalHost.hostHealthState': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in health state'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The health stage must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenClinicalHost.hostSubjectId': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in subject'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The host subject must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenClinicalHost.hostTissueSampled': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in tissue sampled'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The host tissue must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenClinicalHost.passageHistory': {
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
            'sampleAttrPathogenClinicalHost.pathotype': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in pathotype'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The pathotype must be less than 255 characters'
                    }
                }
            },
            'sampleAttrPathogenClinicalHost.serotype': {
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
            'sampleAttrPathogenClinicalHost.serovar': {
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
            'sampleAttrPathogenClinicalHost.specimenVoucher': {
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
            'sampleAttrPathogenClinicalHost.subgroup': {
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
            'sampleAttrPathogenClinicalHost.subtype': {
                validators: {
                    regexp: {
                        regexp: englishRegExpTreatment,
                        message: 'Only ASCII characters may be used in subtype'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The subtype must be less than 255 characters'
                    }
                }
            }
        }
	});
});