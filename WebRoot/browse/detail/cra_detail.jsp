<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>GSA - CRA</title>
    <jsp:include page="/inc/css_js.jsp"/>
  </head>
  <body>
    <jsp:include page="/inc/header_cra.jsp"/>
    <div class="container">
    	<ol class="breadcrumb">
		  <li><a href="/">Home</a></li>
		  <li><a href="/browse/cra">GSA</a></li>
		  <li class="active"><s:property value='cra.accession'/></li>
		</ol>
		<div class="panel panel-info">
		  <div class="panel-heading"><s:property value='cra.accession'/> Information</div>
		  <div class="panel-body ">
		  	<!-- <div class="row">
		  		<div class="col-md-10">
		  			<h5></h5>
		  		</div>
		  	</div> -->
		  	<div class="row">
		  		<div class="col-md-6">
		  			<span style="padding-left:10px;font-size:14px;"><b>Alias:</b> <s:property value='cra.alias'/></span>
		  		</div>
		  		<div class="col-md-6">
		  			<span style="padding-left:10px;font-size:14px;"><b>Release date:</b> <s:date format='yyyy-MM-dd' name='cra.releaseTime'/></span>
		  		</div>
		  	</div>
		  </div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">Experiments & Runs   <div class="pull-right"><a href="ftp://download.big.ac.cn/gsa/<s:property value='cra.accession'/>" target="_blank"><img style="padding-right:5px;" src="/img/download3.png"/>Download</a></div></div>
			<div class="panel-body table-responsive">
				<table class="table table-bordered  ">
					<tbody>
						<thead>
							<tr class="success exp_tb_header">
								<th width="130px">Experiment accession</th>
								<th>Title / Alias</th>
								<th>Taxon name</th>
								<th>Platform</th>
								<th>Project</th>
								<th>Sample</th>
								<th>Release date</th>
							</tr>
						</thead>
						<s:iterator value="cra.experiments" id="exp" >
							<tr class="success experiment">
								<td class="experiments">
									<a href="/browse/experiment/<s:property value='#exp.accession' />"><s:property value='#exp.accession' /></a>
								</td>
								<td><s:property value='#exp.title' /></td>
								<td><s:property value='#exp.taxon.name' /></td>
								<td><s:property value="#exp.expPlatform.platformName" /></td>
								<td><a href="/browse/project/<s:property value='#exp.proAcc' />"><s:property value="#exp.proAcc" /></a> <br> <s:property value="#exp.crpAcc" /></td>
								<td><a href="/browse/sample/<s:property value='#exp.sampleAcc' />"><s:property value="#exp.sampleAcc" /></a> <br> <s:property value="#exp.crsAcc" /></td>
								<td><s:date name='#exp.releaseTime' format="yyyy-MM-dd" /></td>
							</tr>
							<s:iterator value="#exp.runs" id="run" status="index">
								<s:if test="#index.first">
									<thead>
										<tr class="warning run_tb_header">
											<th class="accession">Run accession</th>
											<th class="alias">Title / Alias</th>
											<th class="runDataFile" colspan="4">Run data file information</th>
											<th class="release">Release date</th>
										</tr>
									</thead>
								</s:if>
								<tr class="warning">
									<td class="runs">
										<a href="/browse/run/<s:property value='#run.accession' />"><s:property value='#run.accession' /></a>
									</td>
									<td><s:property value='#run.alias' /></td>
									<td colspan="4">
									<s:iterator value="#run.runDataFiles" id="runDataFile" status="index">
										<s:if test="#index.even"></br></s:if><%-- <s:property value='#index.count' /> --%>
										<strong>File: </strong><s:property value='#runDataFile.runFileName' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<strong>Size:</strong><s:property value='#runDataFile.runFileSizeMB' />&nbsp;(MB)
									</s:iterator>
									</td>
									<td><s:date name='#run.releaseTime' format="yyyy-MM-dd" /></td>
								</tr>
							</s:iterator>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
		<div style="padding-left:20px;margin-bottom:40px;border:1px solid #ccc;border-radius:3px;">
			<h5>Submitter:<span style="padding-left:10px;font-size:14px;font-weight:normal"><s:property value='cra.user.firstName'/> <s:property value='cra.user.middleName'/> <s:property value='cra.user.lastName'/>&nbsp;(<s:property value='cra.user.email'/>)</span></h5>
			<h5>Affiliation:<span style="padding-left:10px;font-size:14px;font-weight:normal"><s:property value='cra.user.organization'/></span></h5>
			<h5>Submission date:<span style="padding-left:10px;font-size:14px;font-weight:normal"><s:date name='cra.createTime' format="yyyy-MM-dd" /></span></h5>
			<br>
			<s:if test="cra.relatedCras.size!=0">
			<h5>Related submissions:</h5>
			<s:iterator value="cra.relatedCras" id="cra1" status="index">
  				<h5 style="padding-left:15px;"><a href="/browse/cra/<s:property value='#cra1.accession'/>"><s:property value='#cra1.accession'/></a>:<span style="padding-left:10px;font-size:14px;font-weight:normal"><s:property value='#cra1.alias'/></span></h5>
  		  	</s:iterator>
  		  	</s:if>
		</div>
    </div> 
  </body>
</html>
