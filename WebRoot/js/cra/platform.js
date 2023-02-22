function x_LIBRARY_LAYOUTSelectChange(bForsed){
	var oLIBRARY_LAYOUT=document.getElementById("LIBRARY_LAYOUT");
	var sLIBRARY_LAYOUT="";			var iSingle=0;			var iPaired=1;
	switch(oLIBRARY_LAYOUT.selectedIndex){
		case iSingle:	sLIBRARY_LAYOUT="SINGLE";	break;
		case iPaired:	sLIBRARY_LAYOUT="PAIRED";	break;
	}
	var oPlatform=document.getElementById("PLATFORM");
	var sPlatformInstrument="";			var sPlatform="";
	if(oPlatform){
		sPlatformInstrument=oPlatform[oPlatform.selectedIndex].value;
		sPlatform=sPlatformInstrument;
		if(sPlatformInstrument==12){
			sPlatform="CAPILLARY_AB_3730xL";
		}else if(sPlatformInstrument==14 || sPlatformInstrument==24 || sPlatformInstrument==25 || sPlatformInstrument==26 || sPlatformInstrument==27 || sPlatformInstrument==28 || sPlatformInstrument==29 || sPlatformInstrument==30 || sPlatformInstrument==31 || sPlatformInstrument==32 || sPlatformInstrument==36 || sPlatformInstrument==37 ||sPlatformInstrument==38 ||sPlatformInstrument==39){
			sPlatform="ILLUMINA";
		}else if(sPlatformInstrument==22){
			sPlatform="COMPLETE_GENOMICS";
		}else if(sPlatformInstrument==23){
			sPlatform="HELICOS";
		}else if(sPlatformInstrument==33){
			sPlatform="ION_TORRENT";
		}else if(sPlatformInstrument==34){
			sPlatform="ION_TORRENT_Proton";
		}else if(sPlatformInstrument==35){
			sPlatform="PACBIO_SMRT";
		}
	}
	if(sPlatform=="HELICOS"){
		oLIBRARY_LAYOUT.selectedIndex=iSingle;				sLIBRARY_LAYOUT="SINGLE";
	}
	var oDivPAIRED=document.getElementById("PAIRED");
	if(oDivPAIRED){
		var display="none";
		if(sLIBRARY_LAYOUT=="PAIRED"){	display="";	}
		oDivPAIRED.style.display=display;
	}
	var oDivSPOT_DESCRIPTOR_ILLUMINA_SINGLE=document.getElementById("SPOT_SINGLE");
	if(oDivSPOT_DESCRIPTOR_ILLUMINA_SINGLE){
		if($("#READSINGLE").val()==0)
		$("#READSINGLE").value="";
		var display="none";
		if(sPlatform=="ILLUMINA"&&sLIBRARY_LAYOUT=="SINGLE"){	display="";	}
		oDivSPOT_DESCRIPTOR_ILLUMINA_SINGLE.style.display=display;
	}
	var oDivSPOT_DESCRIPTOR_ILLUMINA_PAIRED=document.getElementById("SPOT_PAIRED");
	if(oDivSPOT_DESCRIPTOR_ILLUMINA_PAIRED){
		if($("#MATE1").val()==0)	$("#MATE1").attr("value","");
		if($("#MATE2").val()==0)	$("#MATE2").attr("value","");
		oDivSPOT_DESCRIPTOR_ILLUMINA_PAIRED.style.display=(sPlatform=="ILLUMINA"&&sLIBRARY_LAYOUT=="PAIRED"?"":"none");
	}
	var oDivSPOT_DESCRIPTOR_HELICOS=document.getElementById("SPOT_HELICOS");
	if(oDivSPOT_DESCRIPTOR_HELICOS){
		var display="none";
		if(sPlatform=="HELICOS"){
			display="";
			oLIBRARY_LAYOUT.selectedIndex=iSingle;
		}
		oDivSPOT_DESCRIPTOR_HELICOS.style.display=display;
	}
}
