<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ page language="java" import="java.io.*"  import="java.util.Calendar,java.util.TimeZone" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>GSA - Account</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="Account, GSA"/>
	<meta http-equiv="description" content="Account activation"/>
	<jsp:include page="/inc/css_js.jsp"/>
</head>
<body>
<jsp:include page="/inc/header.jsp"/>
    <div class="container">
    	<ol class="breadcrumb">
		  <li><a href="/">Home</a></li>
		  <li class="active">Account</li>
		</ol>
		<div class="panel panel-default panel-info">
			<div class="panel-body">
				<iframe width="500" height="500"  frameborder="no" border="0" marginwidth="0" marginheight="0" src="http://sso.big.ac.cn/register/reset_password.jsp">
        		</iframe>
			</div>	
		</div>
    </div>

<script  type="text/javascript" language="javascript">
	function subForm(){
		$("#resetForm").submit();
	}
	function resetForm(){
		$("#resetForm")[0].reset();
	}	
	$("#email").blur(function(){
		//alert("blur");
		//checkEmail();
		var params = {
			email : $("#email").val()
		};
		$.ajax({
          url: '/sys/ajax/checkEmail.action',
          type: 'post',
          dataType: 'json',
          data: params,
          success: checkEmailResult
        });
	});

	var checkEmailResult=function(data) {
        if(data){//email not registered
        	alert("This email is not a registered account.");
        }
      }
</script>
</body>
</html>