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
	<jsp:include page="/inc/css_js.jsp" />
	<link rel="stylesheet" type="text/css" href="/css/base.css" />
	<link rel="stylesheet" type="text/css" href="/css/main.css" />
	<link rel="stylesheet" type="text/css" href="/css/search_results.css" />
	<link rel="stylesheet" type="text/css" href="/css/action.css" />
	<script type="text/javascript" src="/js/mm_menu.js"></script>
 	<script type="text/javascript" src="/js/jquery.min.js" ></script>
 	<script src="/js/jquery-ui.min.js"></script>
 	<script src="/js/jquery.qtip.min.js"></script>
	<script type="text/javascript"  src="/js/sdmenu.js"></script>
	<script src="/js/project/helper/target-helper.js"></script>
	<script type="text/javascript" src="/js/sample/helper/disease-helper.js"></script>
	<script type="text/javascript" src="/js/sample/helper/tissue-helper.js"></script>
	<style>
		.ui-autocomplete{
			background-color:#eee;
			width: 248px;
		}
		.ui-autocomplete li{
			font-size:14px;
		}
	</style>
</head>
<body>
<script language="JavaScript1.2">mmLoadMenus();</script>
<jsp:include page="/inc/header.jsp"/>

<div id="content" style="padding-top:20px;width:1200px;">
	<s:set name="requestUrl" value="%{#request['struts.request_uri']}"></s:set>
	<s:set name="baseUrl" value="%{#requestUrl+'?'}"></s:set>
	<s:iterator value="#parameters">
		<s:if test="key != 'currentPage'">
			<s:iterator value="value" status="s">
				<s:set name="baseUrl" value="%{#baseUrl+key+'='+value[#s.index]+'&'}"></s:set>
			</s:iterator>
		</s:if>
	</s:iterator>
	<s:set name="baseUrl" value="%{#baseUrl+'currentPage='}"></s:set>
	<form action='<s:property value="#requestUrl"/>' id="pagination_form">		  

<div class="action_left">
    <div id="my_menu" class="sdmenu">
       
     <div>
		<span>Species</span>
        <s:textfield id="taxon" name="search.taxon.name"
						style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;" />
		<a href="#" style="font-size:13px;">
			You must select from the hint list which will be displayed after at least 3 letters are provided	
		</a>			
		<s:hidden id="taxon-id" name="search.taxon.taxonId"></s:hidden>
	</div>
	<div>
		<span>Type</span>
		<s:radio list="#{'':''}" name="search.strategy" value="search.strategy" style="display:none"/>
		<a href="#"><s:radio list="#{'2':'Whole Genome Sequcing'}" name="search.strategy" value="search.strategy" /></a>
		<a href="#"><s:radio list="#{'4':'RNA-Seq'}" name="search.strategy" value="search.strategy" /></a>
		<a href="#"><s:radio list="#{'13':'Chip-Seq'}" name="search.strategy" value="search.strategy" /></a>
   </div>
	<div>
		<span>Platform</span>
		<s:radio list="#{'':''}" name="search.platform" value="search.platform" style="display:none"/>
		<a href="#"><s:radio id="platform-1" list="#{'31':'Illumina HiSeq2500'}" name="search.platform" value="search.platform"/></a>
		<a href="#"><s:radio id="platform-2" list="#{'30':'Illumina HiSeq2000'}" name="search.platform" value="search.platform"/></a>
		<a href="#"><s:radio id="platform-3" list="#{'21':'SOLiD'}" name="search.platform" value="search.platform" /></a>
  </div>
	<div>
		<span>Disease/Phenotype/Trait</span>
		<s:textfield name="search.disease" id="disease" style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;"/>
		<a href="#" style="font-size:13px;">Please input your query disease/phenotype/trait. eg. lung cancer, breast cancer or leukemia.</a>
  </div>
	<div>
		<span>Tissue/cell line</span>
		<s:textfield name="search.tissue" id="tissue" style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;"/>
		<a href="#" style="font-size:13px;">Please input your query tissue/cell line. eg. K562 or HSC.</a>
	</div>
	<div>
		<span>Release Date</span>
		<s:date name="search.dateFrom" var="from" format="yyyy-MM-dd" />
		<s:date name="search.dateTo" var="dateTo" format="yyyy-MM-dd" />
		<s:textfield placeholder=" From" name="search.dateFrom" value="%{#dateFrom}" style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;"/>
		<s:textfield placeholder=" To" name="search.dateTo" value="%{#dateTo}" style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;" />
		<a href="#" style="font-size:13px;">Example:2015-01-01</a>
	</div>
    <div>
		<span>Institution</span>
		<s:textfield name="search.organization" type="text" style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;"/>
		<a href="#" style="font-size:13px;">Help information here.</a>
	</div>	
