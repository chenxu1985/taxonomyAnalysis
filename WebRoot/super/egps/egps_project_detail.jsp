<%@ page language="java" import="cn.ac.big.sra.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	  <title>EGPS - BioProject - CNCB-NGDC</title>
	  <meta http-equiv="pragma" content="no-cache">
	  <meta http-equiv="cache-control" content="no-cache">
	  <meta http-equiv="expires" content="0">
	  <meta http-equiv="keywords" content="BioProject,GSA">
	  <meta http-equiv="description" content="BioProject Detail">
	  <jsp:include page="/inc/css_js.jsp"/>
  </head>
  <body>
	<jsp:include page="/inc/header_project.jsp" />
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="">Home</a></li>
			<li class="active"><a href="browse/egps/list">eGPS Browse</a></li>
			<li><s:property value="wrappedProject.project.accession" /></li>
		</ol>
		<!--  <div class="panel panel-default panel-note">
			<div class="panel-body">
				<span>NOTE:</span>This page shows the detailed information about the selected BioProject and it's related information (Sample, Experiment, Run, etc.).
			</div>
		</div>	-->
		<div class="panel panel-default">
			<s:if test="wrappedProject!=null">
				<div class="row">
					<div class="col-lg-9">
						<div class="brodet_lift1">
							<div class="row">
								<table class="table2 table2-border">
									<tr>
										<th width="160px"><s:text name="project.accession"/></th>
										<td><s:property value="wrappedProject.project.accession" /><span></span></td>
									</tr>
									<tr>
										<th><s:text name="project.title"/></th>
										<td><s:property value="wrappedProject.project.title" /></td>
									</tr>
									<s:if test="wrappedProject.fourLevels.forth != null">
										<tr>
											<th><s:text name="project.submit.general.umbrellaProject"/></th>
											<td>
												<p style="text-align:justify"><s:property value="wrappedProject.fourLevels.first.nameEn" /></p>
												<p style="text-align:justify"><s:property value="wrappedProject.fourLevels.second.nameEn" /></p>
												<p style="text-align:justify"><s:property value="wrappedProject.fourLevels.third.nameEn" /></p>
												<p style="text-align:justify"><s:property value="wrappedProject.fourLevels.forth.nameEn" /></p>
											</td>
										</tr>
									</s:if>
									<tr>
										<th><s:text name="project.dataType"/></th>
										<td>
											<s:iterator value="wrappedProject.project.dataTypes" id="dataType" status="st">
												<s:property value="#dataType.dataTypeName" />
												<s:if test="!#st.last">
													<br />
												</s:if>
											</s:iterator>
										</td>
									</tr>
									<tr>
										<th><s:text name="project.organism"/></th>
										<td>
											<s:iterator value="wrappedProject.taxons" id="taxon" status="st">
												<a	href="https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=<s:property value='#taxon.taxonId'/>" target="_blank"><s:property value="#taxon.name" /></a>
												<s:if test="!#st.last">
													<br />
												</s:if>
											</s:iterator>
										</td>
									</tr>
									<tr>
										<th><s:text name="project.description"/></th>
										<td><s:property value="wrappedProject.project.description" /></td>
									</tr>
									<tr>
										<th><s:text name="project.submit.type.sampleScope"/></th>
										<td><s:property value="wrappedProject.project.sampleScope.sampleScopeName" /></td>
									</tr>
									<tr>
										<th><s:text name="project.submit.general.releaseDate"/></th>
										<td><s:date name="wrappedProject.project.releaseTime" format="yyyy-MM-dd"/></td>
									</tr>
									<s:if test="%{wrappedProject.listPublication.size>0}">
										<tr>
											<th><s:text name="project.submit.publication"/></th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th><s:text name="project.submit.publication.pubmedId"/></th>
														<th><s:text name="project.submit.publication.articleTitle"/></th>
														<th><s:text name="project.submit.publication.journalName"/></th>
														<th><s:text name="project.submit.publication.doi"/></th>
														<th><s:text name="project.submit.publication.year"/></th>
													</tr>
													<s:iterator value="wrappedProject.listPublication" id="publication">
														<tr>
															<td><a href="https://www.ncbi.nlm.nih.gov/pubmed/<s:property value='#publication.pubmedId' />" target="_blank"><s:property value="#publication.pubmedId" /></a></td>
															<td><s:property value="#publication.articleTitle" /></td>
															<td><s:property value="#publication.journalTitle" /></td>
															<td><s:property value="#publication.doi" /></td>
															<td><s:property value="#publication.year" /></td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table>
											</td>
										</tr>
									</s:if>
									<%--<s:if test="%{wrappedProject.project.consertiumName != ''}">
										<tr>
											<th><s:text name="project.submit.general.consortium"/></th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th><s:text name="project.submit.general.consortiumName"/></th>
														<th><s:text name="project.submit.general.consortiumUrl"/></th>
													</tr>
													<tr>
														<td><s:property value="wrappedProject.project.consertiumName" /></td>
														<td><a href="<s:property value='wrappedProject.project.consertiumUrl'/>" target="_blank"><s:property value="wrappedProject.project.consertiumUrl" /></a></td>
													</tr>
												</table>
											</td>
										</tr>
									</s:if>--%>
									<s:if test="wrappedProject.listConsortium.size != 0">
										<tr>
											<th><s:text name="project.submit.general.consortium"/></th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th><s:text name="project.submit.general.consortiumName"/></th>
														<th><s:text name="project.submit.general.consortiumUrl"/></th>
													</tr>
													<s:iterator value="wrappedProject.listConsortium" id="consortiumer">
														<tr>
															<td><s:property value="#consortiumer.consortiumName"/></td>
															<td><a href='<s:property value="#consortiumer.consortiumUrl"/>' target="_blank"><s:property value="#consortiumer.consortiumUrl"/></a></td>
														</tr>
													</s:iterator>
												</table>
											</td>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.listDataProviders!=''}">
										<tr>
											<th><s:text name="project.submit.general.dataProvider"/></th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th><s:text name="project.submit.general.dataProvider"/></th>
														<th><s:text name="project.submit.general.dataProviderUrl"/></th>
													</tr>
													<s:iterator value="wrappedProject.listDataProviders" id="dataProvider">
														<tr>
															<td><s:property value="#dataProvider.providerName" /></td>
															<td><a href="<s:property value='#dataProvider.providerUrl'/>" target="_blank"><s:property value="#dataProvider.providerUrl" /></a></td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table>
											</td>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.project.biomaterialProvider != ''}">
										<tr>
											<th><s:text name="project.submit.general.biomaterialProvider"/></th>
											<td><s:property value="wrappedProject.project.biomaterialProvider" /><span></span></td>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.listGrants!=''}">
										<tr>
											<th><s:text name="project.submit.general.generalInformation"/></th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th><s:text name="project.submit.general.agency"/></th>
														<th><s:text name="project.submit.general.agencyAbbr."/></th>
														<th><s:text name="project.submit.general.grantId"/></th>
														<th><s:text name="project.submit.general.grantTitle"/></th>
													</tr>
													<s:iterator value="wrappedProject.listGrants" id="grants">
														<tr>
															<td><s:property value="#grants.agency" /></td>
															<td><s:property value="#grants.agencyAbbr" /></td>
															<td><s:property value="#grants.grantID" /></td>
															<td><s:property value="#grants.grantTitle" /></td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table>
											</td>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.listRefProjects!=''}">
										<tr>
											<th><s:text name="project.submit.general.accessionsInOtherDatabase"/></th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th><s:text name="project.submit.general.accession"/></th>
														<th><s:text name="project.submit.general.databaseName"/></th>
													</tr>
													<s:iterator value="wrappedProject.listRefProjects" id="refProject">
														<tr>
															<td><s:property value="#refProject.refAccession" />
															</td>
															<td><s:property value="#refProject.refDbName" />
															</td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table>
											</td>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.listExternalLinks != ''}">
										<tr>
											<th><s:text name="project.submit.general.externalLink"/></th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th><s:text name="project.submit.general.externalLink"/></th>
														<th><s:text name="project.submit.general.linkDescription"/></th>
													</tr>
													<s:iterator value="wrappedProject.listExternalLinks" id="externalLink">
														<tr>
															<td><a href='<s:property value="#externalLink.externalLinkUrl"/>' target="_blank"><s:property value="#externalLink.externalLinkUrl" /></a></td>
															<td><s:property value="#externalLink.description" /></td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table>
											</td>
										</tr>
									</s:if>
									<tr>
										<th><s:text name="submit.submitter"/></th>
										<td><s:property value="wrappedProject.project.submitter.firstName" />&nbsp;
											<s:property value="wrappedProject.project.submitter.middleName" />&nbsp;
											<s:property value="wrappedProject.project.submitter.lastName" />&nbsp;&nbsp;(<s:property value="wrappedProject.project.submitter.email" />)
										</td>
									</tr>
									<tr>
										<th><s:text name="project.organization"/></th>
										<td><s:property value="wrappedProject.project.submitter.organization" /></td>
									</tr>
									<tr>
										<th><s:text name="project.submissionDate"/></th>
										<td><s:date name="wrappedProject.project.createTime" format="yyyy-MM-dd"/></td>
									</tr>
								</table>
							</div>
							<h1><s:text name="project.projectData"/></h1>
							<div class="row">
								<table class="table4 table4-border">
									<tr>
										<td width="300px"><strong><s:text name="project.resourceNameCount"/></strong></td>
										<td><strong><s:text name="project.fileSize"/></strong></td>
									</tr>
									<tr>
										<td>BioSample (<s:property value="wrappedProject.sampleCount" />)</td>
										<td>-</td>
									</tr>
									<s:if test="%{wrappedProject.samples.size>0}">
										<s:iterator value="wrappedProject.samples" id="sample">
											<tr>
												<td style=" text-indent:24px">
													<s:if test="#sample.releaseState==2">
														<a href="../../biosample/browse/<s:property value='#sample.accession'/>"><s:property value="#sample.accession" /></a>
													</s:if>
													<s:else>
														<s:property value="#cra.accession" />
													</s:else>
												</td>
												<%--<td style=" text-indent:24px"><a href="../../biosample/browse/<s:property value='#sample.accession'/>"><s:property value="#sample.accession" /></a></td>--%>
												<td><s:property value="#sample.title" /></td>
											</tr>
										</s:iterator>
									</s:if>
									<tr>
										<td>GSA (<s:property value="wrappedProject.cras.size" />)</td>
										<td>-</td>
									</tr>
									<s:if test="%{wrappedProject.cras.size>0}">
										<s:iterator value="wrappedProject.cras" id="cra">
											<tr>
												<td style=" text-indent:24px">
													<s:if test="#cra.releaseState==2">
														<a href="../../gsa/browse/<s:property value='#cra.accession'/>"><s:property value="#cra.accession" /></a>
													</s:if>
													<s:else>
														<s:property value="#cra.accession" />
													</s:else>
												</td>
												<td>
													<s:property value="#cra.runFileSizeMB"/>
												</td>
											</tr>
										</s:iterator>
									</s:if>
								</table>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="brodet_right">
							<s:if test="%{wrappedProject.listRelatedProjects!=''}">
								<div class="brodet_right1 block1">
									<div class="title"><s:text name="project.relatedProjects"/></div>
									<div class="title1">
										Projects (<s:property value="wrappedProject.listRelatedProjects.size" />)
									</div>
									<s:if test="%{wrappedProject.listRelatedProjects!=''}">
										<ul>
											<s:iterator value="wrappedProject.listRelatedProjects" id="relatedProject">
												<li><a href="#"><s:property value="#relatedProject.relatedPrjAccession" /></a></li>
											</s:iterator>
										</ul>
									</s:if>
								</div>
							</s:if>
						</div>
					</div>
				</div>
			</s:if>
			<s:else>
				<div class="panel-body">No items found.</div>
			</s:else>
		</div>
	</div>
  </body>
</html>
