<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ page language="java" import="java.io.*"  import="java.util.Calendar,java.util.TimeZone" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>GSA - Account</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="Account, GSA">
	<meta http-equiv="description" content="Account activation">
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
			<div class="panel-heading">Account activation</div>
			<div class="panel-body">
					<s:if test ="%{errorStr==null}">
            Your account is activated, please <a href="/member/login.jsp">login.</a>
            </s:if>
            <s:else> 
            Your account is not activated successfully due to the reason below:<br/>
            <s:iterator value="errorStr" id="entry">
            	<span style="color:#EA5200;"><s:property value="value"/></span><br/>
			</s:iterator>
            Please check.
            </s:else>
			</div>	
		</div>
    </div>
</body>
</html>

