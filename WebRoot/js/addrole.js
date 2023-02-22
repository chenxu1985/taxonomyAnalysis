function checkadderr(){
	var nameObj=document.getElementById("addrole");
	var usernamevalue=nameObj.value;
	//alert(usernamevalue);
	if(usernamevalue!=null&&usernamevalue!=""){
	$.ajax({
        type:"POST",   //http请求方式
        url:"/biocloud/checkusername/checkrolename.action", //发送给服务器的url
        data:"addrole="+usernamevalue, //发送给服务器的参数
        dataType:"xml",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的servlet返回的数据格式一致,不然不会调用callback)
        success:callback //定义交互完成,并且服务器正确返回数据时调用回调函数
    });
	}else{
		document.getElementById("addroleerr").innerHTML ="role name can't be empty";
	}
}
function callback(data) {
    // 3接收报务器返回的数据
    //首先需要将data这个dom对象中的数据解析出来
	//var obj = $("#username");
   // var username = obj.val();
    //alert("username: is" + username);
    var jqueryObj=$(data);
    //获取message节点
    var message=jqueryObj.children();
    //获取文本内容
    var text=message.text();
    //alert(text);
    // 4把返回的数据在div中显示
   // $("#username").html(text);
    document.getElementById("addroleerr").innerHTML =text;
}
function checkaddrole(){
	var num=0;
	var nameObj=document.getElementById("addrole");
	var usernamevalue=nameObj.value;
	if(usernamevalue==null||usernamevalue==""){
		document.getElementById("addroleerr").innerHTML ="role name can't be empty";
		num=1;
	}
	if(num==0){
		return true;
	}else{	
		return false;
	}
}