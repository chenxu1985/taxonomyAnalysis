<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>GSA - BioSample</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="BioSample,GSA">
<meta http-equiv="description" content="BioSample Detail">
<jsp:include page="/inc/css_js.jsp" />
	<script type="text/javascript" language="javascript">
		$(function(){
			$("#attribute_table tr").each(function(){
				if($(this).children('td').eq(0).text().trim() == ""){
					$(this).hide();
					//$(this).parent().prev().hide();					
				};
			});
		});
	</script>
</head>
<body>
<jsp:include page="/inc/header_sample.jsp" />
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="/">Home</a>
			</li>
			<li class="active"><a href="/browse/sample">BioSample</a></li>
			<li><s:property value="wrappedSample.sample.accession"/></li>
		</ol>
<!-- 		<div class="panel panel-default panel-note">
			<div class="panel-body">
				<span>NOTE:</span>This page shows the detailed information about the selected BioSample and it's related Samples.
			</div>
		</div> -->	
		<div class="panel panel-default">
		<s:if test="wrappedSample!=null">
		<div class="row">
		<div class="col-lg-9">   
		<div class="brodet_lift1"> 
      	<div class="row">    
        <table class="table2 table2-border">
        <tr>
          <th width="160">Identifier</th>
          <td><s:property value="wrappedSample.sample.accession"/><span></span></td>
        </tr>
        <tr>
          <th>Name</th>
          <td><s:property value="wrappedSample.sample.name"/></td>
        </tr>
        <tr>
          <th>Title</th>
          <td><s:property value="wrappedSample.sample.title"/></td>
        </tr>
		<tr>
          <th>Organism</th>
          <td><a href="https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=<s:property value='wrappedSample.sample.taxon.taxonId'/>" target="_blank"><s:property value="wrappedSample.sample.taxon.name"/></a></td>
        </tr>
        <tr>
          <th>Description</th>
          <td><s:property value="wrappedSample.sample.publicDescription"/></td>
        </tr>
        <!-- attributes -->
        <tr>
  			<th>Attributes</th>
  			<td>
        <%String attributePage="/browse/detail/sample_attributes/"+request.getAttribute("sampleAttrType").toString()+".jsp";%>
		<jsp:include page="<%=attributePage%>" />
			</td>
		</tr>
        <!-- attributes -->
        <tr>
          <th>Release date</th>
          <td><s:date format="yyyy-MM-dd" name="wrappedSample.sample.releaseTime"></s:date></td>
        </tr>
        <tr>
  		  <th>Project</th>
  	      <td><a href="/browse/project/<s:property value='wrappedSample.project.accession'/>" target="_blank"><s:property value="wrappedSample.project.accession"/></a></td>
        </tr>
        <tr>
			<th>Submitter</th>
			<td>

					<s:property value="wrappedSample.sample.sampleSubmitter.firstName"/>&nbsp;<s:property value="wrappedSample.sample.sampleSubmitter.middleName"/>&nbsp;<s:property value="wrappedSample.sample.sampleSubmitter.lastName"/>&nbsp;&nbsp;(<s:property value="wrappedSample.sample.sampleSubmitter.email"/>)

<!-- 			  	<tr>
			  		<td>
			  			<s:property value="wrappedSample.sample.sampleSubmitter.email"/>
			  		</td>
			  	</tr> -->

			</td>
		</tr>
		<tr>
			<th>Affiliation</th>
			<td><s:property value="wrappedSample.sample.sampleSubmitter.organization"/></td>
		</tr>
        <tr>
			<th>Submission date</th>
			<td><s:date name="wrappedSample.sample.createTime" format="yyyy-MM-dd"></s:date></td>
		</tr>
        
       
        </table>
      </div>
      <h1>Sample Data</h1>
      <div class="row">
        <table class="table4 table4-border">
        <tbody>
        <tr>
          <th width="300px">Resource name</th>
          <th>Description</th>
        </tr>
        <tr>
          <td>GSA (<s:property value="wrappedSample.cras.size" />)</td>
          <td>-</td>
        </tr>
        <s:if test="%{wrappedSample.cras!=null}">
        <s:iterator value="wrappedSample.cras" id="cra">
        <tr>
          <td style=" text-indent:24px"><a href="/browse/cra/<s:property value='#cra.accession'/>"><s:property value="#cra.accession"/></a></td>
          <td><s:property value="#cra.accession"/></td>
        </tr>
        </s:iterator>
        </s:if>
        </tbody>
        </table>
      </div>   
      </div>  
  </div>  
  <div class="col-lg-3">
    <div class="brodet_right">
    <div class="brodet_right1 block1">
      <div class="title">Related Samples</div>
      <div class="title1">Samples (<s:if test="%{wrappedSample.relatedSamples==null}">0</s:if><s:else><s:property value="wrappedSample.relatedSamples.size" /></s:else>)</div>
      <s:if test="%{wrappedSample.relatedSamples!=null}">
      <ul>
      		<s:iterator value="wrappedSample.relatedSamples" id="relatedSample">
      			<li><a href="/browse/sample/<s:property value='#relatedSample.accession'/>"><s:property value="#relatedSample.accession" /></a></li>
      		</s:iterator>	
      </ul>
      </s:if>
      </div>
    </div>
  </div>
  </div>
  </s:if>
  <s:else>
  <div class="panel-body">
  	No items found.
  	</div>
  </s:else>
		</div>
		</div>
						
</body>
</html>