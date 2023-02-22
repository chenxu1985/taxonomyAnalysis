<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ page language="java" import="java.io.*"  import="java.util.Calendar,java.util.TimeZone" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>GSA - Account</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="Register, BioProject">
	<meta http-equiv="description" content="Register note">
	<jsp:include page="/inc/css_js.jsp"/>
</head>
<body>
<jsp:include page="/inc/header_project.jsp"/>
    <div class="container">
    	<ol class="breadcrumb">
		  <li><a href="">Home</a></li>
		  <li class="active">Register</li>
		</ol>
		<div class="panel panel-default panel-info">
			<div class="panel-heading">Register succeeded</div>
			<div class="panel-body">
				You have registered as <span style="color:red;font-size:14px;"><s:property value="#session.username" /> </span>. Please <a href="https://ngdc.cncb.ac.cn/sso/login?service=https://ngdc.cncb.ac.cn/bioproject/login">Login</a>.
			</div>	
		</div>
    </div>
</body>
</html>
