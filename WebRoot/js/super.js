		// used to show apply form
		function showApplyForm(runacc,runid,applyto){
			//alert("show");
			$("#applytoid").val(applyto);
			$("#currunid").val(runid);
			$("#runaccid").text(runacc);
			$("#dialog-apply").dialog({
				title:"Apply for Run Data",
				 width:800,
				 height:600, 
				 position:['center', 'top+100'],
				 modal:true
			}); 
		}
		function loadSuproject(params,chooseid,flag,allflag){
			$.ajax({
				url: '/egps/data/ajax/ajaxGetOrientation.action',
			    type:'post',
				dataType:'json',
				data:params,
				success:function(data){
					if(data.supProList!=null){
						$("#"+chooseid).empty();
						if(flag == 1){
								 $("div[id^='divborder']").css("display","none");
								 }
						if(allflag ==1){
						var option="<option value='1' selected='selected'>All</option>";
						$("#"+chooseid).append(option);
						}
						for(var i=0;i<data.supProList.length;i++){
							var subpro = data.supProList[i] ;
							var option="<option value='"+subpro.supPrjId+"'>"+subpro.nameEn+"</option>";
							$("#"+chooseid).append(option);
							//div
							if(flag == 1){
								 $("#divborder"+subpro.supPrjId).css("display","");
							}
						}
					}
				},
				error:function(){
					alert("error");
				}
			});
		}
		function changeOrien(){
			var orientval = $("#idorien").val();
			if(orientval == 1){
				window.location.href='/egps/data/showPagingAllData.action?isFirstSearchFlag=1';
			}else{
				var params={'proLevel':3,'supPrjid':orientval,'subPrjid':0};
				window.location.href='/egps/data/showAllData.action?supPrjid='+orientval;
				//get all the orient rundata
				//then we only need to show the selected orientation
			}
		}
		
		function ChangeProject(){
			var proval = $("#idsubpro").val();
			$("div[id^='divborder']").css("display","none");
		 	$("#divborder"+proval).css("display","");
		}