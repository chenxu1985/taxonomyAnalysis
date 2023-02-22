
$(function(){
	//var relevances = ["Agricultural","Medical","Industrial","Environmental","Evolution","Model organism"];
	//$("#relevance").autocomplete({
		//source: relevances,
		//delay:0,
		//minLength:0,
		//autoFocus:true
	//}).focus(function(){     
  	 // $(this).autocomplete("search");
  //  });
	
	var platform = "The sequencing platform and instrument model.";
	var alias = "Submission name of the experiment. This field is used when the record does not yet have an accession and needs to be referenced by other objects";
	var title  = "Short text that can be used to call out experiment records in searches or in displays. This element is technically optional but should be used for all new records";
	var prjAcc = "Link data to BioProject that describes the research effort.";
	var sampleAcc = "Enter a BioSample or SRA Sample Accession. BioSample accessions have 'SAMN' prefix. SRA Sample Accessions have 'SRS' prefix. A BioSample describes the biological source material for your sequence library preparation";
	var libDesign = "Additional details about your experimental design and molecular strategies including hybrid selection and affinity capture reagents; any detail that distinguishes your experiment from other similar experiments.";
	var strategy = "Sequencing technique intended for this library.";
	var source = "The library source specifies the type of source material that is being sequenced.";	 
	var selection = "Whether any method was used to select and/or enrich the material being sequenced.";
	var libLayout = "Library Layout specifies whether to expect single, paired, or other configuration of reads. In the case of paired reads, information about the relative distance and orientation is specified.";
	var library = "The library descriptor specifies the origin of the material being sequenced and any treatments that the material might have undergone that affect the sequencing result. This specification is needed even if the platform does not require a library construction step per se.";
	///	var projectTitle =  "Provide a brief title, as a phrase or short sentence for public display. \
//								Examples: 1) Chromosome Y sequencing; 2) Opportunistic pathogen that causes \
//								important food-born disease; 3) Global studies of microbial diversity on human skin.";
//	var desciption = "Provide a description (a paragraph) of the study goals and relevance.";
//	var linkDescription = "Display name of web site that is related to this study.";
//	var linkUrl = "URL of web site that is related to this study.";
//	var agency = "The name of funding source. For example: 1) National Human Genome Research Institute; 2) National Science Foundation; 3) Howard Hughes Medical Institute.";
//    var agencyAbbr = "Abbreviation of funding source. For example: 1) NHGRI; 2) NSF; 3) HHMI.";
//    var grantId = "Grant number information is collected to support searches (e.g., publications often cite Grant numbers).";
//    var grantTitle = "Grant title may also support searches.";
//    var consortiumName = "If study is carried out as part of a consortium, provide the consortium name.";
//    var consortiumUrl = "If the consortium maintains a web site,  provide the URL.";
//    var dataProvider = "Indicate the data provider (data submitter) if it is someone other than the submitting organization or consortium. For example, a sequencing center or a DACC.";
//    var dataProviderUrl = "If you would like use to present a link to the data provider then please provide the URL.";
//    var biomaterialProvider = "Indicate the source of the study material (eg ATCC ID or a Principal Investigator or lab).";
	var pos = {my: 'bottom left',at: 'top center'};
	$("#help-platform").qtip({
		content:platform,
		position:pos
	});
	$("#help-alias").qtip({
		content:alias,
		position:pos
	});	
	$("#help-title").qtip({
		content:title,
		position:pos
	});	
	
	$("#help-sel_project").qtip({
		content:prjAcc,
		position:pos
	});
	$("#help-sel_sample").qtip({
		content:sampleAcc,
		position:pos
	});
	$("#help-libDesign").qtip({
		content:libDesign,
		position:pos
	});
	$("#help-strategy").qtip({
		content:strategy,
		position:pos
	});
	$("#help-source").qtip({
		content:source,
		position:pos
	});
	$("#help-selection").qtip({
		content:selection,
		position:pos
	});
	$("#help-libLayout").qtip({
		content:libLayout,
		position:pos
	});
	$("#help-library").qtip({
		content:library,
		position:pos
	});
});