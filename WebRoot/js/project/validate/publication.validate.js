$(function(){
	function validation(){
		var flag = true;
		$(".part").each(function(index, value) {
			var pubmed = $(this).find(".pubmed").find("input").val();
			var others = $(this).find(".doi").find("input").val(); 
			//alert(pubmed);
			//alert(others);
			if(!pubmed && !others){
				$(this).css({
					"border": "2px solid red"
				});
				flag = false;
			}
		});
		if(!flag){
			$("#publicationError").remove();
			$("#errorMsg").append("<li id=publicationError>You must submit a PubMed ID OR a DOI ID!</li>");
		}
		return flag;
	}
	$(document).on("focus", "input", function(){
		$("#publicationError").remove();
		$(this).parentsUntil($(".part")).parent().css("border", "");
	});
	$("form").submit(function(){
		//return validation();
	});
	
	$("#submitter").bootstrapValidator({
		message: 'This value is not valid',
        feedbackIcons: {
            //valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'listPublication[0].pubmedId': {
                validators: {
                	regexp: {
                        regexp: /^[1-9][\d]{0,9}$/,
                        message: 'The pubmed Id can only consist of number, with length of 1-10.'
                    }
                }
            },
            'listPublication[0].doi':{
            	validators: {
                	regexp: {
                        regexp: /^[\w\.\/-]+\/[\w\/-]+$/,
                        message: 'Wrong doi format.'
                    }
                }
            },
            'listPublication[0].journalTitle':{
            	validators: {
            		regexp: {
            			regexp: titeRegExp,
                        message: 'The journal title can only consist of English character'
                    }
            	}
            },
            'listPublication[0].articleTitle':{
            	validators: {
            		regexp: {
            			regexp: titeRegExp,
                        message: 'The article title can only consist of English character.'
                    }
            	}
            },
            'listPublication[0].year':{
            	validators: {
            		regexp: {
            			regexp: /^[12]\d{3}$/,
                        message: 'The year can only consist of 4 numbers'
                    }
            	}
            },
            'listPublication[0].volume':{
            	validators: {
            		regexp: {
            			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                        message: 'The article title can only consist of English character'
                    }
            	}
            },
            'listPublication[0].issue':{
            	validators: {
            		regexp: {
            			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                        message: 'The article title can only consist of English character'
                    }
            	}
            },
            'listPublication[0].pagefrom':{
            	validators: {
            		regexp: {
            			regexp: /^[1-9][0-9]*$/,
                        message: 'Start page must be a number.'
                    }
            	}
            },
            'listPublication[0].pageto':{
            	validators: {
            		regexp: {
            			regexp: /^[1-9][0-9]*$/,
                        message: 'End page must be a number.'
                    },
    				callback: {
    					message: 'Page From and page to must be both digitals or empty, page to cannot less than page from.',
    					callback:function(value, validator,$field){
    						var pageFrom = $("input[name='listPublication[0].pagefrom']").val();
    						if(pageFrom==''){
    							return (value=='');
    						}else if(pageFrom!=''){
    							return(value!='' && parseInt(value)>=parseInt(pageFrom))
    						}

    				}
            	}
            }
            },
            'listPublication[0].authorList':{
            	validators: {
            		regexp: {
            			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                        message: 'The article title can only consist of English character'
                    }
            	}
            }
        }
	})
});