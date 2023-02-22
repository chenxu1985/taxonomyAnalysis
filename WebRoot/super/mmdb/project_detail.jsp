<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>NGDC - BioProject</title>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
			<meta http-equiv="keywords" content="BioProject,GSA">
				<meta http-equiv="description" content="BioProject Detail">
					<jsp:include page="/inc/css_js.jsp" />
</head>
<body>
	<jsp:include page="/inc/header_project.jsp" />
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="">Home</a></li>
			<li class="active"><a href="browse/">Browse</a>
			</li>
			<li><s:property value="wrappedProject.project.accession" />
			</li>
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
										<th width="160px">Identifier</th>
										<td><s:property value="wrappedProject.project.accession" /><span></span>
										</td>
									</tr>
									<tr>
										<th>Title</th>
										<td><s:property value="wrappedProject.project.title" />
										</td>
									</tr>
									<s:if test="wrappedProject.fourLevels.forth != null">
										<tr>
											<th>Umbrella project</th>
											<td>
												<p style="text-align:justify">
													<s:property value="wrappedProject.fourLevels.first.nameEn" />
												</p>
												<p style="text-align:justify">
													<s:property value="wrappedProject.fourLevels.second.nameEn" />
												</p>
												<p style="text-align:justify">
													<s:property value="wrappedProject.fourLevels.third.nameEn" />
												</p>
												<p style="text-align:justify">
													<s:property value="wrappedProject.fourLevels.forth.nameEn" />
												</p></td>
										</tr>
									</s:if>
									<tr>
										<th>Project data type</th>
										<td><s:iterator value="wrappedProject.project.dataTypes"
												id="dataType" status="st">
												<s:property value="#dataType.dataTypeName" />
												<s:if test="!#st.last">
													<br />
												</s:if>
											</s:iterator></td>
									</tr>
									<tr>
										<th>Organism</th>
										<td><s:iterator value="wrappedProject.taxons" id="taxon"
												status="st">
												<a
													href="https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=<s:property value='#taxon.taxonId'/>"
													target="_blank"><s:property value="#taxon.name" />
												</a>
												<s:if test="!#st.last">
													<br />
												</s:if>
											</s:iterator></td>
									</tr>
									<tr>
										<th>Description</th>
										<td><s:property
												value="wrappedProject.project.description" />
										</td>
									</tr>
									<tr>
										<th>Sample scope</th>
										<td><s:property
												value="wrappedProject.project.sampleScope.sampleScopeName" />
										</td>
									</tr>
									<tr>
										<th>Release date</th>
										<td><s:date name="wrappedProject.project.releaseTime"
												format="yyyy-MM-dd"></s:date>
										</td>
									</tr>
									<s:if test="%{wrappedProject.listPublication.size>0}">
										<tr>
											<th>Publication</th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th>PubMed ID</th>
														<th>Title</th>
														<th>Journal</th>
														<th>Doi</th>
														<th>Year</th>

													</tr>
													<s:iterator value="wrappedProject.listPublication"
														id="publication">
														<tr>
															<td><a href="https://www.ncbi.nlm.nih.gov/pubmed/<s:property value='#publication.pubmedId' />" target="_blank"><s:property value="#publication.pubmedId" /></a>
															</td>
															<td><s:property value="#publication.articleTitle" />
															</td>
															<td><s:property value="#publication.journalTitle" />
															</td>
															<td><s:property value="#publication.doi" />
															</td>
															<td><s:property value="#publication.year" />
															</td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table></td>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.project.consertiumName != ''}">
										<tr>
											<th>Consortium</th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th>Consoutium</th>
														<th>URL</th>
													</tr>
													<tr>
														<td><s:property
																value="wrappedProject.project.consertiumName" />
														</td>
														<td><a
															href="<s:property value='wrappedProject.project.consertiumUrl'/>"
															target="_blank"><s:property
																	value="wrappedProject.project.consertiumUrl" />
														</a>
														</td>
													</tr>
												</table>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.listDataProviders!=''}">
										<tr>
											<th>Data Provider</th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th>Data provider</th>
														<th>Data provider URL</th>
													</tr>
													<s:iterator value="wrappedProject.listDataProviders"
														id="dataProvider">
														<tr>
															<td><s:property value="#dataProvider.providerName" />
															</td>
															<td><a
																href="<s:property value='#dataProvider.providerUrl'/>"
																target="_blank"><s:property
																		value="#dataProvider.providerUrl" />
															</a>
															</td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table></td>
										</tr>
									</s:if>
									<s:if
										test="%{wrappedProject.project.biomaterialProvider != ''}">
										<tr>
											<th>Biomaterial Provider</th>
											<td><s:property
													value="wrappedProject.project.project.biomaterialProvider" /><span></span>
											</td>
										</tr>
									</s:if>

									<s:if test="%{wrappedProject.listGrants!=''}">
										<tr>
											<th>Grants</th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th>Agency</th>
														<th>Agency abbr.</th>
														<th>Grants ID</th>
														<th>Title</th>
													</tr>
													<s:iterator value="wrappedProject.listGrants" id="grants">
														<tr>
															<td><s:property value="#grants.agency" />
															</td>
															<td><s:property value="#grants.agencyAbbr" />
															</td>
															<td><s:property value="#grants.grantID" />
															</td>
															<td><s:property value="#grants.grantTitle" />
															</td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table></td>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.listRefProjects!=''}">
										<tr>
											<th>Accessions in other database</th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th>Accession</th>
														<th>Database</th>
													</tr>
													<s:iterator value="wrappedProject.listRefProjects"
														id="refProject">
														<tr>
															<td><s:property value="#refProject.refAccession" />
															</td>
															<td><s:property value="#refProject.refDbName" />
															</td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table></td>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.listExternalLinks != ''}">
										<tr>
											<th>External link</th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th>URL</th>
														<th>Description</th>
													</tr>
													<s:iterator value="wrappedProject.listExternalLinks"
														id="externalLink">
														<tr>
															<td><a
																href='<s:property value="#externalLink.externalLinkUrl"/>'
																target="_blank"><s:property
																		value="#externalLink.externalLinkUrl" />
															</a>
															</td>
															<td><s:property value="#externalLink.description" />
															</td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table></td>
										</tr>
									</s:if>
									<tr>
										<th>Submitter</th>
										<td>
