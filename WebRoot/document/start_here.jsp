<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Documentation - BioProject - CNCB-NGDC</title>
<jsp:include page="/inc/css_js.jsp" />
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<jsp:include page="/inc/header_project.jsp" />
<!-- content-->
<div class="container">
	<ol class="breadcrumb">
	  <li><a href="">Home</a></li>
	  <li class="active">Documentation</li>
	</ol>
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title"><s:text name="project.documentsForBioProject"/></div>
		</div>
		<div class="panel-body">
			<div class="col-md-12" >
				<h4 class="sub-header" id="handbook"><s:text name="project.handbook"/></h4>
				<p><s:text name="project.doc1"/>
					<a href="document/Handbook-BioProject_2.1.cn.pdf" target="_blank" style="font-size:14px;font-weight:bold;">CN</a>&nbsp;&nbsp;<a href="document/Handbook-BioProject_2.1.us.pdf" target="_blank" style="font-size:14px;font-weight:bold;">US</a>.
				</p>
				<br/><br/>
				<h4 class="sub-header" id="submission"><s:text name="project.guide"/></h4>
				<p><s:text name="project.doc2"/>
					<a href="document/BioProject-BioProject_Submission_Guide_2.2.cn.pdf" target="_blank" style="font-size:14px;font-weight:bold;">CN</a>&nbsp;&nbsp;<a href="document/BioProject-BioProject_Submission_Guide_2.2.us.pdf" target="_blank" style="font-size:14px;font-weight:bold;">US</a>.
				</p>
				<br/><br/><br/><br/>
			</div>
    	</div>
	</div>
</div>


</body>
</html>

