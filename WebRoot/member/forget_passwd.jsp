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
			<div class="panel-heading">Please input your email</div>
			<div class="panel-body">
					<form id="resetForm" action="/account/retrievePassword.action" method="post">
	<div class="login3_2" style="width:150px;">
		<span style="color:#2d2d2d;height:26px;">Email</span>
	</div>
	<div class="login3_3" style="width:850px;">
		<input type="text" name="email" id="email" value="<s:property value='user.email'/>" style="width: 260px; height:26px; margin-left: 10px;"/>
		<span id="nameerr" style="color:red;font-size:12px;"></span>
	</div>
	<div class="login3_2" style="width:150px;">
		<span style="color:#2d2d2d;height:26px;">Check code</span>
	</div>
	<div class="login3_3" style="width:850px;">
		<input name="code" id="code" type="text"  style="width: 260px; height:26px; margin-left: 10px; vertical-align:top;"/>&nbsp;&nbsp;
		<img id="checkimg" src="/account/checkcode.action" border="0" onclick="this.src='/account/checkcode.action?d='+(new Date().getTime())" style="cursor:pointer;" />
	</div>
	<div class="sub_button" style="margin-bottom:15px;"><a href="javascript:subForm();">Submit</a>&nbsp;&nbsp;<a href="javascript:resetForm();">Reset</a></div>

           <div class="content_sub1_block" style="width:800px;height:auto;">
           <div id="error" style="text-align:left;font-size:14px;color:red;padding-left:5px;padding-bottom:5px;">
            <s:if test="flag ==1"> The user does not exist,please check your user name.<br/>
            </s:if>
            <s:if test="flag ==2"> This user is still under validation, please wait for the email notification.<br/>
            </s:if>
            <s:if test="flag ==5"> Code is wrong,please check<br/>
            </s:if>
          </div>
        </div>
        </form>
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