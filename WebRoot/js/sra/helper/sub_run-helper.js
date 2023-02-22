$(function(){	
	var alias = "Submitter assigned name or id for the GSA submission object.";
	var runDataType  = "The storage format of the sequence data being submitted.";
	var fileName = "Name of the file transferred to GSA which we recommend to be compressed format(e.g. *.zip or *.tar.gz).";
	var md5Checksum = "32-character alphanumeric string that can be computed with native command line tools 'md5' (Mac OS X) or 'md5sum' (Linux). Windows users will need to download a 3rd-party utility. ";
	
	
	var pos = {my: 'bottom left',at: 'top center'};
	$("#help-alias").qtip({
		content:alias,
		position:pos
	});
	$("#help-runFileType").qtip({
		content:runDataType,
		position:pos
	});	
	$("#help-fileName").qtip({
		content:fileName,
		position:pos
	});	
	
	$("#help-md5").qtip({
		content:md5Checksum,
		position:pos
	});
});