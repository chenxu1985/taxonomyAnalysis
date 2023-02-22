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
	<style type="text/css">
		.paging_cra {TEXT-ALIGN: center;font-family: "Arial";font-size:14px;width:100%; margin-top:auto; margin-bottom: 15px; color:#231815;padding-top:5px; padding-bottom:5px; text-align:left;  border:1px solid #dbeef3;margin-top: 10px;}
		.paging_cra  li.Total {PADDING-RIGHT: 13px; padding-left: 13px;MARGIN: 4px; COLOR: #666; font-family: "Arial";font-size: 14px; border-right:1px solid #ccc;}
	</style>
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
			<ul class="nav nav-tabs">
				<li class="active" id="gsaData" style="padding:0px 0px;background: #FFFFFF;height:auto;"><a  href="javascript:void(0)" onclick="changeTypeN('gsaData')" data-toggle="tab" style="border-bottom:1px solid #ddd">NGDC</a></li>
				<li id="ncbiData" style="padding:0px 0px;background: #FFFFFF;height:auto;"><a  href="javascript:void(0)" onclick="changeTypeN('ncbiData')" data-toggle="tab" style="border-bottom:1px solid #ddd">INSDC</a></li>
			</ul>
				<div class="panel-body" id="gsaData_type" style="margin-top: 10px;">
					<div class="tab-pane fade in active" >
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
					<%--<tbody>--%>
						<%--<s:iterator value="listProjects" status="status">--%>
							<%--<tr>--%>
								<%--<td><a href="browse/<s:property value='accession'/>"><s:property value="accession" />--%>
								<%--</a>--%>
								<%--</td>--%>
								<%--<td><s:property value="title" />--%>
								<%--</td>--%>
								<%--<td>--%>
									<%--<s:iterator value="taxons" id="taxon" status="st">--%>
										<%--<s:property value="#taxon.name" />--%>
										<%--<s:if test="!#st.last">--%>
											<%--<br/>--%>
										<%--</s:if>--%>
									<%--</s:iterator>--%>
									<%----%>
								<%--</td>--%>
								<%--<td>--%>
									<%--<s:iterator value="dataTypes" id="dataType" status="st">--%>
									<%--<s:property value="#dataType.dataTypeName" />--%>
									<%--<s:if test="!#st.last">--%>
										<%--<br/>--%>
									<%--</s:if>--%>
									<%--</s:iterator>--%>
								<%--</td>--%>
								<%--<td><s:property value="submitter.organization" />--%>
								<%--</td>--%>
							<%--</tr>--%>
						<%--</s:iterator>--%>
					<%--</tbody>--%>
				</table>
				</div>
				</div>
				<div class="tab-pane fade in" id="ncbiData_type" style="margin-left: 15px;margin-right: 15px;">
					<br>
					<div class="col-md-12 col-sm-12 col-xs-12 pull-right"   style="margin-top:20px;margin-bottom: 10px;">
						<s:form  action="list" id="insdc_filter" namespace="/browse" cssClass="form-horizontal">
							<div class="form-group" style="margin: 0 auto;float:right;">
								<div class="row">
									<div class="col-md-4" style="margin-right: 5px;padding-right: 0;padding-left: 0">
										<select class="form-control" name="filterName" id="filterName">
											<option value="1">Accession</option>
										</select>
									</div>
									<div class="col-md-6" style="margin-right: 5px;margin-left: 0; padding-left: 0;padding-right: 0">
										<input name="nAccession" class="form-control" placeholder="find a INSDC accession">
									</div>
									<div class="col-md-1" style="margin-right: 0;margin-left: 0; padding-left: 0;padding-right: 0">
										<button class="btn btn-info" type="submit" style="padding: 9px 15px">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</div>
								</div>
							</div>
						</s:form>
					</div>
					<br>
					<div style="margin-bottom: 10px;">
						<table class="table table-striped table-bordered  dataTable" id="ncbi_table">
							<thead>
							<tr>
								<th style="width: 10%">Accession</th>
								<th style="width: 20%">Title</th>
								<th style="width: 10%">Data type</th>
								<th style="width: 10%">Sample Scope</th>
								<th style="width: 10%">Release Time</th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="projectInsdcs" id="submission">
								<tr>
									<td><a href="browse/insdc/<s:property value='second_accession'/>"><s:property value='second_accession' /></a></td>
									<td>
										<s:property value='title' />
									</td>
									<td><s:property value='data_type_name'/></td>
									<td><s:property value='sample_scope_name'/></td>
									<td>
										<s:if test="release_flag==1">
											<s:date name="release_time" format="yyyy-MM-dd"/>
										</s:if>
										<s:else>
											-
										</s:else>
									</td>
								</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
					<div>
						<ul class="pager paging_cra">
							<li class="total">Total Items:&nbsp;<s:property
									value="#request.page.rowCount" />
							</li>
							<li class="total">Items of <s:if
									test="%{#request.page.rowFrom==0}">1</s:if> <s:else>
								<s:property value="#request.page.rowFrom" />
							</s:else>- <s:property value="#request.page.rowTo" /></li>
							<s:if test="projectInsdcs.size==0">
								Page size&nbsp;<s:property value="page.pageSize"/>
							</s:if>
							<s:else>
								<li class="total">Page size&nbsp;10
									&nbsp;</li>
								<li class="total">Page&nbsp;<s:property value="page.pageNo" />/<s:property
										value="page.lastPageNo" />&nbsp;</li>
								<li class="total"><a
										style="color: #0066FF; text-decoration: none;"
										href="javascript:void(0)" onclick="goFrist('<%=myUrl%>', '<s:property value="page.pageNo"/>',1)"> << First </a>&nbsp;&nbsp;
									<s:if test="page.isHasPreviousPage==1">
										<a style="color: #0066FF; text-decoration: none;"
										   href="javascript:void(0)" onclick="goPrevious('<%=myUrl%>', '<s:property value="page.pageNo"/>',1)"> < Previous </a>&nbsp;&nbsp;
									</s:if> <s:if test="page.isHasNextPage==1">
										<a style="color: #0066FF; text-decoration: none;"
										   href="javascript:void(0)" onclick="goNext('<%=myUrl%>', '<s:property value="page.pageNo"/>',1)"> Next > </a>&nbsp;&nbsp;
									</s:if> <a style="color: #0066FF; text-decoration: none;"
											   href="javascript:void(0)" onclick="goLast('<%=myUrl%>', '<s:property value="page.pageNo"/>',1)"> Last >> </a></li>
								<li style="border:0px; margin-left:10px;">Jump To&nbsp; <input
										size="5" type="text" id="gono" name="gono"
										value="<s:property value='page.pageNo' />" />&nbsp; <input
										type="button" value="GO"
										onclick="goPage('<%=myUrl%>', '<s:property value="page.pageNo"/>',1)" />
								</li>
							</s:else>

						</ul>
					</div>

					<s:form action="list" id="sumForm" namespace="/browse/run">
						<input type="hidden" id = "pageNo" name="pageNo" />
						<input type="hidden" id = "pageSize" name="pageSize" />
						<input type="hidden" id = "flag" name="flag" value="<s:property value='flag' />"/>
					</s:form>
				</div>
		</div>

	</div>
	<script src="js/cra/jquery.dataTables.min.js" type="text/javascript"></script>
	<script type="text/javascript">
        $(document).ready(function(){
			$('#all_table').DataTable(
					{
						"ajax": {
							url: "json/ngdcBrowse.json",
							dataSrc: ""
						},
						columns: [
							{
								data: 'accession',
								render: function(data, type, row) { return '<a href="browse/'+data+'">' + data + '</a>'; }
							},{
								data: 'title'
							},{
								data: 'tax'
							},{
								data: 'data'
							},{
								data: 'organization'
							}
						],
						bLengthChange: false,
						"paging": true,
						"info": false,
						"searching": true,
						"bInfo": true,
						"bLengthChange": false,
						"iDisplayLength": 10,
						"order": [],
						"oLanguage": { //国际化配置
							"sSearch": "Filter: ",
						}
					}
			);
			var flag = document.getElementById("flag").value;
			if(flag=="0") {
				changeTypeN('gsaData');
			} else if(flag=="1"){
				changeTypeN('ncbiData');
			}
        });
		function goPage(url, pno,flag) {
			var no = $("#gono").val();
			var size = $("#listpage").val();
			$("#pageNo").val(no);
			$("#pageSize").val(size);
			$("#flag").val(flag);
			var fl = document.forms['sumForm'];
			fl.action=getContextPath()+"/"+url;
			$("#sumForm").submit();
		}
		function goFrist(url, pno,flag) {
			var frist = '<s:property value="page.firstPageNo"/>';
			var size = $("#listpage").val();
			$("#pageNo").val(frist);
			$("#pageSize").val(size);
			$("#flag").val(flag);
			var fl = document.forms['sumForm'];
			fl.action=getContextPath()+"/"+url;
			$("#sumForm").submit();
		}
		function goLast(url, pno,flag) {
			var frist = '<s:property value="page.lastPageNo"/>';
			var size = $("#listpage").val();
			$("#pageNo").val(frist);
			$("#pageSize").val(size);
			$("#flag").val(flag);
			var fl = document.forms['sumForm'];
			fl.action=getContextPath()+"/"+url;
			$("#sumForm").submit();
		}
		function goPrevious(url, pno,flag) {
			var previous = Number('<s:property value="page.pageNo"/>')-1;
			var size = $("#listpage").val();
			$("#pageNo").val(previous);
			$("#pageSize").val(size);
			$("#flag").val(flag);
			var fl = document.forms['sumForm'];
			fl.action=getContextPath()+"/"+url;
			$("#sumForm").submit();
		}
		function goNext(url, pno,flag) {
			var next = Number('<s:property value="page.pageNo"/>')+1;
			var size = $("#listpage").val();
			$("#pageNo").val(next);
			$("#pageSize").val(size);
			$("#flag").val(flag);
			var fl = document.forms['sumForm'];
			fl.action=getContextPath()+"/"+url;
			$("#sumForm").submit();
		}
		function getContextPath() {
			var pathName = document.location.pathname;
			var index = pathName.substr(1).indexOf("/");
			var result = pathName.substr(0,index+1);
			return result;
		}
		function changeTypeN(id){
			$('#gsaData').removeClass("active");
			$('#gsaData_type').css('display', 'none');
			$('#ncbiData').removeClass("active");
			$('#ncbiData_type').css('display', 'none');

			$('#'+id+"_type").css('display', 'block');
			$("#"+id).addClass("active");
		}
	</script>
</body>
</html>