<%-- 
    <div>
		<span>Author</span>
		<li><input name="biomaterialProvider" type="text" style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;"/></li>
		<a href="#" style="font-size:13px;">Help information here.</a>
	</div>
 --%>
   </div>
    <div class="action_left1"><button class="button reset" >Reset</button><button class="button">Update</button></div>
</div>
		<div class="action_right">
			<s:if test="pagination.totalRecords != 0">
				<div class="search_title">
					GSA for you to find the relevant results of about <span><s:property value="pagination.totalRecords"/></span>
				</div>
				<s:iterator value="listProject" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="#"><s:property value="title"/></a><br />
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
							<div class="tag">Resource: <span>Project</span></div>
						</div>
					</div>
				</s:iterator>
				<s:iterator value="listSample" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="#"><s:property value="title"/></a><br />
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
							<div class="tag">Resource: <span>Sample</span></div>
						</div>
					</div>
				</s:iterator>
				<s:iterator value="listExperiment" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="#"><s:property value="title"/></a><br />
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
							<div class="tag">Resource: <span>Experiment</span></div>
						</div>
					</div>
				</s:iterator>
				<s:iterator value="listRun" status="status">
					<div class="search_list">
						<div class="search_list1">
							<a href="#"><s:property value="alias"/></a><br />
							Submitter: <s:property value="user.firstName" />
										<s:property value="user.middleName" /> 
										<s:property value="user.lastName" />&nbsp;&nbsp;
							Release Date: <s:date name="releaseTime" format="yyyy-MM-dd"/><br/>		
							<s:if test="runDataFiles.size() > 0">
							<table class="overview-table" style="width:340px;">
								<tr>
									<th width="130px">Accession</th>
									<th width="210px">File name</th>
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
							<div class="tag">Resource: <span>Run</span></div>
						</div>
					</div>
				</s:iterator>
				<div class="pages" style="width: 900px;">	
						<s:hidden name="term" value="%{term}"></s:hidden>
						<span class="Total" style="padding-right:5px;">Total Records: <s:property value="pagination.totalRecords"/></span>
						<span class="Total" style="padding-right:5px;">Terms of <s:property value="pagination.rowFrom"/>-<s:property value="pagination.rowTo"/></span>
						<span class="Total" style="border:0px;padding-right:5px;">
							Page size
							<select name="pageSize" id="page_size" style="width:40px; height:24px; margin-right:10px;">
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
							<span class="current" style="PADDING-RIGHT: 10px;">
								<a href='<s:property value="#baseUrl"/>1'>&lt;&lt; First </a> 
								<a class="current" href='<s:property value="#baseUrl"/><s:property value="pagination.currentPageNo-1"/>'> &lt; Prev</a>
							</span>
							<span class="disabled" style="PADDING-RIGHT: 5px;">
								Next &gt; 
							</span>
							<span class="disabled" style="PADDING-RIGHT: 5px;">
								 Last &gt;&gt;
							</span>
						</s:elseif>
						<s:else>
							<span class="current" style="PADDING-RIGHT: 5px;">
								<a href='<s:property value="#baseUrl"/>1'>&lt;&lt; First </a> 
								<a href='<s:property value="#baseUrl"/><s:property value="pagination.currentPageNo-1"/>'> &lt; Prev</a>
							</span>
							<span class="current" style="PADDING-RIGHT: 5px;">
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
		var myMenu;
		window.onload = function(){
			myMenu = new SDMenu("my_menu");
			myMenu.init();
			var firstSubmenu = myMenu.submenus[0];
			myMenu.expandMenu(firstSubmenu);
		};
		$(document).on("click",".reset", function(){
			$(".action_left input").val('');
		});
		$("#all").attr("action","/advance-search/searchAll.action");
	</script>
</body>
</html>