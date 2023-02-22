<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>GSA-Genome Sequence Archive</title>
<!-- base.css | 元素还原基础样式 -->
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<!-- main.css | 页面主体样式 -->
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<!-- js -->

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/mm_menu.js"></script>
</head>
<body>
<script language="JavaScript1.2">mmLoadMenus();</script>
<jsp:include page="/inc/header.jsp"></jsp:include>
 
<!-- projects-->
<div id="content">
  <div id="bread">You now at:  BioSample > My Samples</div>
  <div class="title_1" style="font-weight:bold;color:#0F3688;">My published samples<span style="padding-left:10px;"></div>
  <div class="my_content">
  <table width="1200" class="pickme" id="striped2" caption="Top Grossing Movies">
<thead>
<tr>
			<th width="95" >Accession</th>
			<th width="337">Title</th>
			<th width="165">Organism</th>
			<th width="170">Related Data</th>
			<th width="155">Project</th>
			<th width="150">Submitter</th>
			<th width="100">Release Date</th>
		</tr>
</thead>
<tbody>
<s:iterator value="publishedSamples" status="status">
<tr>
	<td><a href="/browse/sample/detail.action?access=<s:property value='access'/>&accession=<s:property value='accession'/>"><s:property value="accession"/></a></td>
 	<td><s:property value="title"/></td>
	<td><s:property value="taxon.name"/></td>
	<td>Experiments:<s:set var="expCount" value="%{publishedProjectRelatedData[#status.index].expCount}"/><s:if test="#expCount==0">0</s:if><s:else><a href="/search/experiment/listBySID.action?access=<s:property value='access'/>&sampleId=<s:property value='sampleId' />"><s:property value='#expCount'/></a></s:else></br>
	Runs:<s:set var="runCount" value="%{publishedProjectRelatedData[#status.index].runCount}"/><s:if test="#runCount==0">0</s:if>
	<s:else>
	<a href="/browse/run/listBySample.action?access=<s:property value='access'/>&totalCount=<s:property value="#runCount"/>&sampleId=<s:property value='sampleId' />"><s:property value="#runCount"/></a>
	</s:else></td>
	<td><a href="/browse/project/detail.action?access=<s:property value='access'/>&prjId=<s:property value='prjId'/>"><s:property value='%{publishedProjectRelatedData[#status.index].prjAccession}'/></a></td>
	<td><s:property value="sampleSubmitter.firstName"/>&nbsp;<s:property value="sampleSubmitter.middleName"/>&nbsp;<s:property value="sampleSubmitter.lastName"/>,&nbsp;<s:property value="sampleSubmitter.organization"/></td>
	<td><s:date name="releaseTime" format="yyyy-MM-dd"/></td>   
</tr>
</s:iterator>
</tbody>
</table>
  </div>
   <div class="title_1" style="font-weight:bold;color:#0F3688;">My unpublished samples<span style="padding-left:10px;"></div>
  <div class="my_content">
  <table width="1200" class="pickme" id="striped2" caption="Top Grossing Movies">
<thead>
	<tr>
			<th width="95" >Accession</th>
			<th width="337">Title</th>
			<th width="165">Organism</th>
			<th width="170">Related Data</th>
			<th width="155">Project</th>
			<th width="150">Submitter</th>
			<th width="100">Release Date</th>
	</tr>
</thead>
<tbody>
<s:iterator value="unpublishedSamples" status="status">
<tr>
	<td><a href="/browse/sample/detail.action?access=<s:property value='access'/>&accession=<s:property value='accession'/>"><s:property value="accession"/></a></td>
 	<td><s:property value="title"/></td>
	<td><s:property value="taxon.name"/></td>
	<td>Experiments:<s:set var="expCount" value="%{unpublishedProjectRelatedData[#status.index].expCount}"/><s:if test="#expCount==0">0</s:if><s:else><a href="/search/experiment/listBySID.action?access=<s:property value='access'/>&sampleId=<s:property value='sampleId' />"><s:property value='#expCount'/></a></s:else></br>
	Runs:<s:set var="runCount" value="%{unpublishedProjectRelatedData[#status.index].runCount}"/><s:if test="#runCount==0">0</s:if>
	<s:else>
	<a href="/browse/run/listBySample.action?access=<s:property value='access'/>&totalCount=<s:property value="#runCount"/>&sampleId=<s:property value='sampleId' />"><s:property value="#runCount"/></a>
	</s:else></td>
	<td><a href="/browse/project/detail.action?access=<s:property value='access'/>&prjId=<s:property value='prjId'/>"><s:property value='%{unpublishedProjectRelatedData[#status.index].prjAccession}'/></a></td>
	<td><s:property value="sampleSubmitter.firstName"/>&nbsp;<s:property value="sampleSubmitter.middleName"/>&nbsp;<s:property value="sampleSubmitter.lastName"/>,&nbsp;<s:property value="sampleSubmitter.organization"/></td>
	<td><s:date name="releaseTime" format="yyyy-MM-dd"/></td>   
</tr>
</s:iterator>
</tbody>
</table>
  </div>
	</div>
<script type="text/javascript">
	$(document).ready(function () { //这个就是传说的ready  
		$(".resultable tr").mouseover(function () {
			//如果鼠标移到class为t1的表格的tr上时，执行函数  
			$(this).addClass("over");
		}).mouseout(function () {
			//给这行添加class值为over，并且当鼠标一出该行时执行函数  
			$(this).removeClass("over");
		}) //移除该行的class  
			$(".resultable tr:even").addClass("even");
			//给class为t1的表格的偶数行添加class值为alt
		});
</script>
</body>
</html>