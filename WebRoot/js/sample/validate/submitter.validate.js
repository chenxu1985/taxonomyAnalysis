$(function(){
	$("#submitter").bootstrapValidator({
		message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'sampleSubmitter.firstName': {
                validators: {
                    notEmpty: {
                        message: 'First name is required'
                    },
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in name'
                    },
                    stringLength: {
                        min: 0,
                        max: 32,
                        message: 'The name must be less than 32 characters'
                    }
                }
            },
            'sampleSubmitter.middleName': {
                validators: {
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in name'
                    },
                    stringLength: {
                        min: 0,
                        max: 32,
                        message: 'The name must be less than 32 characters'
                    }
                }
            },
            'sampleSubmitter.lastName': {
                validators: {
                    notEmpty: {
                        message: 'Last name is required'
                    },
                    regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in name'
                    },
                    stringLength: {
                        min: 0,
                        max: 32,
                        message: 'The name must be less than 32 characters'
                    }
                }
            },
            'sampleSubmitter.email': {
                validators: {
                    notEmpty: {
                        message: 'You should give your primary email'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: 'The email must be less than 50 characters'
                    }
                }
            },
            'sampleSubmitter.emailSecondary': {
            	validators: {
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: 'The email must be less than 50 characters'
                    }
            	}
            },
            'sampleSubmitter.organization': {
            	validators: {
            		notEmpty: {
            			message: 'Organization field is required'
            		},
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in organization'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The organization must be less than 255 characters'
                    }
            	}
            },
            'sampleSubmitter.submitOrganizationUrl': {
            	validators: {
                    uri: {
                        allowLocal: true,
                        message: 'The input is not a valid URL'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The organization url must be less than 255 characters'
                    }
            	}
            },
            
            'sampleSubmitter.department': {
            	validators: {
            		notEmpty: {
            			message: 'Department field is required'
            		},
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in department'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The department must be less than 255 characters'
                    }
            	}
            },
            'sampleSubmitter.phone': {
            	validators: {
            		stringLength: {
                        min: 8,
                        max: 12,
                        message: 'The phone is more than 8 numbers and less than 12 numbers'
                    },
                    regexp: {
                        regexp: /^[0-9\-]+$/,
                        message: 'The phone is not valid'
                    }
            	}
            },
            'sampleSubmitter.fax': {
            	validators: {
            		stringLength: {
                        min: 8,
                        max: 12,
                        message: 'The fax is more than 8 numbers and less than 12 numbers'
                    },
                    regexp: {
                        regexp: /^[0-9\-]+$/,
                        message: 'The fax is not valid'
                    }
            	}
            },
            
            'sampleSubmitter.street': {
            	validators: {
            		notEmpty: {
            			message: 'Street field is required'
            		},
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in street'
                    },
                    stringLength: {
                        min: 0,
                        max: 255,
                        message: 'The street must be less than 255 characters'
                    }
            	}
            },
            'sampleSubmitter.city': {
            	validators: {
            		notEmpty: {
            			message: 'City field is required'
            		},
            		regexp: {
                        regexp: englishRegExp,
                        message: 'Only ASCII characters may be used in city'
                    },
                    stringLength: {
                        min: 0,
                        max: 32,
                        message: 'The city must be less than 32 characters'
                    }
            	}
            },
            'sampleSubmitter.postalCode': {
            	validators: {
            		notEmpty: {
            			message: 'Postal code field is required'
            		},
            		regexp: {
                        regexp: /^[0-9]{6}$/,
                        message: 'Only six number characters may be used in postal code'
                    }
            	}
            },
            'sampleSubmitter.country.countryId': {
            	validators: {
            		notEmpty: {
            			message: 'You should choose a country/region'
            		}
            	}
            }            
        }
	}) 
});