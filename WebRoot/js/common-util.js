function joinString(s){
	if(s==null){
		return
	}
	var stringArray = s.split("_");
	var newString = "";
	stringArray.forEach(function(str){
		newString += str.replace(str.substring(0,1),str.substring(0,1).toUpperCase()); 
	});
	newString = newString.replace(newString.substring(0,1), newString.substring(0,1).toLowerCase());
	return newString;
} 

function sampleNav(status, index){
/*	if(isNaN(status)){
		$("#submitNav1 .submit_progress_bar_interval").attr("class", "submit_progress_bar_interval bar_disabled");
		$("#submitNav1 a:gt(0)").attr("class", "pull-right a-disabled");
		$("#submitNav1 span:gt(0)").attr("class", "badge-disabled");
		$("#submitNav2 a:gt(0)").attr("class", "pull-right a-disabled");
	}else if(status >= 0 && status < 3){
		$("#submitNav1 .submit_progress_bar_interval:gt("+status+")").attr("class", "submit_progress_bar_interval bar_disabled");
		$("#submitNav1 a:gt("+(status+1)+")").attr("class", "pull-right a-disabled");
		$("#submitNav1 span:gt("+(status+1)+")").attr("class", "badge-disabled");
		$("#submitNav2 a:gt("+(status+1)+")").attr("class", "pull-right a-disabled");
	}
	$("#submitNav1 span:eq("+(index-1)+")").attr("class", "badge-active badge-choosed"); 
	$("#submitNav2 span:eq("+(index-1)+")").attr("class", "spanActive");*/
	projectNav(status, index);
}
function projectNav(status, index){
	if(isNaN(status)){
		//$("#submitNav1 .submit_progress_bar_interval").attr("class", "submit_progress_bar_interval bar_disabled");
		$("#submitNav1 a:gt(0)").attr("class", "badge-active a-disabled");
		//$("#submitNav1 span:gt(0)").attr("class", "badge-disabled");
		//$("#submitNav2 a:gt(0)").attr("class", "pull-right a-disabled");
	}else if(status >= 0 && status < 4){
		//$("#submitNav1 .submit_progress_bar_interval:gt("+status+")").attr("class", "submit_progress_bar_interval bar_disabled");
		$("#submitNav1 a:gt("+(status+1)+")").attr("class", "badge-active a-disabled");
		//$("#submitNav1 span:gt("+(status+1)+")").attr("class", "badge-disabled");
		//$("#submitNav2 a:gt("+(status+1)+")").attr("class", "pull-right a-disabled");
	}
	$("#submitNav1 a:eq("+(index-1)+")").attr("class", "badge-active badge-choosed"); 
	//$("#submitNav2 span:eq("+(index-1)+")").attr("class", "spanActive"); 
}

function fillZeros(num){
	var n=5;
	var r = 0;
	var result = num+"";
	while(num >= 1){
    	num = num/10;
    	r++;
	}
	if(r>=n){
		return result;
	}else{
		for(var i=0; i < n-r; i++){
			result = "0"+result;
		}
		return result; 
    }
}

Date.prototype.pattern=function(fmt) {         
    var o = {         
    "M+" : this.getMonth()+1, //月份         
    "d+" : this.getDate(), //日         
    "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时         
    "H+" : this.getHours(), //小时         
    "m+" : this.getMinutes(), //分         
    "s+" : this.getSeconds(), //秒         
    "q+" : Math.floor((this.getMonth()+3)/3), //季度         
    "S" : this.getMilliseconds() //毫秒         
    };         
    var week = {         
    "0" : "/u65e5",         
    "1" : "/u4e00",         
    "2" : "/u4e8c",         
    "3" : "/u4e09",         
    "4" : "/u56db",         
    "5" : "/u4e94",         
    "6" : "/u516d"        
    };         
    if(/(y+)/.test(fmt)){         
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));         
    }         
    if(/(E+)/.test(fmt)){         
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);         
    }         
    for(var k in o){         
        if(new RegExp("("+ k +")").test(fmt)){         
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));         
        }         
    }         
    return fmt;         
}       
