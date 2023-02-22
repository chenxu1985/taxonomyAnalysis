$(function(){	
	jQuery.validator.addMethod("isPassword", function(value, element) {       
//		var passwd = /^[0-9]{6}$/; 
		var regUpper = /[A-Z]/;
        var regLower = /[a-z]/;
        var regStr = /[0-9]/;
        var length = value.length; 
        var complex = 0;
        if (regLower.test(value)) {
        	//alert("1");
            ++complex;
        }
        if (regUpper.test(value)) {
        	//alert("2");
            ++complex;
        }
        if (regStr.test(value)) {
        	//alert("3");
            ++complex;
        }
        if(length>7 && length<16)
        	++complex;
		return (this.optional(element) || complex==4) ;       
		}, "Password must consist of uppercase, lowercase and numbers, and with a length of 8 to 15.");
	
	$("#form_reset_passwd").validate({
		errorLabelContainer: $("#errorMsg"),
		wrapper: "li",
		rules: {
			"password":{
				required:true,
				isPassword:true
			},
			"conformPassword":{
				required:true,
				equalTo: "#password"
			},
		},
		messages:{
			"password":{
				required:"Password is required.",
				ispassword:"Incorrect password format.",
			},
			"confirmPassword":{
				required:"Please input your password again.",
				equalTo:"Inconsistent with password."
			}
		}
	});  
});