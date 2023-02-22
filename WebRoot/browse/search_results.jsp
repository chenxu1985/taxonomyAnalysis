<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String url = request.getRequestURI();
	pageContext.setAttribute("curURL", url);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>GSA - Search</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="BioProject,GSA">
		<meta http-equiv="description" content="BioProject List">
		<jsp:include page="/inc/css_js.jsp" />
		<link rel="stylesheet" type="text/css" href="/css/search_results.css" />
	</head>
<body>
	<jsp:include page="/inc/header.jsp" />
	<div class="container">

 		<div>
			<div class="panel-body">
				<b>Search results:</b>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<ul class="list-group">
					<s:if test="projects.size > 0">
					    <a class="list-group-item disabled" id="search-project" href="javascript:void(0);">
					    	<span class="badge"><s:property value="statistics.projectEntriesCount"/></span>
					    	Projects
					    </a>
					</s:if>
					<s:else>
					    <a class="list-group-item" id="search-project" href="javascript:void(0);">
					    	<span class="badge"><s:property value="statistics.projectEntriesCount"/></span>
					    	Projects
					    </a>
					</s:else>
					<s:if test="samples.size > 0">
						<a class="list-group-item disabled" id="search-sample" href="javascript:void(0);">
						  <span class="badge"><s:property value="statistics.sampleEntriesCount"/></span>
						    Samples
						</a>
					</s:if>
					<s:else>
						<a class="list-group-item" id="search-sample" href="javascript:void(0);">
						  <span class="badge"><s:property value="statistics.sampleEntriesCount"/></span>
						    Samples
						</a>
					</s:else>
					<s:if test="experiments.size > 0">
					    <a class="list-group-item disabled" id="search-experiment" href="javascript:void(0);">
					    <span class="badge"><s:property value="statistics.experimentEntriesCount"/></span>
					    Experiments
					    </a>
					</s:if>
					<s:else>
					    <a class="list-group-item" id="search-experiment" href="javascript:void(0);" >
					    <span class="badge"><s:property value="statistics.experimentEntriesCount"/></span>
					    Experiments
					    </a>
					</s:else>
					<s:if test="runs.size > 0">
					  <a class="list-group-item disabled" id="search-run" href="javascript:void(0);">
					    <span class="badge"><s:property value="statistics.runEntriesCount"/></span>
					    Runs
					  </a>
					</s:if>
					<s:else>
					  <a class="list-group-item" id="search-run" href="javascript:void(0);">
					    <span class="badge"><s:property value="statistics.runEntriesCount"/></span>
					    Runs
					  </a>
					</s:else>
				</ul>			
			</div>
			<div class="col-md-10">
				<div class="panel-list">
					<s:iterator value="projects" status="status">
						<div class="search_list">
							<div class="search_list1">
								<a href="/browse/project/<s:property value='accession'/>">
									<s:property value="title"/>
								</a>
								<br />
								<s:if test="%{description != null && description != ''}">
									<p style="text-align:justify"><s:property value="description"/></p>
								</s:if>							
								Taxonomy: <s:property value="taxon.name" />&nbsp;&nbsp;　Project data type: <s:property value="dataType.dataTypeName"/><br />
								Submitter: <s:property value="submitter.firstName" />
											<s:property value="submitter.middleName" /> 
											<s:property value="submitter.lastName" /> &nbsp;&nbsp;
								Release Date: <s:date name="releaseTime" format="yyyy-MM-dd"/>
							</div>
							<div class="search_list2">
								<div class="search_list2_1">Accession: <s:property value="accession"/></div>
								<div class="tag">Source: <span>Project</span></div>
							</div>
						</div>
					</s:iterator>				
				</div>			
		<!-- end projects -->
		
		<!-- samples -->
			<div class="panel-list">
				<s:iterator value="samples" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="/browse/sample/<s:property value='accession'/>">
								<s:property value="title"/>
							</a>
							<br />
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
			</div>		
		<!-- end samples -->
		<!-- experiments -->
			<div class="panel-list">
				<s:iterator value="experiments" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="/browse/experiment/<s:property value='accession'/>"><s:property value="title"/></a><br />
							Taxonomy: <s:property value="taxon.name" />　<br />
							Alias: <s:property value="alias"/>
							Submitter: <s:property value="user.firstName" />
										<s:property value="user.middleName" /> 
										<s:property value="user.lastName" />&nbsp;&nbsp;
							Release Date: <s:date name="releaseTime" format="yyyy-MM-dd"/>							
						</div>
						<div class="search_list2">
							<div class="search_list2_1">Accession: <s:property value="accession"/></div>
							<div class="tag">Source: <span>Experiment</span></div>
						</div>
					</div>
				</s:iterator>			
			</div>		
		<!-- end experiments -->
		<!-- runs -->
			<div class="panel-list">
				<s:iterator value="runs" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="/browse/run/<s:property value='accession'/>"><s:property value="alias"/></a><br />
							Submitter: <s:property value="user.firstName" />
										<s:property value="user.middleName" /> 
										<s:property value="user.lastName" />&nbsp;&nbsp;
							Release Date: <s:date name="releaseTime" format="yyyy-MM-dd"/><br/>		
							<s:if test="runDataFiles.size() > 0">
							<table class="table table-condensed" style="width:40%;">
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
			</div>		
		<!-- end runs -->
					
			<s:set name="requestUrl" value="%{#request['struts.request_uri']}"></s:set>
			
			<form action='<s:property value="#requestUrl"/>' id="pagination_form" method="post">		
				<s:hidden name="search.term" ></s:hidden>	
				<ul class="list-inline" style="margin-left:15px;font-size:15px">
					<li>Total Items: <s:property value="pagination.totalRecords" /></li>
					<li class="hidden-xs hidden-sm">Item of</li>
					<li class="hidden-xs hidden-sm"><s:property value="pagination.rowFrom" /> - <s:property value="pagination.rowTo" /></li>
					<li class="hidden-xs hidden-sm">
						Page Size 
						<select name="pagination.pageSize" id="page_size" style="width:60px; height:24px;">
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
					</li>
					<li class="hidden-xs hidden-sm">Page
						<span id="real_current_page"><s:property value="pagination.currentPageNo" /></span>/
						<span id="total_pages"><s:property value="pagination.lastPageNo" /></span>
					</li>
					<s:if test="pagination.currentPageNo == 1">
						<li><< First </li>
						<li>< Previous </li>
					</s:if>
					<s:else>
						<li><a id="first_page" href="javascript:void(0)"> << First </a></li>
						<li><a id="previous_page" href="javascript:void(0)"> < Previous</a></li>
					</s:else>	
					<s:if test="pagination.lastPageNo - pagination.currentPageNo == 0">
						<li> Next > </li>
						<li> Last >> </li>
					</s:if>
					<s:else>
						<li><a id="next_page" href="javascript:void(0)">Next >  </a></li>
						<li><a id="last_page" href="javascript:void(0)">Last >></a></li>
					</s:else>	
					<li>Jump To </li>
					<li>
						<s:textfield size="5" name="pagination.currentPageNo" id="current_page" value="%{pagination.currentPageNo}"></s:textfield>
					</li>	
					<li><input type="submit" value="GO"/></li>				
				</ul>
			<form>
		</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		$("#page_size").change(function(){
			$("#current_page").val("1");
			$("#pagination_form").submit();
		});
		$(document).on("click", "#first_page", function(){
			$("#current_page").val("1");
			$("#pagination_form").submit();			
		});
		$(document).on("click", "#last_page", function(){
			$("#current_page").val($("#total_pages").html());
			$("#pagination_form").submit();			
		});		
		$(document).on("click", "#previous_page", function(){
			var currentPage = $("#real_current_page").html();
			currentPage = parseInt(currentPage);		
			$("#current_page").val(currentPage - 1);
			$("#pagination_form").submit();			
		});
		$(document).on("click", "#next_page", function(){
			var currentPage = $("#real_current_page").html();
			currentPage = parseInt(currentPage);
			$("#current_page").val(currentPage + 1);
			$("#pagination_form").submit();			
		});
		function myCallBack(part, clazz){	
		    //alert(clazz);	
			if(clazz.indexOf("disabled") > 0){
				return;
			}
			$("#current_page").val("1");
			$("#pagination_form").attr("action", "/search/" + part);
			$("#pagination_form").submit();			
		}
 		$(document).on("click", "#search-run", function(){
 			var part = $(this).attr("id").split("-")[1];
			var clazz = $(this).attr("class");
			myCallBack(part, clazz);
		});
 		$(document).on("click", "#search-experiment", function(){
 			var part = $(this).attr("id").split("-")[1];
 			//alert(part);
			var clazz = $(this).attr("class");
			myCallBack(part, clazz);
		});
 		$(document).on("click", "#search-sample", function(){
 			var part = $(this).attr("id").split("-")[1];
			var clazz = $(this).attr("class");
			myCallBack(part, clazz);
		});
 		$(document).on("click", "#search-project", function(){
 			var part = $(this).attr("id").split("-")[1];
			var clazz = $(this).attr("class");
			myCallBack(part, clazz);
		});
	</script>
</html>
