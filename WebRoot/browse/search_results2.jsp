<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% 
	String url = request.getRequestURI();
	pageContext.setAttribute("curURL", url);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>GSA-Genome Sequence Archive</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css" />
	<link rel="stylesheet" type="text/css" href="/css/main.css" />
	<link rel="stylesheet" type="text/css" href="/css/search_results.css" />
	<script type="text/javascript" src="/js/mm_menu.js"></script>
	<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>	
</head>
<body>
<script language="JavaScript1.2">mmLoadMenus();</script>
<jsp:include page="/inc/header.jsp"/>

<div id="content" style="padding-top:20px;">
	<s:set name="requestUrl" value="%{#request['struts.request_uri']}"></s:set>
	<s:set name="baseUrl" value="%{#requestUrl+'?term='+term+'&scope='+scope+'&pageSize='+pagination.pageSize+'&currentPage='}"></s:set>
	<form action='<s:property value="#requestUrl"/>' method="get" id="pagination_form">		
	<s:if test="pagination.totalRecords != 0">  
	<div class="sl_left">
		<div class="sl_left1">
		<!-- <h1>Human</h1> -->
			<s:set name="all" value="statistics.projectEntriesCount + statistics.sampleEntriesCount + statistics.experimentEntriesCount + statistics.runEntriesCount"></s:set>
			All:(<a href='/global-search/searchAll.action?scope=0&term=<s:property value="term"/>'><s:property value="#all"/></a>)<br />
			Project:(<a href='/global-search/project.action?scope=1&term=<s:property value="term"/>'><s:property value="statistics.projectEntriesCount"/></a>)<br />
			Sample:(<a href='/global-search/sample.action?scope=2&term=<s:property value="term"/>'><s:property value="statistics.sampleEntriesCount"/></a>)<br />
			Experiment:(<a href='/global-search/experiment.action?scope=3&term=<s:property value="term"/>'><s:property value="statistics.experimentEntriesCount"/></a>)<br />
			Run:(<a href='/global-search/run.action?scope=4&term=<s:property value="term"/>'><s:property value="statistics.runEntriesCount"/></a>)
		</div>
