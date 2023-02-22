var externalLinkTemplate = 
'		<div class="row externalLink">\
			<div class="col-md-3">\
			  	<div class="form-group">\
	    			<input name="listExternalLinks[0].description" class="form-control"/>\
			  	</div></div>\
			<div class="col-md-3">\
			  	<div class="form-group">\
	    			<input name="listExternalLinks[0].externalLinkUrl" class="form-control"/>\
			  	</div></div>\
			<div class="col-md-1">\
				<a class="deleteBtn">\
					<span class="glyphicon glyphicon-trash" aria-hidden="true" style="padding-top:10px"> </span>\
				</a>\
			</div> </div>';	
var relatedProjectTemplate = 
	'<div class="row">\
		<div class="col-md-3">\
			<div class="form-group">\
				<input name="listRelatedProjects[0].relatedPrjAccession"  class="form-control"/> \
			</div>	\
		</div> \
		<div class="col-md-3">\
			<div class="form-group">\
				<input name="listRelatedProjects[0].description" class="form-control"/>\
			</div>	</div>\
		<div class="col-md-1">\
			<a class="deleteBtn">\
				<span class="glyphicon glyphicon-trash" aria-hidden="true" style="padding-top:10px"> </span>\
			</a>\
		</div>	</div>';

var refProjectTemplate = 
	'<div class="row">\
		<div class="col-md-3">\
			<div class="form-group">\
				<input name="listRefProjects[0].refAccession"  class="form-control"/> \
			</div>	\
		</div> \
		<div class="col-md-3">\
			<div class="form-group">\
				<select class="form-control refdb" name="listRefProjects[0].refDbName">\
					<option value="">--</option>\
					<option value="NCBI">NCBI</option>\
					<option value="DDBJ">DDBJ</option>\
					<option value="EBI">EBI</option>\
				</select>\
			</div>	</div>\
		<div class="col-md-1">\
			<a class="deleteBtn">\
				<span class="glyphicon glyphicon-trash" aria-hidden="true" style="padding-top:10px"> </span>\
			</a>\
		</div>	</div>';

var grantsTemplate = 
	'<div class="row">\
		<div class="col-md-2">\
			<div class="form-group">\
				<input name="listGrants[0].agency"  class="form-control"/> \
			</div>	\
		</div> \
		<div class="col-md-2">\
			<div class="form-group">\
				<input name="listGrants[0].agencyAbbr"  class="form-control"/> \
			</div>	\
		</div>\
		<div class="col-md-2">\
			<div class="form-group">\
				<input name="listGrants[0].grantID"  class="form-control"/> \
			</div>	\
		</div> \
		<div class="col-md-2">\
			<div class="form-group">\
				<input name="listGrants[0].grantTitle"  class="form-control"/> \
			</div>	\
		</div>\
		<div class="col-md-1">\
			<a class="deleteBtn">\
				<span class="glyphicon glyphicon-trash" aria-hidden="true" style="padding-top:10px"> </span>\
			</a>\
		</div>\
	</div>';

var providerTemplate = 
	'<div class="row">\
		<div class="col-md-3">\
			<div class="form-group">\
				<input name="listDataProviders[0].providerName"  class="form-control"/> \
			</div>	\
		</div> \
		<div class="col-md-3">\
			<div class="form-group">\
				<input name="listDataProviders[0].providerUrl" class="form-control"/>\
			</div>\
		</div>\
		<div class="col-md-1">\
			<a class="deleteBtn">\
				<span class="glyphicon glyphicon-trash" aria-hidden="true" style="padding-top:10px"> </span>\
			</a>\
		</div>\
	</div>';
