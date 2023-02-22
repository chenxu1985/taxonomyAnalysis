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
		<title>GSA - BioSample</title>
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
		<ol class="breadcrumb">
			<li><a href="/">Home</a></li>
			<li class="active">BioSample</li>
		</ol>
		<%-- 		<div class="panel panel-default panel-note">
			<div class="panel-body">
				This page shows the all the <span>RELEASED PROJECTS</span>, there
				are parts of projects have in the protection period (called <font
					color="red">CONTROLLED PROJECTS</font>) you can NOT find here.
				Controlled Project only can be accessed by its owner.
			</div>
		</div> --%>
		<div class="panel panel-default">
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
			
			<s:set name="requestUrl" value="%{#request['struts.request_uri']}"></s:set>
			<form action='<s:property value="#requestUrl"/>' id="pagination_form" method="post">		
				<s:hidden name="search.term" ></s:hidden>	
	 			<ul class="pager paging">
					<li class="total">Total Items:&nbsp;<s:property value="pagination.totalRecords" />
					</li>
					<li class="total">Items of 
						<s:if test="pagination.rowFrom == 0">1</s:if> 
						<s:else>
							<s:property value="pagination.rowFrom" />
						</s:else>- <s:property value="pagination.rowTo" />
					</li>
					<li class="total">Page size&nbsp; 
						<select name="pagination.pageSize" id="page_size" style="width:60px; height:24px; margin-right:10px;">
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
						</select>&nbsp;
					</li>
	
	 				<li class="total">
	 					Page <span id="real_current_page"><s:property value="pagination.currentPageNo" /> </span>/
	 					<span id="total_pages"><s:property value="pagination.lastPageNo" /></span>
					</li>
					<li class="total">
						<s:if test="pagination.currentPageNo == 1">
							<< First &nbsp;&nbsp; < Previous &nbsp;&nbsp;
						</s:if>
						<s:else>
							<a id="first_page" style="color: #0066FF; text-decoration: none;" href="javascript:void(0)"> 
								<< First 
							</a>&nbsp;&nbsp; 
							<a id="previous_page" style="color: #0066FF; text-decoration: none;" href="javascript:void(0)"> 
								< Previous 
							</a>&nbsp;&nbsp;
						</s:else>
						<s:if test="pagination.lastPageNo - pagination.currentPageNo > 0">
							<a id="next_page" style="color: #0066FF; text-decoration: none;" href="javascript:void(0)"> 
								Next > 
							</a>&nbsp;&nbsp;
							<a id="last_page" style="color: #0066FF; text-decoration: none;" href="javascript:void(0)"> 
								Last >> 
							</a>
						</s:if> 
						<s:else>
							Next >&nbsp;&nbsp;Last >>
						</s:else>
					</li>
					<li style="border:0px; margin-left:10px;">Jump To&nbsp; 
						<s:textfield size="5" name="pagination.currentPageNo" id="current_page" value="%{pagination.currentPageNo}"></s:textfield>						
						&nbsp; 
						<input type="submit" value="GO"  />
					</li>
				</ul>
			<form>
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
	</script>
</html>
