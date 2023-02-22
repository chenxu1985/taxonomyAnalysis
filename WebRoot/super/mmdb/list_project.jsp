<%@ page language="java" import="java.util.*,cn.ac.big.gsa.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Page myPage = (Page) request.getAttribute("page");
	String myUrl = (String) request.getAttribute("myUrl");
	//out.println("======"+myUrl);

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
<title>MMDB - BioProject - CNCB-NGDC</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="BioProject,GSA">
<meta http-equiv="description" content="BioProject List">
<jsp:include page="/inc/css_js.jsp" />
</head>
<body>
	<jsp:include page="/inc/header_project.jsp" />
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="">Home</a>
			</li>
			<li class="active">Browse</li>
		</ol>
		<div class="panel panel-default">
			<div class="panel-list">
				<table class="table table-list table-border table-hover">
					<thead>
						<tr>
							<th>Accession</th>
							<th>Title</th>
							<th>Organism</th>
							<th>Data type</th>
							<th>Organization</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="listProjects" status="status">
							<tr>
								<td><a href="browse/<s:property value='project.accession'/>"><s:property value="project.accession" />
								</a>
								</td>
								<td><s:property value="project.title" />
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
									<s:iterator value="project.dataTypes" id="dataType" status="st">
									<s:property value="#dataType.dataTypeName" />
									<s:if test="!#st.last">
										<br/>
									</s:if>
									</s:iterator>
								</td>
								<td><s:property value="project.submitter.organization" />
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
					<ul class="pager paging">
				<li class="total">Total items:&nbsp;<s:property
						value="#request.page.rowCount" />
				</li>
				<li class="total">Items of <s:if
						test="%{#request.page.rowFrom==0}">1</s:if> <s:else>
						<s:property value="#request.page.rowFrom" />
					</s:else>- <s:property value="#request.page.rowTo" /></li>
				<li class="total">Page size&nbsp; <select name="pageSize"
					id="listpage" onchange="setPageSize(this,'<%=defaultLink%>')">
						<option value="20"
							<s:if test="page.pageSize==20"> selected="selected"</s:if>>
							20</option>
						<option value="30"
							<s:if test="page.pageSize==30"> selected="selected"</s:if>>
							30</option>
						<option value="40"
							<s:if test="page.pageSize==40"> selected="selected"</s:if>>
							40</option>
						<option value="50"
							<s:if test="page.pageSize==50"> selected="selected"</s:if>>
							50</option>
				</select>&nbsp;</li>

				<li class="total">Page&nbsp;<s:property value="page.pageNo" />/<s:property
						value="page.lastPageNo" />&nbsp;</li>
				<li class="total"><a
					style="color: #0066FF; text-decoration: none;"
					href="<%=firstLink%>"> << First </a>&nbsp;&nbsp; <s:if
						test="page.isHasPreviousPage==1">
						<a style="color: #0066FF; text-decoration: none;"
							href="<%=previousLink%>"> < Previous </a>&nbsp;&nbsp;
				</s:if> <s:if test="page.isHasNextPage==1">
						<a style="color: #0066FF; text-decoration: none;"
							href="<%=nextLink%>"> Next > </a>&nbsp;&nbsp;
				</s:if> <a style="color: #0066FF; text-decoration: none;"
					href="<%=lastLink%>"> Last >> </a></li>
				<li style="border:0px; margin-left:10px;">Jump to&nbsp; <input
					size="5" type="text" id="gono" name="gono"
					value="<s:property value='page.pageNo' />" />&nbsp; <input
					type="button" value="GO"
					onclick="goPage('<%=defaultLink%>', '<s:property value="page.pageNo"/>')" />
				</li>
			</ul>
		</div>

	</div>
	<script type="text/javascript">
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
