<%@ page language="java" import="java.util.*,cn.ac.big.gsa.util.*"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Page myPage = (Page) request.getAttribute("page");
	String myUrl = (String) request.getAttribute("myUrl");
	String titleKey =(String) request.getAttribute("titleKey");
	String titleValue = 	(String) request.getAttribute("titleValue");

	String defaultLink = "";
	String firstLink = "";
	String previousLink = "";
	String nextLink = "";
	String lastLink = "";
	String ps = "";

	if (myPage != null && myPage.getRowCount() > 0) {
		if (myUrl.indexOf("?") == -1) {
			myUrl = myUrl + "?";
		} else {
			myUrl = myUrl + "&";
		}
		ps = String.valueOf(myPage.getPageSize());
		ParameterHandler ph = new ParameterHandler(request);

		int totalCount = myPage.getRowCount();
		//ph.add("totalCount", String.valueOf(totalCount));
		ph.add("pageSize", String.valueOf(myPage.getPageSize()));

		defaultLink = myUrl + ph.toString();
		//out.println(defaultLink);
		ph.add("pageNo", String.valueOf(myPage.getFirstPageNo()));
		firstLink = myUrl + ph.toString();
		//out.println(firstLink);
		ph.add("pageNo", String.valueOf(myPage.getPreviousPageNo()));

		previousLink = myUrl + ph.toString();
		//out.println(previousLink);
		ph.add("pageNo", String.valueOf(myPage.getNextPageNo()));

		nextLink = myUrl + ph.toString();
		//out.println(nextLink);
		ph.add("pageNo", String.valueOf(myPage.getLastPageNo()));
		lastLink = myUrl + ph.toString();
		//out.println(lastLink);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Browse - BioProject - CNCB-NGDC</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="BioProject,GSA">
<meta http-equiv="description" content="BioProject List">
<jsp:include page="/inc/css_js.jsp" />
	<link href="css/cra/jquery.dataTables.min.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/inc/header_project.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="">Home</a>
			</li>
			<li class="active">Browse</li>
		</ol>
        <s:if test="%{titleKey==1&&titleValue!=null}">
            <h4 style="padding-left:10px"><s:text name="project.releasedProjects"/>:&nbsp;<s:property value="titleValue"/></h4>
        </s:if>
		<s:if test="%{titleKey==2}">
		<h4 style="padding-left:10px"><s:text name="project.submit.type.projectDataType"/>:&nbsp;<s:property value="titleValue"/></h4>
		</s:if>
		<s:if test="%{titleKey==3}">
            <h4 style="padding-left:10px"><s:text name="project.organism"/>:&nbsp;<s:property value="titleValue"/></h4>
		</s:if>
        <s:if test="%{titleKey==4}">
            <h4 style="padding-left:10px"><s:text name="project.agencies"/>:&nbsp;<s:property value="titleValue"/></h4>
        </s:if>
		<div class="panel panel-default">
			<div class="panel-body">
				<table class="table table-list table-border table-hover dataTable " id="all_table">
					<thead>
						<tr>
							<th><s:text name="project.accession"/></th>
							<th><s:text name="project.title"/></th>
							<th><s:text name="project.organism"/></th>
							<th><s:text name="project.dataType"/></th>
							<th><s:text name="project.organization"/></th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="listProjects" status="status">
							<tr>
								<td><a href="browse/<s:property value='accession'/>"><s:property value="accession" />
								</a>
								</td>
								<td><s:property value="title" />
								</td>
								<td>
									<s:iterator value="taxons" id="taxon" status="st">
										<s:property value="#taxon.name" />
										<s:if test="!#st.last">
											<br/>
										</s:if>
									</s:iterator>
									
								</td>
								<td>
									<s:iterator value="dataTypes" id="dataType" status="st">
									<s:property value="#dataType.dataTypeName" />
									<s:if test="!#st.last">
										<br/>
									</s:if>
									</s:iterator>
								</td>
								<td><s:property value="submitter.organization" />
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<script src="js/cra/jquery.dataTables.min.js" type="text/javascript"></script>
	<script type="text/javascript">
        $(document).ready(function(){
			$('#all_table').DataTable({"paging":true,	"info":false,	"searching": true,"bInfo" : true,"bLengthChange" : false,"iDisplayLength" : 20,	"order":[]});
        });
		function goPage(url, pno) {
			var no = document.getElementById("gono");
			var tar = "";
			if (url.indexOf("pageNo") > 0) {
				var head = url.substring(0, url.indexOf("pageNo"));
				var tail = url.substring(
						url.indexOf("pageNo") + 7 + pno.length, url.length);
				tar = head + 'pageNo=' + no.value + tail;
			} else {
				tar = url + '&pageNo=' + no.value;
			}
			window.location = tar;
		}
		function setPageSize(sel, url) {
			var size = document.getElementById("listpage").value;
			var head = url.substring(0, url.indexOf("pageSize"));
			var tail = url.substring(url.indexOf("pageSize") + 11, url.length);
			var tar = head + 'pageSize=' + size + tail;
			window.location = tar;
		}
	</script>
</body>
</html>
