// JavaScript Document
var tID=0;
var subtID=0;
function showTabs(ID){  
		 if(ID!=tID){  
        eval("document.getElementById('menu"+[tID]+"').className='off';");  
        eval("document.getElementById('menu"+[ID]+"').className='on';");
        tID=ID;  
   	}  
}  
	
function showESubTabs(ID){  
   if(ID!=subtID){  
		//alert("ID="+ID+",subid="+subtID);
		//identify whether this object exist
		if(subtID!=0){
			eval("document.getElementById('egps"+[subtID]+"').className='suboff';");  
		}
		
        eval("document.getElementById('egps"+[ID]+"').className='subon';");
        subtID=ID;  
   	}  
}  


 function  HTMLDeCode(str){  
        var    s    =    "";  
        if    (str.length ==  0)    return    "";  
		
       		 s    =    str.replace(/&amp;/g,    "&"); 	
        s    =    s.replace(/&lt;/g,        "<");  
          s    =    s.replace(/&gt;/g,        ">");
        s    =    s.replace(/&nbsp;/g,        " ");  
        s    =    s.replace(/&#39;/g,      "\'");  
        s    =    s.replace(/&quot;/g,      "\"");  
        s    =    s.replace(/<br>/g,      "\n"); 
	
        return    s;  
}  

 function  HTMLEnCode(str){  
        var    s    =    str;  
        if    (str.length ==  0)    return    "";  
        s    =    str.replace(/&/g,    "&gt;");  
        s    =    s.replace(/</g,        "&lt;");  
       s    =    s.replace(/>/g,        "&gt;");  
        s    =    s.replace(/ /g,        "&nbsp;");  
       // s    =    s.replace(/\'/g,      "'");  
        s    =    s.replace(/\"/g,      "\\"+"\"");  
        s    =    s.replace(/\r\n/g,      "<br>&nbsp;&nbsp;"); 
alert(s);		
        return    s;  
}  