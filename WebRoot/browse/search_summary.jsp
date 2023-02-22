<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>GSA - Search Summary</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="BioProject,GSA">
<meta http-equiv="description" content="BioProject Detail">
<jsp:include page="/inc/css_js.jsp" />
</head>
<body>
<jsp:include page="/inc/header.jsp" />
	<div class="container">
		<a href='/search/project?search.term=<s:property value="search.term"/>'>Project:<s:property value="statistics.projectEntriesCount"/></a><br />
		<a href='/search/sample?search.term=<s:property value="search.term"/>'>Sample:<s:property value="statistics.sampleEntriesCount"/></a><br />
		<a href='/search/experiment?search.term=<s:property value="search.term"/>'>Experiment:<s:property value="statistics.experimentEntriesCount"/></a><br/>
		<a href='/search/run?search.term=<s:property value="search.term"/>'>Run:<s:property value="statistics.runEntriesCount"/></a>
	</div>						
</body>
</html>