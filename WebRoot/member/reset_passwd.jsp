<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ page language="java" import="java.io.*"  import="java.util.Calendar,java.util.TimeZone" pageEncoding="UTF-8"%>
<%
	String reqEmail = request.getParameter("email");
	String reqTime = request.getParameter("timestamp");
	String validateCode = request.getParameter("validateCode");
	//out.print(reqTime);
	//String reqEmail="11";
	//String reqTime="22";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>GSA - Account</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="Account, GSA">
	<meta http-equiv="description" content="Account activation">
	<link href="/css/validation.css" rel="stylesheet" type="text/css" />
	<jsp:include page="/inc/css_js.jsp"/>
	<script src="/js/jquery.validate.js"></script>
  	<script src="/js/resetPasswd.validate.js"></script>
</head>
<body>
<jsp:include page="/inc/header.jsp"/>
    <div class="container">
    	<ol class="breadcrumb">
		  <li><a href="/">Home</a></li>
		  <li class="active">Account</li>
		</ol>
		<div class="panel panel-default panel-info">
			<div class="panel-heading">Reset password</div>
			<div class="panel-body">
					<form id="form_reset_passwd" action="/account/resetPasswd.action" method="post">
      	<input type="hidden" name="email" value="<%=reqEmail%>"></input>
		<input type="hidden" name="time" value="<%=reqTime%>"></input>
      	<input type="hidden" name="validateCode" value="<%=validateCode%>"></input>
		
        <div class="login3_2" style="width:150px;">
			<span style="color:#2d2d2d;height:26px;">New password</span>
		</div>
		<div class="login3_3" style="width:880px;">
			<input type="password" name="password" id="password"  style="width: 260px; height:26px; margin-left: 10px;"/>
			<span style=" margin-left: 5px;">Password must consist of uppercase, lowercase and numbers, and with a length of 8 to 15.</span>
		</div>
	<div class="login3_2" style="width:150px;">
		<span style="color:#2d2d2d;height:26px;">Confirm new password</span>
	</div>
	<div class="login3_3" style="width:880px;">           
		<input type="password" name="confirmPassword" id="confirmPassword"  style="width: 260px; height:26px; margin-left: 10px; vertical-align:top;"/>
		<span id="pwderr" style="color:red;font-size:12px;"></span>
	</div>
    <div class="login3_2" style="width:150px;">
		<span style="color:#2d2d2d;height:26px;">Check code</span>
	</div>
	<div class="login3_3" style="width:880px;">
		<input name="code" id="code" type="text"  style="width: 260px; height:26px; margin-left: 10px; vertical-align:top;"/>&nbsp;&nbsp;
		<img id="checkimg" src="/account/checkcode.action" width="80" height="25" onclick="this.src='/account/checkcode.action?d='+(new Date().getTime())" style="cursor:pointer;" />
	</div>
	<div class="sub_button" style="margin-bottom:15px;"><a href="javascript:subForm();">Save</a>&nbsp;&nbsp;<a href="javascript:resetForm();">Reset</a></div>
	<div class="content_sub1_block" style="width:800px;height:auto;">	
    	<div id="errorMsg"></div>
     </div>
           <div class="content_sub1_block" style="width:800px;height:auto;">
           <div id="error" style="text-align:left;font-size:14px;color:red;padding-left:5px;padding-bottom:5px;">
            <s:if test="flag ==1"> Validate request.<br/>
            </s:if>
            <s:if test="flag ==2"> Request time out.<br/>
            </s:if>
            <s:if test="flag ==5"> Code is wrong,please check<br/>
            </s:if>
          </div>
        </div>
        </form>
			</div>	
		</div>
    </div>

<script type="text/javascript" language="javascript">

	function subForm(){
		$("#form_reset_passwd").submit();
	}
	function resetForm(){
		$("#form_reset_passwd")[0].reset();
	}	
  </script>
</body>
</html>
