<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ page language="java" import="java.io.*"  import="java.util.Calendar,java.util.TimeZone" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>GSA - 403 Forbidden</title>
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
		  <li class="active">403 Forbidden</li>
		</ol>
		<div class="panel panel-default panel-info">
			<div class="panel-heading">403 Forbidden</div>
			<div class="panel-body">
				Sorry, you do not have permission to access this page.
			</div>	
		</div>
    </div>
</body>
</html>