function addOneRecord(addBtn,container, htmlTemplate){
	var size = countRecords(container);
	var r = new RegExp("\\[\\d+\\]","g");
	var content = htmlTemplate.replace(r, "["+size+"]");
	put(content, container);
//	alert(addBtn);				
	if(addBtn=='addExternalLink'){
//		alert("hhh");
		addExternalLinkValidator(size,container);
	}else if(addBtn=='addRelatedProject'){
		addRelatedProjectValidator(size,container);
	}else if(addBtn=='addRefProject'){
		addRefProjectValidator(size,container);
	}else if(addBtn=='addGrants'){
		addGrantsValidator(size,container);
	}else if(addBtn=='addProvider'){
		addDataProviderValidator(size,container);
	}		
}
function addExternalLinkValidator(size,container){
	$("#submitter").data('bootstrapValidator').addField('listExternalLinks['+size+'].description',{  
    	validators: {
    		regexp: {
    			regexp: despRegExp,
                message: 'The description can only consist of English character'
            }
    	}
    });
	
	$("#submitter").data('bootstrapValidator').addField('listExternalLinks['+size+'].externalLinkUrl',{  
    	validators: {
            uri: {
                allowLocal: true,
                message: 'The input is not a valid URL'
            }
    	}
    });
}
function addRelatedProjectValidator(size,container){
	$("#submitter").data('bootstrapValidator').addField('listRelatedProjects['+size+'].relatedPrjAccession',{  
    	validators: {
    		regexp: {
                regexp: /^PRJC[A-Z][0-9]{6}$/,
                message: 'Wrong bioProject accession.'
            }
    	}
    });
	$("#submitter").data('bootstrapValidator').addField('listRelatedProjects['+size+'].description',{  
    	validators: {
    		regexp: {
    			regexp: despRegExp,
                message: 'The description can only consist of English character'
            }
    	}
    });
}
function addRefProjectValidator(size,container){
	$("#submitter").data('bootstrapValidator').addField('listRefProjects['+size+'].refAccession',{  
    	validators: {
    		regexp: {
                regexp: /^[\w\s]+$/,
                message: 'The Accession can only consist of English character'
            }
    	}
    });
	$("#submitter").data('bootstrapValidator').addField('listRefProjects['+size+'].refDbName',{  
    	validators: {
    		regexp: {
                regexp: /^[A-Z\s]+$/,
                message: 'The database name can only consist of alphabetical'
            }
    	}
    });
}
function addGrantsValidator(size,container){
	$("#submitter").data('bootstrapValidator').addField('listGrants['+size+'].agency',{  
    	validators: {
    		regexp: {
    			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                message: 'The agency can only consist of English character'
            }
    	}
    });
	$("#submitter").data('bootstrapValidator').addField('listGrants['+size+'].agencyAbbr',{  
    	validators: {
    		regexp: {
    			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                message: 'The agency abbreviation can only consist of English character'
            }
    	}
    });
	$("#submitter").data('bootstrapValidator').addField('listGrants['+size+'].grantID',{  
    	validators: {
    		regexp: {
                regexp: /^[\w\s]+$/,
                message: 'The grant ID can only consist of alphabetical and number'
            }
    	}
    });
	$("#submitter").data('bootstrapValidator').addField('listGrants['+size+'].grantTitle',{  
    	validators: {
    		regexp: {
    			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                message: 'The grant title can only consist of English character'
            }
    	}
    });
}
function addDataProviderValidator(size,container){
	$("#submitter").data('bootstrapValidator').addField('listDataProviders['+size+'].providerName',{  
    	validators: {
    		regexp: {
    			regexp: /^[\w\s\(\)\-\&\.\!\$\%\*\+\,\.\?\[\]\@\#\^\{\}\/\\\<\>\|\;\:\'\"]+$/,
                message: 'The provider name can only consist of English character'
            }
    	}
    });
	$("#submitter").data('bootstrapValidator').addField('listDataProviders['+size+'].providerUrl',{  
    	validators: {
            uri: {
                allowLocal: true,
                message: 'The input is not a valid URL'
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
	$(document).on("click","#" + addBtn, function(){addOneRecord(addBtn,$("#"+container), template);});	
}

function countRecords(container){
	return container.find(".row").length - 1;
}

function put(content, container){
	container.find(".row:last").after(content);	
}

function shuffle(container){
	var r = new RegExp("\\[\\d+\\]","g");
	container.find(".row:gt(0)").each(function(index,value){
		$(this).find("input").each(function(){
			var name = $(this).attr("name").replace(r,"["+index+"]");
			$(this).attr("name",name);
		});
		$(this).find("select").each(function(){
			var name = $(this).attr("name").replace(r,"["+index+"]");
			$(this).attr("name",name);
		});
	});	
}

function getDeletion(btn){
	return btn.parent().parent();
}

$(function(){			
	$("input[type='radio']").click(function(){
		if($(this).val() == 1){
			$("#specified_date").css("display", "none");
		}else{
			$("#specified_date").css("display", "table");
		}
	});
	
  	var dbnames = '<s:property value="listRefProjects.{refDbName}" />';
  	dbnames = dbnames.substring(1, dbnames.length-1).split(",");
   	$(".odb").each(function(index, value) {
   		var dbname = dbnames[index];
   		$(this).find("option[value="+dbname+"]").attr("selected", "selected");
   	});
   	
	regist("deleteBtn", "addExternalLink", "externalLink", externalLinkTemplate);
	regist("deleteBtn", "addRelatedProject", "relatedProject", relatedProjectTemplate);
	regist("deleteBtn", "addRefProject", "refProject", refProjectTemplate);
	regist("deleteBtn", "addGrants", "grants", grantsTemplate);
	regist("deleteBtn", "addProvider", "dataProvider", providerTemplate);
});
