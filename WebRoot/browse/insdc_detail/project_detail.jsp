<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
	<title>Browse - BioProject - CNCB-NGDC</title>
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
			<li class="active"><a href="browse/">Browse</a></li>
			<li><s:property value="projectInsdc.second_accession" /></li>
		</ol>
		<div class="panel panel-default">
			<div class="row">
				<div class="col-lg-11">

						<div class="brodet_lift1">
							<div class="row">
								<table class="table2 table2-border">
									<tr>
										<th width="160px"><s:text name="project.accession"/></th>
										<td><s:property value="projectInsdc.second_accession"/></td>
									</tr>
									<tr>
										<th><s:text name="project.title"/></th>
										<td><s:property value="projectInsdc.title" /></td>
									</tr>
									<s:if test="projectInsdc.relevance!=null&&projectInsdc.relevance!=''">
										<tr>
											<th><s:text name="project.relevance"/></th>
											<td><s:property value="projectInsdc.relevance" /></td>
										</tr>
									</s:if>
									<tr>
										<th><s:text name="project.dataType"/></th>
										<td><s:property value="projectInsdc.data_type_name" /></td>
									</tr>
									<tr>
										<th><s:text name="project.submit.type.sampleScope"/></th>
										<td><s:property value="projectInsdc.sample_scope_name" /></td>
									</tr>
									<s:if test="projectInsdc.organism.size>0">
										<tr>
											<th><s:text name="sample.organism"/></th>
											<td>
												<s:iterator value="projectInsdc.organism" var="attr">
												<a href="https://www.ncbi.nlm.nih.gov/taxonomy/<s:property value="key"/>" target="_blank"><s:property value="value"/></a>&nbsp;[Taxonomy ID: <s:property value="key"/>]
												</s:iterator>
											</td>
										</tr>
									</s:if>
									<tr>
										<th><s:text name="project.description"/></th>
										<td><s:property value="projectInsdc.description" escape="false"/></td>
									</tr>
									<s:if test="%{publicationInsdcs.size>0}">
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
													<s:iterator value="publicationInsdcs" id="publication">
														<tr>
															<td><a href="https://www.ncbi.nlm.nih.gov/pubmed/<s:property value='#publication.pubmed_id' />" target="_blank"><s:property value="#publication.pubmed_id" /></a>
															</td>
															<td><s:property value="#publication.article_title" />
															</td>
															<td><s:property value="#publication.journal_title" />
															</td>
															<s:if test="#publication.doi!=null">
																<td><a href="https://doi.org/<s:property value="#publication.doi" />" target="_blank"><s:property value="#publication.doi" /></a>
																</td>
															</s:if>
															<s:else>
																<td><s:property value="#publication.doi" />
																</td>
															</s:else>
															<td><s:property value="#publication.year" />
															</td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table>
											</td>
										</tr>
									</s:if>
									<s:if test="%{externalLinkInsdcs.size>0}">
										<tr>
											<th><s:text name="project.submit.general.externalLink"/></th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<%--<th><s:text name="project.submit.general.externalLink"/></th>--%>
														<th><s:text name="project.submit.general.linkDescription"/></th>
													</tr>
														<tr>
															<td>
																<s:iterator value="externalLinkInsdcs" id="externalLink" status="st">
																	<a href='<s:property value="#externalLink.external_link_url"/>' target="_blank"><s:property value="#externalLink.description" /></a>
																	<s:if test="!#st.last">
																		<br />
																	</s:if>
																</s:iterator>
															</td>
														</tr>
													<tr></tr>
												</table>
											</td>
										</tr>
									</s:if>
									<s:if test="projectInsdc.release_flag!=0">
									<tr>
										<th><s:text name="project.submit.general.releaseDate"/></th>
										<td><s:date name="projectInsdc.release_time" format="yyyy-MM-dd"/></td>
									</tr>
									</s:if>
									<s:if test="projectInsdc.organization!=null&&projectInsdc.organization!=''">
										<tr>
											<th><s:text name="project.organization"/></th>
											<td><s:property value="projectInsdc.organization" /></td>
										</tr>
									</s:if>
									<tr>
										<th><s:text name="project.dataSource"/></th>
										<td>NCBI</td>
									</tr>
								</table>
							</div>
							<h1><s:text name="project.projectData"/></h1>
							<div class="row">
								<table class="table4 table4-border" id="gwh">
									<tr>
										<th width="300px"><s:text name="project.resourceName"/></th>
										<th><s:text name="project.decription"/></th>
									</tr>
									<s:if test="%{experimentInsdcs.size>0}">
										<tr>
											<s:if test="%{experimentInsdcs.size>5}">
												<td>Experiment (<s:property value="experimentInsdcs.size" />)&nbsp;&nbsp;<a href="javascript:void(0)" onclick="openExp('exp_open')" id="option_exp">show</a></td>
											</s:if>
											<s:else>
												<td>Experiment (<s:property value="experimentInsdcs.size" />)</td>
											</s:else>
											<td>-</td>
										</tr>
										<s:iterator value="experimentInsdcs" id="exp" status="status">
											<s:if test="%{experimentInsdcs.size>5}">
												<tr style="display: none" id="exp_open_<s:property value="#status.index" />">
											</s:if>
											<s:else>
												<tr style="display: table-row" id="exp_open_<s:property value="#status.index" />">
											</s:else>
											<td style=" text-indent:24px"><a href="../gsa/browse/insdc/<s:property value='#exp.submission_second_accession'/>/<s:property value='#exp.second_accession'/>"><s:property value="#exp.second_accession" /></a></td>
											<td><s:property value="#exp.title" /></td>
											</tr>
										</s:iterator>
									</s:if>
								</table>
							</div>
						</div>
				</div>
		</div>

	</div>
</div>
		<script type="text/javascript">
			function openExp(id){
				var option_exp = $("#option_exp").html();
				if(option_exp=='show'){
					$("tr[id^="+id+"]").css("display","table-row");
					$("#option_exp").html("hide");
				} else if(option_exp=='hide'){
					$("tr[id^="+id+"]").css("display","none");
					$("#option_exp").html("show");
				}
			}
		</script>
</body>
</html>