<s:property
															value="wrappedProject.project.submitter.firstName" />&nbsp;<s:property
															value="wrappedProject.project.submitter.middleName" />&nbsp;<s:property
															value="wrappedProject.project.submitter.lastName" />&nbsp;&nbsp;(<s:property
															value="wrappedProject.project.submitter.email" />)</td>
													<!-- 			  	<tr>
			  		<td>
			  			<s:property value="wrappedProject.project.submitter.email"/>
			  		</td>
			  	</tr> -->
</td>
									</tr>
									<tr>
										<th>Affiliation</th>
										<td><s:property
												value="wrappedProject.project.submitter.organization" />
										</td>
									</tr>
									<tr>
										<th>Submission date</th>
										<td><s:date name="wrappedProject.project.createTime"
												format="yyyy-MM-dd"></s:date>
										</td>
									</tr>

								</table>
							</div>
							<h1>Project Data</h1>
							<div class="row">
								<table class="table4 table4-border">
									<tr>
										<th width="300px">Resource name</th>
										<th>Description</th>
									</tr>
									<tr>
										<td>BioSample (<s:property
												value="wrappedProject.samples.size" />)</td>
										<td>-</td>
									</tr>
									<s:if test="%{wrappedProject.samples.size>0}">
										<s:iterator value="wrappedProject.samples" id="sample">
											<tr>
												<td style=" text-indent:24px"><a
													href="../../biosample/browse/<s:property value='#sample.accession'/>"><s:property
															value="#sample.accession" />
												</a>
												</td>
												<td><s:property value="#sample.title" />
												</td>
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
												<td style=" text-indent:24px"><a
													href="../../gsa/browse/<s:property value='#cra.accession'/>"><s:property
															value="#cra.accession" />
												</a>
												</td>
												<td><s:property value="#cra.accession" />
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
								<div class="title">Related Projects</div>
								<div class="title1">
									Projects (
									<s:property value="wrappedProject.listRelatedProjects.size" />
									)
								</div>
								<s:if test="%{wrappedProject.listRelatedProjects!=''}">
									<ul>
										<s:iterator value="wrappedProject.listRelatedProjects"
											id="relatedProject">
											<li><a href="#"><s:property
														value="#relatedProject.relatedPrjAccession" />
											</a>
											</li>
										</s:iterator>
									</ul>
								</s:if>
							</div>
							</s:if>
						</div>
					</div>
			</s:if>
			<s:else>
				<div class="panel-body">No items found.</div>
			</s:else>
		</div>
	</div>
	</div>

</body>
</html>