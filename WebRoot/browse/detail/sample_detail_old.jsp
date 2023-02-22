<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>GSA - BioSample</title>
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
	<script type="text/javascript" language="javascript">
		//$(function(){
			//$(".overview-table").each(function(){
				//if($(this).find("tbody").text().trim() == ""){
				//	$(this).hide();
				//	$(this).parent().prev().hide();
					
				//};
			//});
		//});
	</script>
<jsp:include page="/inc/header_sample.jsp"></jsp:include>

<!-- samples-->
<div id="content">
  <div id="bread">You now at:  BioSample > Samples</div>
  <div class="my_content1">
<table class="detail_table" width="928" border="0">
  <tr>
    <td width="167" valign="top"><b>Identifier</b></td>
    <td width="751" valign="top"><s:property value="detailSample.accession"/></td>
  </tr>
  <tr>
    <td valign="top"><b>Name</b></td>
    <td valign="top"><s:property value="detailSample.name"/></td>
  </tr>
  <tr>
    <td valign="top"><b>Title</b></td>
    <td valign="top"><s:property value="detailSample.title"/></td>
  </tr>
  <tr>
    <td valign="top"><b>Organism</b></td>
    <td valign="top"><s:property value="detailSample.taxon.name"/></td>
  </tr>
  
  <tr>
    <td valign="top"><b>Description</b></td>
    <td valign="top"><s:property value="detailSample.publicDescription"/></td>
  </tr>
  <tr>
  	<td valign="top"><b>Release date</b></td>
    <td valign="top"><s:date format="yyyy-MM-dd" name="detailSample.releaseTime"></s:date></td>
  </tr>
  <tr>
  	<td valign="top"><b>Attributes</b>
  	<td>

		<%String test="/browse/detail/sample_attributes/"+request.getAttribute("sampleAttrType").toString()+".jsp";out.print("======"+test);%>
  		<s:if test="%{sampleAttrType=='sampleAttrHuman'}">
  		<jsp:include page="<%=test %>" />
  		</s:if>
  		<s:elseif test="%{sampleAttrType=='sampleAttrModelAnimal'}">
  		  <table class="overview-table" style="width:800px;">
  			<thead>
  				<th>Strain</th>
  				<th>Breed</th>
  				<th>Age</th>
  				<th>Sex</th>
  				<th>Tissue</th>
  				<th>Disease</th>
  				<th>Biomaterial provider</th>
  			</thead>
  			<tbody>
  				<td><s:property value="sampleAttribute.strain"/></td>
  				<td><s:property value="sampleAttribute.breed"/></td>
  				<td><s:property value="sampleAttribute.age"/></td>
  				<td><s:property value="sampleAttribute.sex" /></td>
  				<td><s:property value="sampleAttribute.tissue" /></td>
  				<td><s:property value="sampleAttribute.disease"/></td>
  				<td><s:property value="sampleAttribute.biomaterialProvider"/></td>
  			</tbody>
  		</table>
  		</s:elseif>
  		<s:elseif test="%{sampleAttrType=='sampleAttrMicrobe'}">
  		  <table class="overview-table" style="width:800px;">
  			<thead>
  				<th>Strain</th>
  				<th>Isolateion source</th>
  				<th>Collecion date</th>
  				<th>Geographic location</th>
  				<th>Biomaterial provider</th>
  			</thead>
  			<tbody>
  				<td><s:property value="sampleAttribute.strain"/></td>
  				<td><s:property value="sampleAttribute.isolationSource"/></td>
  				<td><s:date format="yyyy-MM-dd" name="sampleAttribute.collectionDate"/></td>
  				<td><s:property value="sampleAttribute.geographicLocation" /></td>
  				<td><s:property value="sampleAttribute.biomaterialProvider" /></td>
  			</tbody>
  		</table>
  		</s:elseif>
  		<s:elseif test="%{sampleAttrType=='sampleAttrPathogenClinicalHostAssociated'}">
  		  <table class="overview-table" style="width:800px;">
  			<thead>
  			  	<th>Host</th>
  				<th>Host disease</th>
  				<th>Collected by</th>
  				<th>Collection date</th>
  				<th>Geographic location</th>
  				<th>Isolation source</th>
  				<th>Latitude and longitude</th>
  			</thead>
  			<tbody>
  				<td><s:property value="sampleAttribute.hostTaxon.name"/></td>
  				<td><s:property value="sampleAttribute.hostDisease"/></td>
  				<td><s:property value="sampleAttribute.collectedBy"/></td>
  				<td><s:date format="yyyy-MM-dd" name="sampleAttribute.collectionDate" /></td>
  				<td><s:property value="sampleAttribute.geographicLocation" /></td>
  				<td><s:property value="sampleAttribute.isolationSource" /></td>
  				<td><s:property value="sampleAttribute.latitudeLongitude" /></td>
  			</tbody>
  		</table>
  		</s:elseif>
  		<s:elseif test="%{sampleAttrType=='sampleAttrPathogenEnvironmentalFoodOther'}">
  		  <table class="overview-table" style="width:800px;">
  			<thead>
  				<th>Collected by</th>
  				<th>Collection date</th>
  				<th>Geographic location</th>
  				<th>Isolation source</th>
  				<th>Latitude and longitude</th>
  			</thead>
  			<tbody>
  				<td><s:property value="sampleAttribute.collectedBy"/></td>
  				<td><s:date format="yyyy-MM-dd" name="sampleAttribute.collectionDate" /></td>
  				<td><s:property value="sampleAttribute.geographicLocation" /></td>
  				<td><s:property value="sampleAttribute.isolationSource" /></td>
  				<td><s:property value="sampleAttribute.latitudeLongitude" /></td>
  			</tbody>
  		</table>
  		</s:elseif>
  		<s:elseif test="%{sampleAttrType=='sampleAttrPlant'}">
  		  <table class="overview-table" style="width:800px;">
  			<thead>
  				<th>Cultivar</th>
  				<th>Biomaterial provider</th>
  				<th>Tissue</th>
  				<th>Age</th>
  			</thead>
  			<tbody>
  				<td><s:property value="sampleAttribute.cultivar"/></td>
  				<td><s:property value="sampleAttribute.biomaterialProvider" /></td>
  				<td><s:property value="sampleAttribute.tissue" /></td>
  				<td><s:property value="sampleAttribute.age" /></td>
  			</tbody>
  		</table>
  		</s:elseif>
  		<s:else>
  		  <table class="overview-table" style="width:800px;">
  			<thead>
  				<th>Isolate</th>
  				<th>Strain</th>
  				<th>Host</th>
  				<th>Collection date</th>
  				<th>Geographic location</th>
  				<th>Isolation source</th>
  			</thead>
  			<tbody>
  				<td><s:property value="sampleAttribute.isolate"/></td>
  				<td><s:property value="sampleAttribute.strain" /></td>
  				<td><s:property value="sampleAttribute.taxon.name" /></td>
  				<td><s:date format="yyyy-MM-dd" name="sampleAttribute.collectionDate" /></td>
  				<td><s:property value="sampleAttribute.geographicLocation" /></td>
  				<td><s:property value="sampleAttribute.isolationSource" /></td>
  			</tbody>
  		</table>
  		</s:else>
  	</td>
  </tr>
  <tr>
  	<td valign="top"><b>Project</b></td>
  	<td valign="top"><a href="/browse/project/detail.action?access=<s:property value='access'/><s:if test='%{access==3}'>&code=<s:property value='code'/></s:if>&prjId=<s:property value='detailSample.prjId'/>" target="_blank"><s:property value="projectRelatedData.prjAccession"/></a></td>
  </tr>
  <tr>
    <td valign="top"><b>Sample data</b></td>
    <td valign="top">
    	Experiments:
    	<s:set var="expCount" value="%{projectRelatedData.expCount}"/>
    	<s:if test="#expCount==0">0</s:if>
    	<s:else>
    		<a href="/search/experiment/listBySID.action?access=<s:property value='access'/>&totalCount=<s:property value='#expCount'/><s:if test='%{access==3}'>&code=<s:property value='code'/></s:if>&sampleId=<s:property value='detailSample.sampleId' />"><s:property value='#expCount'/>
    		</a>
    	</s:else>
    	<br/>
    	Runs:<s:set var="runCount" value="%{projectRelatedData.runCount}"/>
    	<s:if test="#runCount==0">0</s:if>
    	<s:else>
    		<a href="/browse/run/listBySample.action?access=<s:property value='access'/>&totalCount=<s:property value="#runCount"/><s:if test='%{access==3}'>&code=<s:property value='code'/></s:if>&sampleId=<s:property value='sampleId' />"><s:property value="#runCount"/></a>
    	</s:else></td>
  </tr>
  <s:if test="%{access==1 || access==4}">
  	<s:if test="%{detailSample.isReleased==1}">
   <tr>
	<td valign="top"><b>Run data</b></td>
	<td valign="top"><a href="ftp://download.big.ac.cn/gsa/<s:property value='projectRelatedData.prjAccession' />/<s:property value='detailSample.accession'/>" target="_blank">FTP download</a></td>
   </tr>
   </s:if>
   </s:if>
  <tr>
    <td valign="top"><b>Submission</b></td>
    <td><s:property value="detailSample.sampleSubmitter.firstName"/>&nbsp;<s:property value="detailSample.sampleSubmitter.middleName"/>&nbsp;<s:property value="detailSample.sampleSubmitter.lastName"/>,&nbsp;&nbsp;<s:property value="detailSample.sampleSubmitter.organization"/>
      	<br />
      	<s:property value="detailSample.sampleSubmitter.email"/><br/>
      	<s:date name="detailSample.createTime" format="yyyy-MM-dd"></s:date>
    </td>
  </tr>

</table>
		</div>
		</div>   

	<jsp:include page="/inc/footer.jsp"/>
</body>
</html>