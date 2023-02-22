$(function(){
	
	jQuery.validator.addMethod("isZipCode", function(value, element) {       
		var zip = /^[1-9][0-9]{5}$/;       
		return this.optional(element) || (zip.test(value));       
		}, "Incorrect postal code fomart."); 
	
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
	
	$("#form_register").validate({
/*		errorClass:"jqueryErrorMessage",
		errorContainer: "div.error",*/
		//errorLabelContainer: $("#errorMsg"),
		//wrapper: "li",
		errorLabelContainer: $("#errorMsg"),
		wrapper: "li",
		rules: {
			//"submitter.firstName": "required",
			//"submitter.lastName":"required",
			"email":{
				required:true,
				email:true,
				remote:{
					url:"/sys/ajax/checkEmail.action",
					type:"post",
					dataType:"json",
					//data:{
						//email:function(){
							//return $("#email").val();
						//}
					//}
				}
			},
			"firstName": "required",
			"lastName":"required",
			//"submitter.submitOrganizationUrl":"url",
			"organization":"required",
			"department":"required",
			"street":"required",
			"city":"required",
			"postalCode":{
				required:true,
				isZipCode:true
			},
			"countries":"required",
			"password":{
				required:true,
				isPassword:true
			},
			"confirmPassword":{
				required:true,
				equalTo: "#password"
			},
		},
		messages:{
			//"submitter.firstName": "First name is required!",
			//"submitter.lastName":"Last name is required!",
			"email":{
				required:"Email is required.",
				email:"Incorrect email format.",
				remote:"This email has been registered."
			},
			"firstName":"First name is required",
			"lastName":"Last name is required",
			"organization":"Organization is required",
			"department":"Department is required",
			"street":"Street is required",
			"city":"City is required",
			"postalCode":{
				required:"Postal code is required",
				isZipCode:"Incorrect postal code format."
			},
			"countries":"Country is required",
			"password":{
				required:"Password is required.",
				ispassword:"Incorrect password format.",
			},
			"confirmPassword":{
				required:"Please input your password again.",
				equalTo:"Inconsistent with password."
			}
			//"submitter.emailSecondary": "You secondary email is invalidation!",
			//"submitter.organization":"Organization field is required!",
			//"submitter.submitOrganizationUrl":"Organization url is invalidation",
			//"submitter.department":"Organization field is required!",
			//"submitter.street":"Street field is required!",
			//"submitter.city":"City field is required!",
			//"submitter.postalCode":"Postal code field is required!",			
			//"submitter.country.countryId":"You should choose a country/region!"
		}
		//errorPlacement: function(error, element) {
		    //if ( element.is($("#email")) )
		        //error.appendTo( element.parent().next() );
		   // else if(element.is($("#password")))
		    	//error.appendTo(element.parent().next());
		    //else if(element.is($("#comformPassword")))
		    	//error.appendTo(element.parent().next());
		//}
	});  
});