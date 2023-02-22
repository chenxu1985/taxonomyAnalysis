<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>GSA - Experiment</title>
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
			<li><a href="/browse/cra/<s:property value="experiment.craAcc"/>">GSA Detail</a></li>
			<li class="active">Experiment</li>
		</ol>
<!-- 		<div class="panel panel-default panel-note">
			<div class="panel-body">
				<span>NOTE:</span>This page shows the detailed information about the selected Experiment and it's related information.
			</div>
		</div> -->	
		<div class="panel panel-info">
		<div class="panel-heading">Experiment information</div>
		<div class="row">
		<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">   
		<div class="brodet_lift1 table-responsive"> 
        <table class="table2 table2-border">
        <tr> <th width="150px">Accession</th>  <td><s:property value="experiment.accession"/></td>  </tr>
        <tr> <th>Organism</th> <td><s:property value="experiment.taxon.name"/></td>  </tr>
        <tr> <th>BioProject</th>  <td><a href="/browse/project/<s:property value='experiment.proAcc'/>"><s:property value="experiment.proAcc"/></a></td> </tr>
        <tr> <th>BioSample</th>   <td><a href="/browse/sample/<s:property value='experiment.sampleAcc'/>"><s:property value="experiment.sampleAcc"/></a></td> </tr>
        <tr> <th>Platform</th> <td><s:property value="experiment.expPlatform.platformName"/></td> </tr>
        <tr> <th>Library</th>  
        		<td>
        			<table class="projec_table projec_table-border">
        			<tr>
        				<th>Library name</th>
        				<th>Construction protocol</th>
        				<th>Strategy</th>    
        				<th>Source</th>  				
        				<th>Selection</th>
        				<th>Layout</th>
        			</tr>
       				<tr>
       					<td><s:property value="experiment.libName"/></td>
       					<td><s:property value="experiment.libDesign"/></td>
       					<td><s:property value="experiment.expLibStrategy.strategyName"/></td>
       					<td><s:property value="experiment.expLibSource.sourceName"/></td>
       					<td><s:property value="experiment.expLibSelection.selectionName"/></td>
       					<td>
       						<s:if test="experiment.libLayout==1">FRAGMENT</s:if>
       						<s:elseif test="experiment.libLayout==2">PAIRED</s:elseif>
       					</td>
       				</tr>
        			</table>
        		</td>
        </tr>              
        <tr>
          <th>Processing</th>
          <td>
          	<s:if test="experiment.plannedReadLengthMate1!=null && experiment.plannedReadLengthMate1!=0"><strong>Planned read length (bp) for mate 1: </strong><s:property value="experiment.plannedReadLengthMate1"/></br></s:if>
			<s:if test="experiment.plannedReadLengthMate2!=null && experiment.plannedReadLengthMate2!=0"><strong>Planned read length (bp) for mate 2: </strong><s:property value="experiment.plannedReadLengthMate2"/></br></s:if>
			<s:if test="experiment.libInsertSize!=null && experiment.libInsertSize!=0"><strong>Insert size (bp): </strong><s:property value="experiment.libInsertSize"/></br></s:if>
			<s:if test="experiment.libNominalSize!=null && experiment.libNominalSize!=0"><strong>Nominal size (bp): </strong><s:property value="experiment.libNominalSize"/></br></s:if>
			<s:if test="experiment.libNominalStandardDeviation!=null && experiment.libNominalStandardDeviation!=0"><strong>Nominal standard deviation (bp): </strong><s:property value="experiment.libNominalStandardDeviation"/></br></s:if>
			<s:if test="experiment.plannedReadLength!=null && experiment.plannedReadLength!=0"><strong>Planned read length (bp): </strong><s:property value="experiment.plannedReadLength"/></br></s:if>
			<s:if test="experiment.plannedNumberOfCycles!=null && experiment.plannedNumberOfCycles!=0"><strong>Planned number of cycles: </strong><s:property value="experiment.plannedNumberOfCycles"/></br></s:if>
          </td>
        </tr>
        <tr><th>Release date</th><td><s:date name="experiment.releaseTime" format="yyyy-MM-dd"></s:date></td></tr>
        <tr>
			<th>Related data</th>
			<td>
				<table class="projec_table projec_table-border">
        			<tr>
        				<th rowspan="2">Run</th>
        				<th rowspan="2">Release date</th>
        				<th colspan="2" style="text-align:center">Run data file</th>    
        			</tr>
        			<tr><th style="text-align:center">File name</th><th style="text-align:center">File size&nbsp;(MB)</th></tr>
        			<s:iterator value="experiment.runs" id="run">
        			<tr>
       					<td><a href="/browse/run/<s:property value='#run.accession'/>"><s:property value="#run.accession"/></a></td>
       					<td><s:date name="#run.releaseTime" format="yyyy-MM-dd"/></td>
       					<td><s:iterator value="#run.runDataFiles" id="runDataFile" status="index">
       						<s:if test="#index.first"><s:property value="#runDataFile.runFileName"/></s:if>
       						<s:else><br/><s:property value="#runDataFile.runFileName"/></s:else>
       						</s:iterator>
       					</td>
       					<td><s:iterator value="#run.runDataFiles" id="runDataFile" status="index">
       						<s:if test="#index.first"><s:property value="#runDataFile.runFileSizeMB"/></s:if>
       						<s:else><br/><s:property value="#runDataFile.runFileSizeMB"/></s:else>
       						</s:iterator>
       					</td>
       				</tr>
        			</s:iterator>
        			</table>
			</td>
        </tr>
        <tr><th>Submitter</th><td><s:property value='experiment.user.firstName'/> <s:property value='experiment.user.middleName'/> <s:property value='experiment.user.lastName'/>&nbsp;(<s:property value='experiment.user.email'/>)</td></tr>
        <tr><th>Affiliation</th><td><s:property value='experiment.user.organization'/></td></tr>
        <tr><th>Submission date</th><td><s:date name="experiment.createTime" format="yyyy-MM-dd"></s:date></td></tr>
        </table>
      </div> 
  </div>  
  <div class="col-lg-3 col-md-3 col-sm-12 col-xm-12">
    <div class="brodet_right">
    <div class="brodet_right1 block1">
      <div class="title">Related experiments</div>
      <ul>
		<s:iterator value="experiment.relatedExperimentsByCraId" id="relatedExperiment">
			<li><a href="/browse/experiment/<s:property value="#relatedExperiment.accession" />"><s:property value="#relatedExperiment.accession" /></a></li>
		</s:iterator>	
      </ul>
    </div>
    </div>
  </div>
  </div>
   </div>						
</body>
</html>