<!--  		<div class="sl_left1">
			<h1>project types</h1>
			umbrella:(<a href="#">1,364</a>)<br />
			primary<br />
			submission:(<a href="#">35,109</a>)
		</div>
		<div class="sl_left2"><h1>Anytime</h1>
			<a href="#">Past day</a><br />
			<a href="#">past week</a><br />
			<a href="#">past month</a>
		</div> -->
	</div>
		<div id="apDiv1"></div>
	</s:if>
		<div class="sl_right">
			<s:if test="pagination.totalRecords != 0">
				<div class="search_title">
					Total results: <span><s:property value="pagination.totalRecords"/></span>
				</div>
				<s:iterator value="listProject" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="/browse/project/detail.action?access=4&prjId=<s:property value='prjId'/>"><s:property value="title"/></a><br />
							<s:if test="%{description != null && description != ''}">
								<s:property value="description"/><br/>
							</s:if>							
							Taxonomy: <s:property value="taxon.name" />&nbsp;&nbsp;　Project data type: <s:property value="dataType.dataTypeName"/><br />
							Submitter: <s:property value="submitter.firstName" />
										<s:property value="submitter.middleName" /> 
										<s:property value="submitter.lastName" /> &nbsp;&nbsp;
							Release Date: <s:date name="releaseTime" format="yyyy-MM-dd"/>
						</div>
						<div class="search_list2">
							<div class="search_list2_1">Accession: <s:property value="accession"/></div>
							<!-- <div class="search_list2_1">ID: 305211</div> -->
							<div class="tag">Source: <span>Project</span></div>
						</div>
					</div>
				</s:iterator>
				<s:iterator value="listSample" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="/browse/sample/detail.action?access=4&accession=<s:property value='accession'/>"><s:property value="title"/></a><br />
							<s:if test="%{publicDescription != null && publicDescription != ''}">
								<s:property value="publicDescription"/><br/>
							</s:if>
							Sample name: <s:property value="name"/><br/>
							Taxonomy: <s:property value="taxon.name" />　&nbsp;&nbsp;
							Sample type:
							<s:iterator value="sampleType.attributeTable.split('_')" status="st" var="as">  
								<s:if test="#st.index > 1">
	    							<s:property value="#as"/>  
								</s:if>
							</s:iterator>
							<br />
							Submitter: <s:property value="sampleSubmitter.firstName" />
										<s:property value="sampleSubmitter.middleName" /> 
										<s:property value="sampleSubmitter.lastName" />&nbsp;&nbsp;
							Release Date: <s:date name="releaseTime" format="yyyy-MM-dd"/>
						</div>
						<div class="search_list2">
							<div class="search_list2_1">Accession: <s:property value="accession"/></div>
							<!-- <div class="search_list2_1">ID: 305211</div> -->
							<div class="tag">Source: <span>Sample</span></div>
						</div>
					</div>
				</s:iterator>
				<s:iterator value="listExperiment" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="/browse/experiment/detail.action?access=4&accession=<s:property value='accession'/>"><s:property value="title"/></a><br />
							Taxonomy: <s:property value="taxon.name" />　<br />
							Alias: <s:property value="alias"/>
							Submitter: <s:property value="user.firstName" />
										<s:property value="user.middleName" /> 
										<s:property value="user.lastName" />&nbsp;&nbsp;
							Release Date: <s:date name="releaseTime" format="yyyy-MM-dd"/>							
						</div>
						<div class="search_list2">
							<div class="search_list2_1">Accession: <s:property value="accession"/></div>
							<!-- <div class="search_list2_1">ID: 305211</div> -->
							<div class="tag">Source:<span>Experiment</span></div>
						</div>
					</div>
				</s:iterator>
				<s:iterator value="listRun" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="/browse/run/detail.action?access=4&accession=<s:property value='#accession'/>"><s:property value="alias"/></a><br />
							Submitter: <s:property value="user.firstName" />
										<s:property value="user.middleName" /> 
										<s:property value="user.lastName" />&nbsp;&nbsp;
							Release Date: <s:date name="releaseTime" format="yyyy-MM-dd"/><br/>		
							<s:if test="runDataFiles.size() > 0">
							<table class="overview-table" style="width:280px;">
								<tr>
									<th>Run file accession</th>
									<th>Run file name</th>
								</tr>
								<s:iterator value="runDataFiles" status="status">
								<tr>
							 		<td><s:property value="accession" /></td>
							 		<td><s:property value="runFileName" /></td>
								</tr>
								</s:iterator>								
							</table>
							</s:if>					
						</div>
						<div class="search_list2">
							<div class="search_list2_1">Accession: <s:property value="accession"/></div>
							<div class="tag">Source: <span>Run</span></div>
						</div>
					</div>
				</s:iterator>
				<div class="pages" style="width: 1020px;">	
						<s:hidden name="term" value="%{term}"></s:hidden>
						<span class="Total">Total Records: <s:property value="pagination.totalRecords"/></span>
						<span class="Total">Terms of <s:property value="pagination.rowFrom"/>-<s:property value="pagination.rowTo"/></span>
						<span class="Total" style="border:0px;">
							Page size
							<select name="pageSize" id="page_size" style="width:60px; height:24px; margin-right:10px;">
								<option value="20" <s:if test="pagination.pageSize==20"> selected="selected"</s:if>>
									20
								</option>
								<option value="30" <s:if test="pagination.pageSize==30"> selected="selected"</s:if>>
									30
								</option>
								<option value="40" <s:if test="pagination.pageSize==40"> selected="selected"</s:if>>
									40
								</option>
								<option value="50" <s:if test="pagination.pageSize==50"> selected="selected"</s:if>>
									50
								</option>
							</select>		
						</span>
						
						<span>Page <s:property value="pagination.currentPageNo"/>/<s:property value="pagination.totalPages"/></span>
						<s:if test="pagination.currentPageNo == 1 && pagination.currentPageNo == pagination.totalPages">
							<span class="disabled">
								&lt;&lt; First 
							</span>
							<span class="disabled">
								&lt; Prev
							</span>
							<span class="disabled">
								Next &gt; 
							</span>
							<span class="disabled">
								 Last &gt;&gt;
							</span>
						</s:if>
						<s:elseif test="pagination.currentPageNo == 1">
							<span class="disabled">
								&lt;&lt; First 
							</span>
							<span class="disabled">
								&lt; Prev
							</span>
							<span class="current">
								<a href='<s:property value="#baseUrl"/><s:property value="pagination.currentPageNo+1"/>'>Next &gt; </a> 
								<a href='<s:property value="#baseUrl"/><s:property value="pagination.totalPages"/>'> Last &gt;&gt;</a>
							</span>
						</s:elseif>
						<s:elseif test="pagination.currentPageNo == pagination.totalPages">
							<span class="current">
								<a href='<s:property value="#baseUrl"/>1'>&lt;&lt; First </a> 
								<a class="current" href='<s:property value="#baseUrl"/><s:property value="pagination.currentPageNo-1"/>'> &lt; Prev</a>
							</span>
							<span class="disabled">
								Next &gt; 
							</span>
							<span class="disabled">
								 Last &gt;&gt;
							</span>
						</s:elseif>
						<s:else>
							<span class="current">
								<a href='<s:property value="#baseUrl"/>1'>&lt;&lt; First </a> 
								<a href='<s:property value="#baseUrl"/><s:property value="pagination.currentPageNo-1"/>'> &lt; Prev</a>
							</span>
							<span class="current">
								<a href='<s:property value="#baseUrl"/><s:property value="pagination.currentPageNo+1"/>'>Next &gt; </a> 
								<a href='<s:property value="#baseUrl"/><s:property value="pagination.totalPages"/>'> Last &gt;&gt;</a>
							</span>
						</s:else>
						<span>
							Skip To 
							<s:textfield size="4" name="currentPage" id="current_page" value="%{pagination.currentPageNo}">
							</s:textfield>
							<input type="submit" value="GO" />
						</span>
					
				</div>
			</s:if>		
			<s:else>
				No items found.
			</s:else>
			</div>			
	</form>
</div>
	<script type="text/javascript">
		$("#page_size").change(function(){
			$("#current_page").val("1");
			$("#pagination_form").submit();
		});
	</script>
</body>
</html>