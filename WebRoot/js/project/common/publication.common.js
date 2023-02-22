var publicationTemplate = 
	'<div class="row part">\
	<div class="col-md-3 pubmed">\
	<div class="form-group">\
		<input name="listPublication[0].pubmedId" class="form-control" /></div>\
	</div>\
	<div class="col-md-1"></div>\
	<div class="col-md-6 doiContent">\
	<div class="row">\
		<div class="col-md-6 doi">\
			<div class="form-group">\
				<input name="listPublication[0].doi" class="form-control doi"/></div></div>\
	</div>\
	<div class="doiContent" style="display:none">\
	<div class="row">\
		<div class="col-md-6">\
			<div class="form-group">\
				<label for="journalTitle0">Journal name</label>\
				<input id="journalTitle0" name="listPublication[0].journalTitle" class="form-control"/></div></div></div>\
	<div class="row">\
	<div class="col-md-6">\
	<div class="form-group">\
			<label for="articleTitle0">article title</label>\
			<input id="articleTitle0" name="listPublication[0].articleTitle" class="form-control"/></div></div></div>\
	<div class="row">\
		<div class="col-md-2">\
			<div class="form-group">\
				<label for="year0">Year</label>\
				<input id="year0" name="listPublication[0].year" class="form-control"/></div></div><div class="col-md-2">\
			<div class="form-group">\
				<label for="volume0">Volume</label>\
				<input id="volume0" name="listPublication[0].volume" class="form-control"/></div></div><div class="col-md-2">\
			<div class="form-group">\
				<label for="issue0">Issue</label>\
				<input id="issue0" name="listPublication[0].issue" class="form-control"/></div></div><div class="col-md-3">\
			<div class="form-group">\
				<label for="pagefrom0">Page from</label>\
				<input id="pagefrom0" name="listPublication[0].pagefrom" class="form-control"/></div></div><div class="col-md-3">\
			<div class="form-group">\
				<label for="pageto0">Page to</label>\
				<input id="pageto0" name="listPublication[0].pageto" class="form-control"/></div></div></div>\
	<div class="row">\
		<div class="col-md-12">\
			<div class="form-group">\
				<label for="authorList0">Author list</label>\
				<textarea id="authorList0" name="listPublication[0].authorList" rows="4" class="form-control"></textarea></div></div></div></div>\
	</div>\
	<div class="col-md-1">\
	<a class="deleteBtn">\
		<span class="glyphicon glyphicon-trash" aria-hidden="true" style="padding-top:10px"> </span>\
	</a>\
	</div></div>';

function addOneRecord(container, htmlTemplate){
	var size = countRecords(container);
	//alert(size);
	var r = new RegExp("\\[\\d+\\]","g");
	var content = htmlTemplate.replace(r, "["+size+"]");
	//alert("content:"+content);
	put(content, container);
    //listPublication['+#st.index+'].pubmedId
	$("#submitter").data('bootstrapValidator').addField('listPublication['+size+'].pubmedId',{  
        validators: {
        	regexp: {
                regexp: /^[1-9][\d]{0,9}$/,
                message: 'Pubmed ID can only consist of number, with length of 1-10.'
            }
        }
    }); 
	
	$("#submitter").data('bootstrapValidator').addField('listPublication['+size+'].doi',{  
        validators: {
        	regexp: {
                regexp: /^[\w\.\/-]+\/[\w\/-]+$/,
                message: 'Wrong doi format.'
            }
        }
    });
	
	$("#submitter").data('bootstrapValidator').addField('listPublication['+size+'].journalTitle',{  
        validators: {
        	regexp: {
    			regexp: titeRegExp,
                message: 'Journal title can only consist of English character'
            }
        }
    });
	
	$("#submitter").data('bootstrapValidator').addField('listPublication['+size+'].articleTitle',{  
        validators: {
        	regexp: {
    			regexp: titeRegExp,
                message: 'Article title can only consist of English character'
            }
        }
    });
	
	$("#submitter").data('bootstrapValidator').addField('listPublication['+size+'].year',{  
        validators: {
        	regexp: {
    			regexp: /^[12]\d{3}$/,
                message: 'Year can only consist of 4 numbers'
            }
        }
    });
	
	$("#submitter").data('bootstrapValidator').addField('listPublication['+size+'].volume',{  
    	validators: {
    		regexp: {
    			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                message: 'The article title can only consist of English character'
            }
    	}
    });
	$("#submitter").data('bootstrapValidator').addField('listPublication['+size+'].issue',{  
    	validators: {
    		regexp: {
    			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                message: 'The article title can only consist of English character'
            }
    	}
    });
	$("#submitter").data('bootstrapValidator').addField('listPublication['+size+'].pagefrom',{  
    	validators: {
    		regexp: {
    			regexp: /^[1-9][0-9]*$/,
                message: 'Start page must be a number.'
            }
    	}
    });
	$("#submitter").data('bootstrapValidator').addField('listPublication['+size+'].pageto',{  
    	validators: {
    		regexp: {
    			regexp: /^[1-9][0-9]*$/,
                message: 'End page must be a number.'
            },
			callback: {
				message: 'Page From and page to must be both digitals or empty, page to cannot less than page from.',
				callback:function(value, validator,$field){
					var pageFrom = $("input[name='listPublication["+size+"].pagefrom']").val();
					if(pageFrom==''){
						return (value=='');
					}else if(pageFrom!=''){
						return(value!='' && parseInt(value)>=parseInt(pageFrom))
					}

			}
    	}
    }
    });
	
}

function deleteOneRecord(btn, containerClass){
	var target = getDeletion(btn);
	target.remove();
	shuffle(containerClass);
}

function regist(dltBtn, addBtn, container, template){
	$(document).on("click","." + dltBtn, function(){deleteOneRecord($(this), $("#"+container));});
	$(document).on("click","#" + addBtn, function(){addOneRecord($("#"+container), template);});	
}

function countRecords(container){
	return $(".part").length;
}

function put(content, container){
	var a=$("#content_container .part");
	if(a.length>0){
		//alert("yes.");
		//alert(a);
		$("#content_container .part:last").after(content);
	}
		
	else{
		//alert("no.");
		$("#content_container .row").after(content);
	}
		
}

function shuffle(container){
	var r = new RegExp("\\[\\d+\\]","g");
	$("#content_container .part").each(function(index,value){
		$(this).find("input").each(function(){
			var name = $(this).attr("name").replace(r,"["+index+"]");
			$(this).attr("name",name);
		});
	});	
}

function getDeletion(btn){
	return btn.parent().parent();
}

$(function(){	
	$(".doi").each(function(){
		var v = $(this).find("input").val();
		if(v == ''){
			$(this).find(".doiContent").css("display", "none");
		}else{
			$(this).find(".doiContent").css("display", "block");
		}
	}); 
	$(document).on("focus", ".doi", function() {
		$(this).parent().parent().parent().siblings().css("display", "block");
	});
	$(document).on("blur", ".doi", function() {
		var v1 = $(this).val();
		var v2 = $(this).parent().parent().parent().parent().find("div:eq(1) input").val();
		if ((v1+v2) == "") {
			$(this).parent().parent().parent().siblings().css("display", "none");
		}
	});	
	regist("deleteBtn", "addpublication", "content_container", publicationTemplate);	
});
