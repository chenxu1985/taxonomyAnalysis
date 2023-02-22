<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>GSA - Run</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="BioProject,GSA">
	<meta http-equiv="description" content="BioProject Detail">
	<jsp:include page="/inc/css_js.jsp" />
</head>
<body>
	<jsp:include page="/inc/header_cra.jsp" />
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="/">Home</a></li>
			<li><a href="/browse/cra">GSA</a></li>
			<li><a href="/browse/cra/<s:property value='run.craAcc' />"><s:property value="run.craAcc" /></a></li>
			<li class="active"><s:property value="run.accession" /></li>
		</ol>
		<%-- <div class="panel panel-note">
			<div class="panel-body">
				<span>NOTE:</span>This page shows the detailed information about the selected Run and it's related information.
			</div>
		</div> --%>
		<div class="panel panel-info">
			<!-- General info -->
			<div class="panel-heading">Run Information</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-9 table-responsive">
						<table class="table table-left table-condensed table-striped">
							<thead>
								<tr><th>Accession</th><th>Alias</th><th>File type</th><th>Submit date</th><th>Release date</th></tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="/browse/run/<s:property value='run.accession' />"><s:property value="run.accession" /></a></td>
									<td><s:property value="run.alias" /></td>
									<td><s:property value="run.runDataType.runDataTypeName" />
									</td><td><s:date name="run.createTime" format="yyyy-MM-dd" /></td>
									</td><td><s:date name="run.releaseTime" format="yyyy-MM-dd" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>	
			</div>
			<!-- end general info -->	
			<!-- Experiment -->
			<div class="panel-heading">Experiment</div>
			<div class="panel-body">
			<div class="row">
				<div class="col-md-9 table-responsive">
		       		<table class="table table-left table-condensed table-striped">
		       			<thead>
			       			<tr>
			       				<th>Accession</th>
			       				<th>Library name</th>
			       				<th>Platform</th>    
			       				<th>Strategy</th>  				
			       				<th>Source</th>       				
			       				<th>Selection</th>       				
			       				<th>Layout</th>       				
			       			</tr>
		       			</thead>
		       			<tbody>
			   				<tr>
			   					<td><a href="/browse/experiment/<s:property value='run.expAccession'/>"><s:property value="run.expAccession"/></a></td>
			   					<td><s:property value="run.libName"/></td>
			   					<td><s:property value="run.platform"/></td>
			   					<td><s:property value="run.libStrategy"/></td>
			   					<td><s:property value="run.libSource"/></td>
			   					<td><s:property value="run.libSelection"/></td>
			   					<td>
			   						<s:if test="run.libLayout==1">FRAGMENT</s:if>
			   						<s:elseif test="run.libLayout==2">PAIRED</s:elseif>
			   					</td>
			   				</tr>       			
		       			</tbody>
		       		</table>
       			</div>
       		</div>
       		</div>
       		<!-- end Experiment -->		
			<!-- Sample -->			
			<div class="panel-heading">BioSample</div>	
			<div class="panel-body">
			<div class="row">
				<div class="col-md-9 table-responsive">
		       		<table class="table table-left table-condensed table-striped">
		       			<thead>
			       			<tr>
			       				<th class="col-md-3">Accession</th>
			       				<th class="col-md-6">Title</th>     				
			       			</tr>
		       			</thead>
		       			<tbody>
			   				<tr>
			   					<td class="col-md-3"><a href="/browse/sample/<s:property value='run.sampleAccession'/>"><s:property value="run.sampleAccession"/></a></td>
			   					<td class="col-md-6"><s:property value="run.sampleTitle"/></td>
			   				</tr>       			
		       			</tbody>
		       		</table>
      			</div>
       		</div>
       		</div>
       		<!-- end Sample -->		
			<!-- Project -->			
			<div class="panel-heading">BioProject</div>
			<div class="panel-body">	
			<div class="row">
				<div class="col-md-9 table-responsive">
		       		<table class="table table-left table-condensed table-striped">
		       			<thead>
			       			<tr>
			       				<th with="170px">Accession</th>
			       				<th>Title</th>     				
			       			</tr>
		       			</thead>
		       			<tbody>
			   				<tr>
			   					<td><a href="/browse/project/<s:property value='run.prjAccession'/>"><s:property value="run.prjAccession"/></a></td>
			   					<td><s:property value="run.prjTitle"/></td>
			   				</tr>       			
		       			</tbody>
		       		</table>
      			</div>
       		</div>
       		</div>
       		<!-- end Project -->	
       		<!-- data file -->			
			<div class="panel-heading">Data Blocks</div>
			<div class="panel-body">	
			<div class="row">
				<div class="col-md-9 table-responsive">
		       		<table class="table table-left table-condensed table-striped">
		       			<thead>
			       			<tr>
			       				<th>File name</th>
			       				<th>Status</th>
								<th>File size&nbsp;(MB)</th>
								<th>Download</th>
			       			</tr>
		       			</thead>
		       			<tbody>
		       			<%-- <s:property value="run.runDataFiles.size"/> --%>
		       			<s:iterator value="run.runDataFiles" id="runDataFile" status="index">
			   				<tr>
			   					<td><s:property value='#runDataFile.runFileName' /></td>
			   					<td><s:property value='#runDataFile.statusString' /></td> <!-- 因为查询时字段同名，所以绑定到run上面了，其实是runfile的状态 -->
			   					<td><s:property value='#runDataFile.runFileSizeMB' /></td>
			   					<!-- <s:if test="#index.first">
			   						<td rowspan="<s:property value='run.runDataFiles.size'/>"><a href=""><img style="margin-left:28px;" src="/img/download3.png"/></a></td>
			   					</s:if> -->
			   					
			   					<td><a href="ftp://download.big.ac.cn/gsa<s:property value='#runDataFile.archivedFileDir'/>" target="_blank"><img style="margin-left:28px;" src="/img/download3.png"/></a></td>
			   				</tr>   
			   			</s:iterator>    			
		       			</tbody>
		       		</table>
       			</div>
       		</div>
       		</div>
       		<!-- end data file -->	
		</div>
	</div>
</body>
</html>