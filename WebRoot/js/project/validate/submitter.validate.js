$(function(){
	$("#submitter").bootstrapValidator({
		message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'submitter.firstName': {
                validators: {
                    notEmpty: {
                        message: 'First name is required'
                    },
                    regexp: {
                        regexp: /^[\w\s\(\)\-\&\.]+$/,
                        message: 'The name can only consist of English character'
                    }
                }
            },
            'submitter.middleName': {
                validators: {
                    regexp: {
                        regexp: /^[\w\s\(\)\-\&\.]+$/,
                        message: 'The name can only consist of English character'
                    }
                }
            },
            'submitter.lastName': {
                validators: {
                    notEmpty: {
                        message: 'Last name is required'
                    },
                    regexp: {
                        regexp: /^[\w\s\(\)\-\&\.]+$/,
                        message: 'The name can only consist of English character'
                    }
                }
            },
            'submitter.email': {
                validators: {
                    notEmpty: {
                        message: 'You should give your primary email'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }                    
                }
            },
            'submitter.emailSecondary': {
            	validators: {
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
            	}
            },
            'submitter.organization': {
            	validators: {
            		notEmpty: {
            			message: 'Organization field is required'
            		},
            		regexp: {
                        regexp: /^[\w\s\(\)\-\&\.]+$/,
                        message: 'The organization can only consist of English character'
                    }
            	}
            },
            'submitter.submitOrganizationUrl': {
            	validators: {
                    uri: {
                        allowLocal: true,
                        message: 'The input is not a valid URL'
                    }
            	}
            },
            
            'submitter.department': {
            	validators: {
            		notEmpty: {
            			message: 'Department field is required'
            		},
            		regexp: {
                        regexp: /^[\w\s\(\)\-\&\.]+$/,
                        message: 'The department can only consist of English character'
                    }
            	}
            },
            'submitter.phone': {
            	validators: {
            		stringLength: {
                        min: 8,
                        max: 12,
                        message: 'The phone is more than 8 numbers and less than 12 numbers'
                    },
                    regexp: {
                        regexp: /^[0-9\-\(\)\s]+$/,
                        message: 'The phone is not valid'
                    }
            	}
            },
            'submitter.fax': {
            	validators: {
            		stringLength: {
                        min: 8,
                        max: 12,
                        message: 'The fax is more than 8 numbers and less than 12 numbers'
                    },
                    regexp: {
                        regexp: /^[0-9\-\(\)\s]+$/,
                        message: 'The phone is not valid'
                    }
            	}
            },
            
            'submitter.street': {
            	validators: {
            		notEmpty: {
            			message: 'Street field is required'
            		},
            		regexp: {
                        regexp: /^[\w\s\(\)\-\&\.]+$/,
                        message: 'The street can only consist of English character'
                    }
            	}
            },
            'submitter.city': {
            	validators: {
            		notEmpty: {
            			message: 'City field is required'
            		},
            		regexp: {
                        regexp: /^[\w\s\(\)\-\&\.]+$/,
                        message: 'The city can only consist of English character'
                    }
            	}
            },
            'submitter.state': {
            	validators: {
            		regexp: {
                        regexp: /^[\w\s\(\)\-\&\.]+$/,
                        message: 'The state can only consist of English character'
                    }
            	}
            },
            'submitter.postalCode': {
            	validators: {
            		notEmpty: {
            			message: 'Postal code field is required'
            		},
            		regexp: {
                        regexp: /^[0-9]{6}$/,
                        message: 'The street can only consist of number'
                    }
            	}
            },
            'submitter.country.countryId': {
            	validators: {
            		notEmpty: {
            			message: 'You should choose a country/region'
            		}
            	}
            }            
        }
	}) 
});