function x_LIBRARY_LAYOUTSelectChange(bForsed){
			//alert("hahha");
			var oLIBRARY_LAYOUT=document.getElementById("LIBRARY_LAYOUT");
			var sLIBRARY_LAYOUT="";
			var iSingle=0;
			var iPaired=1;
			//alert("oLIBRARY_LAYOUT.selectedIndex:"+oLIBRARY_LAYOUT.selectedIndex);
			switch(oLIBRARY_LAYOUT.selectedIndex){
				case iSingle:
					sLIBRARY_LAYOUT="SINGLE";
					//document.getElementById("MATE1").value="";
					//document.getElementById("MATE2").value="";
					//document.getElementById("READSINGLE").value="";
					break;
				case iPaired:
					sLIBRARY_LAYOUT="PAIRED";
					//document.getElementById("READSINGLE").value="";
					//document.getElementById("MATE1").value="";
					//document.getElementById("MATE2").value="";
					break;
			}
			//alert("sLIBRARY_LAYOUT:"+sLIBRARY_LAYOUT);
			var oPlatform=document.getElementById("PLATFORM");
			var sPlatformInstrument="";
			var sPlatform="";
			if(oPlatform){
				//alert('oPlatform');
				sPlatformInstrument=oPlatform[oPlatform.selectedIndex].value;
				sPlatform=sPlatformInstrument;
				//alert('sPlatform:'+sPlatform);
//                <option value="12">AB 3730xL Genetic Analyzer</option>
//                <option value="14">AB 5500xl Genetic Analyzer</option>
//                <option value="22">Complete Genomics</option>
//                <option value="23">Helicos HeliScope</option>
//                <option value="24">Illumina Genome Analyzer</option>
//                <option value="25">Illumina Genome Analyzer II</option>
//                <option value="26">Illumina Genome Analyzer IIx</option>
//                <option value="27">Illumina HiScanSQ</option>
//                <option value="28">Illumina HiSeq 1000</option>
//                <option value="29">Illumina HiSeq 1500</option>
//                <option value="30">Illumina HiSeq 2000</option>
//                <option value="31">Illumina HiSeq 2500</option>
//                <option value="32">Illumina MiSeq</option>
//                <option value="33">Ion Torrent PGM</option>
//                <option value="34">Ion Torrent Proton</option>
//                <option value="35">PacBio RS</option>
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
				//alert('sPlatform:'+sPlatform);
			}
			if(sPlatform=="HELICOS"){
				oLIBRARY_LAYOUT.selectedIndex=iSingle;
				sLIBRARY_LAYOUT="SINGLE";
			}
			var oDivPAIRED=document.getElementById("PAIRED");
			if(oDivPAIRED){
				var display="none";
				if(sLIBRARY_LAYOUT=="PAIRED"){
					display="";
				}
				oDivPAIRED.style.display=display;
			}
			var oDivSPOT_DESCRIPTOR_ILLUMINA_SINGLE=document.getElementById("SPOT_SINGLE");
			//alert("oDivSPOT_DESCRIPTOR_ILLUMINA_SINGLE:"+oDivSPOT_DESCRIPTOR_ILLUMINA_SINGLE);
			//alert("sLIBRARY_LAYOUT:"+sLIBRARY_LAYOUT);
			if(oDivSPOT_DESCRIPTOR_ILLUMINA_SINGLE){
				//alert("single");
				//alert($("#READSINGLE").attr("value"));
				if($("#READSINGLE").val()==0)
				$("#READSINGLE").value="";
				var display="none";
				if(sPlatform=="ILLUMINA"&&sLIBRARY_LAYOUT=="SINGLE"){
					display="";
				}
				//oDivPAIRED.style.display=display;
				oDivSPOT_DESCRIPTOR_ILLUMINA_SINGLE.style.display=display;
			}
			var oDivSPOT_DESCRIPTOR_ILLUMINA_PAIRED=document.getElementById("SPOT_PAIRED");
			if(oDivSPOT_DESCRIPTOR_ILLUMINA_PAIRED){
				//alert("paried");
				if($("#MATE1").val()==0)
					$("#MATE1").attr("value","");
				if($("#MATE2").val()==0)
					$("#MATE2").attr("value","");;
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