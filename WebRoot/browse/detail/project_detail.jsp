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
			<li><s:property value="wrappedProject.project.accession" /></li>
		</ol>
		<div class="panel panel-default">
			<s:if test="wrappedProject!=null">
				<div class="row">
					<s:if test="%{wrappedProject.listGrants.size>0}">
					<div class="col-lg-11">
						</s:if>
							<s:if test="%{wrappedProject.listGrants.size==0}">
							<div class="col-lg-9">
								</s:if>
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
									<tr>
										<th><s:text name="project.relevance"/></th>
										<td><s:property value="wrappedProject.project.relevance" /></td>
									</tr>
									<s:if test="wrappedProject.fourLevels.forth != null">
										<tr>
											<th><s:text name="project.submit.general.umbrellaProject"/></th>
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
												</p>
											</td>
										</tr>
									</s:if>
									<tr>
										<th><s:text name="project.dataType"/></th>
										<td><s:iterator value="wrappedProject.project.dataTypes" id="dataType" status="st">
												<s:property value="#dataType.dataTypeName" />
												<s:if test="!#st.last">
													<br />
												</s:if>
											</s:iterator>
										</td>
									</tr>
									<tr>
										<th><s:text name="project.organism"/></th>
										<td><s:iterator value="wrappedProject.taxons" id="taxon" status="st">
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
															<td><a href="https://www.ncbi.nlm.nih.gov/pubmed/<s:property value='#publication.pubmedId' />" target="_blank"><s:property value="#publication.pubmedId" /></a>
															</td>
															<td><s:property value="#publication.articleTitle" escape="false"/>
															</td>
															<td><s:property value="#publication.journalTitle" />
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
									<s:if test="wrappedProject.listConsortium.size,size>0">
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
									<s:if test="%{wrappedProject.listDataProviders.size>0}">
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
															<td><s:property value="#dataProvider.providerName" escape="false"/></td>
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
									<s:if test="%{wrappedProject.listGrants.size>0}">
										<tr>
											<th><s:text name="project.submit.general.grants"/></th>
											<td>
												<table class="projec_table projec_table-border">
													<tr>
														<th><s:text name="project.submit.general.agency"/></th>
														<th><s:text name="project.submit.general.program."/></th>
														<th><s:text name="project.submit.general.grantId"/></th>
														<th><s:text name="project.submit.general.grantTitle"/></th>
													</tr>
													<s:iterator value="wrappedProject.listGrants" id="grants">
														<tr>
															<td><s:property value="#grants.agency" />
															</td>
															<td><s:property value="#grants.program" />
															</td>
															<td><s:property value="#grants.grantID" />
															</td>
															<td><s:property value="#grants.grantTitle" />
															</td>
														</tr>
													</s:iterator>
													<tr></tr>
												</table>
											</td>
										</tr>
									</s:if>
									<s:if test="%{wrappedProject.listRefProjects.size>0}">
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
									<s:if test="%{wrappedProject.listExternalLinks.size>0}">
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
										<s:if test="wrappedProject.project.user.userId==131||wrappedProject.project.user.userId==2034||wrappedProject.project.user.userId==2930">
										<tr><th><s:text name="submit.submitter"/></th><td>This record was originated from NCBI and submitted by NGDC.</td></tr>
									</s:if>
									<s:else>
										<th><s:text name="submit.submitter"/></th>
										<td><s:property value="wrappedProject.project.submitter.firstName" />&nbsp;
											<s:property value="wrappedProject.project.submitter.middleName" />&nbsp;
											<s:property value="wrappedProject.project.submitter.lastName" />&nbsp;&nbsp;(<s:property value="wrappedProject.project.submitter.email" />)
										</td>
									</s:else>
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
								<table class="table4 table4-border" id="gwh">
									<tr>
										<th width="300px"><s:text name="project.resourceName"/></th>
										<th><s:text name="project.decription"/></th>
									</tr>
									<s:if test="%{wrappedProject.samples.size>0}">
									<tr>
										<s:if test="%{wrappedProject.samples.size>5}">
											<td>BioSample (<s:property value="wrappedProject.samples.size" />)&nbsp;&nbsp;<a href="javascript:void(0)" onclick="openSample('sample_open')" id="option_sample">show</a></td>
										</s:if>
										<s:else>
											<td>BioSample (<s:property value="wrappedProject.samples.size" />)</td>
										</s:else>
										<td>-</td>
									</tr>
										<s:iterator value="wrappedProject.samples" id="sample" status="status">
											<s:if test="%{wrappedProject.samples.size>5}">
												<tr style="display: none" id="sample_open_<s:property value="#status.index" />">
											</s:if>
											<s:else>
												<tr style="display: table-row" id="sample_open_<s:property value="#status.index" />">
											</s:else>
												<td style=" text-indent:24px"><a href="../../biosample/browse/<s:property value='#sample.accession'/>"><s:property value="#sample.accession" /></a></td>
												<td><s:property value="#sample.title" /></td>
											</tr>
										</s:iterator>
									</s:if>
									<s:if test="%{wrappedProject.cras.size>0}">
									<tr>
										<s:if test="%{wrappedProject.cras.size>5}">
										<td>GSA (<s:property value="wrappedProject.cras.size" />)&nbsp;&nbsp;<a href="javascript:void(0)" onclick="openCra('cra_open')" id="option_cra">show</a></td>
										</s:if>
										<s:else>
											<td>GSA (<s:property value="wrappedProject.cras.size" />)</td>
										</s:else>
										<td>-</td>
									</tr>
										<s:iterator value="wrappedProject.cras" id="cra" status="status">
											<s:if test="%{wrappedProject.cras.size>5}">
												<tr style="display: none" id="cra_open_<s:property value="#status.index" />">
											</s:if>
											<s:else>
												<tr style="display: table-row" id="cra_open_<s:property value="#status.index" />">
											</s:else>
												<td style=" text-indent:24px"><a href="../../gsa/browse/<s:property value='#cra.accession'/>"><s:property value="#cra.accession" /></a></td>
												<td><s:property value="#cra.title" /></td>
											</tr>
										</s:iterator>
									</s:if>
								</table>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="brodet_right">
						<s:if test="%{wrappedProject.listRelatedProjects.size>0}">
							<div class="brodet_right1 block1">
								<div class="title"><s:text name="project.relatedProjects"/></div>
								<div class="title1">
									Projects (<s:property value="wrappedProject.listRelatedProjects.size" />)
								</div>
								<s:if test="%{wrappedProject.listRelatedProjects.size>0}">
									<ul>
										<s:iterator value="wrappedProject.listRelatedProjects" id="relatedProject">
											<li><a href="browse/<s:property value="#relatedProject.relatedPrjAccession" />"><s:property value="#relatedProject.relatedPrjAccession" /></a></li>
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
		<script type="text/javascript">
            $(function(){
                var prj_id = "<s:property value="wrappedProject.project.accession"/>";
                $.ajax({
                    url: "https://ngdc.cncb.ac.cn/gwh/gsa/ajax/getAssembliesListByBioProjectAccession/"+prj_id,
                    dataType: "json",
                    async: false,
                    data: {

                    },
                    success: function(data) {
                        var count = data.count;
                        //document.getElementById("gwh_size").innerText="GWH ("+count+")";
                        if(count!=0) {
                            var allhtml ;
							var gwhhtml = document.getElementById("gwh").innerHTML;
							var htmltitle;
							if(count>5){
								htmltitle = '<tr><td>GWH ('+count+')&nbsp;&nbsp;<a href="javascript:void(0)" onclick="openGwh(\'gwh_open\')" id="option_gwh">show</a></td><td>-</td></tr>';
							} else {
								htmltitle = '<tr><td>GWH ('+count+')</td><td>-</td></tr>';
							}
							gwhhtml = gwhhtml + htmltitle;
                            data.assembliesList.forEach(function(map,index){
                                var html ;
                                var hyperlink= map['hyperlink'];
                                var accession = map['accession'];
                                var description = map['description'];
                                if(count>5){
									html = '<tr style="display: none" id="gwh_open_'+index+'">';
								} else {
									html = '<tr style="display: table-row" id="gwh_open_'+index+'">';
								}
                                if(description==null) {
                                    html=html + '<td style="text-indent:24px"><a href="'+hyperlink+'">'+accession+'</a></td><td></td></tr>';
                                } else {
                                    html=html +'<td style="text-indent:24px"><a href="'+hyperlink+'">'+accession+'</a></td><td>'+description+'</td></tr>';
                                }
                                if(gwhhtml=='') {
                                    gwhhtml = html;
									allhtml = gwhhtml;
                                    //alert(gwhhtml);
                                } else {
									gwhhtml = gwhhtml +html;
                                    allhtml = gwhhtml;
                                }
								document.getElementById("gwh").innerHTML=allhtml;
                            });
                            //alert(allhtml);

                        }

                        //alert(database);
                        return count;
                    }
                });
				$.ajax({
					url: "https://ngdc.cncb.ac.cn/gsa-human/hra/getAjax/searchByPrjAccession?prjAccession="+prj_id,
					dataType: "json",
					async: false,
					data: {

					},
					success: function(data) {
						var count = data.totalCount;
						if(count!=0) {
							var allhtml ;
							var gwhhtml = document.getElementById("gwh").innerHTML;
							var htmltitle = '<tr><td>GSA-Human ('+count+')</td><td>-</td></tr>';
							gwhhtml = gwhhtml + htmltitle;
							data.listHras.forEach(function(map){
								var html ;
								var accession = map['accession'];
								var alias = map['title'];
								var hyperlink = "https://ngdc.cncb.ac.cn/gsa-human/browse/"+accession;
								if(alias==null) {
									html='<tr><td style="text-indent:24px"><a href="'+hyperlink+'">'+accession+'</a></td><td></td></tr>';
								} else {
									html='<tr><td style="text-indent:24px"><a href="'+hyperlink+'">'+accession+'</a></td><td>'+alias+'</td></tr>';
								}
								if(gwhhtml=='') {
									gwhhtml = html;
									allhtml = gwhhtml;
									//alert(gwhhtml);
								} else {
									gwhhtml = gwhhtml + html;
									allhtml = gwhhtml;
								}
								document.getElementById("gwh").innerHTML=allhtml;
							});
							//alert(allhtml);

						}

						//alert(database);
						return count;
					}
				});
				//GVM
				$.ajax({
					url: "https://ngdc.cncb.ac.cn/gvm/gsa/getVariationListByBioProjectAccession/"+prj_id,
					dataType: "json",
					async: false,
					data: {

					},
					success: function(data) {
						var count=0
						if(data!=null) {
							count = data.count;
						}
						//document.getElementById("gwh_size").innerText="GWH ("+count+")";
						if(count!=0) {
							var allhtml ;
							var gvmhtml = document.getElementById("gwh").innerHTML;
							var htmltitle = '<tr><td>GVM ('+count+')</td><td>-</td></tr>';
							gvmhtml = gvmhtml + htmltitle;
							data.variationList.forEach(function(map){
								var html ;
								var hyperlink= map['hyperlink'];
								var accession = map['accession'];
								var description = map['description'];
								if(description==null) {
									html='<tr><td style="text-indent:24px"><a href="'+hyperlink+'">'+accession+'</a></td><td></td></tr>';
								} else {
									html='<tr><td style="text-indent:24px"><a href="'+hyperlink+'">'+accession+'</a></td><td>'+description+'</td></tr>';
								}
								if(gvmhtml=='') {
									gvmhtml = html;
									allhtml = gvmhtml;
									//alert(gwhhtml);
								} else {
									gvmhtml = gvmhtml+html;
									allhtml = gvmhtml;
								}
								document.getElementById("gwh").innerHTML=allhtml;
							});
							//alert(allhtml);

						}

						//alert(database);
						return count;
					}
				});
				//omix
				$.ajax({
					url: "https://ngdc.cncb.ac.cn/omix/searchByPrjAccession?prjAccession="+prj_id,
					dataType: "json",
					async: false,
					data: {

					},
					success: function(data) {
						var count = data.totalCount;
						//document.getElementById("gwh_size").innerText="GWH ("+count+")";
						if(count!=0) {
							var allhtml ;
							var gwhhtml = document.getElementById("gwh").innerHTML;
							var htmltitle = '<tr><td>OMix ('+count+')</td><td>-</td></tr>';
							gwhhtml = gwhhtml + htmltitle;
							data.listOmix.forEach(function(map){
								var html ;
								var accession = map['accession'];
								var alias = map['title'];
								var hyperlink = map['url'];
								if(alias==null) {
									html='<tr><td style="text-indent:24px"><a href="'+hyperlink+'">'+accession+'</a></td><td></td></tr>';
								} else {
									html='<tr><td style="text-indent:24px"><a href="'+hyperlink+'">'+accession+'</a></td><td>'+alias+'</td></tr>';
								}
								if(gwhhtml=='') {
									gwhhtml = html;
									allhtml = gwhhtml;
									//alert(gwhhtml);
								} else {
									gwhhtml = gwhhtml + html;
									allhtml = gwhhtml;
								}
								document.getElementById("gwh").innerHTML=allhtml;
							});
							//alert(allhtml);

						}

						//alert(database);
						return count;
					}
				});
            });

            function openSample(id){
            	var option_sample = $("#option_sample").html();
            	if(option_sample=='show'){
					$("tr[id^="+id+"]").css("display","table-row");
					$("#option_sample").html("hide");
				} else if(option_sample=='hide'){
					$("tr[id^="+id+"]").css("display","none");
					$("#option_sample").html("show");
				}
			}
			function openCra(id){
				var option_cra = $("#option_cra").html();
				if(option_cra=='show'){
					$("tr[id^="+id+"]").css("display","table-row");
					$("#option_cra").html("hide");
				} else if(option_cra=='hide'){
					$("tr[id^="+id+"]").css("display","none");
					$("#option_cra").html("show");
				}
			}
			function openGwh(id){
				var option_gwh = $("#option_gwh").html();
				if(option_gwh=='show'){
					$("tr[id^="+id+"]").css("display","table-row");
					$("#option_gwh").html("hide");
				} else if(option_gwh=='hide'){
					$("tr[id^="+id+"]").css("display","none");
					$("#option_gwh").html("show");
				}
			}
		</script>
</body>
</html>