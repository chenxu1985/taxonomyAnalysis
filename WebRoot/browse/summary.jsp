<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Statistics - BioProject - CNCB-NGDC</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="Summary, GSA">
	<meta http-equiv="description" content="Summary">
	<jsp:include page="/inc/css_js.jsp"/>
  </head>
  <body>
    <jsp:include page="/inc/header_project.jsp"/>
    <div class="container">
    	<ol class="breadcrumb">
		  <li><a href="">Home</a></li>
		  <li class="active">Statistics</li>
		</ol>
		<div class="panel panel-default panel-info">
		<div class="panel-heading"><s:text name="project.totalHoldings"/></div>
		<div class="panel-body">
                	<table class="table table-striped table-bordered" width="900px">
                    	<tbody>
                        	<tr>
                        		<th width="220"><s:text name="project.totalHoldings"/></th>
                            	<th width="220"><s:text name="project.releasedProjects"/></th>
                              	<th width="220"><s:text name="project.confidentialProjects"/></th>
                          </tr>
                          	<tr>
                          		<td><s:property value="summary.projectCount"/></td>
                            	<td><a href="browse/?totalCount=<s:property value='summary.releasedProjectCount'/>&titleValue=<s:property value='summary.releasedProjectCount'/>"><s:property value="summary.releasedProjectCount"/></a></td>
                                <td><s:property value="summary.privateProjectCount" /></td>
                            </tr>
                        </tbody>
                    </table>
			</div>
			</div>
<s:if test="%{summary.agencyCountByAgency.size()!=0}">
        <div class="panel panel-default panel-info">
            <div class="panel-heading"><s:text name="project.totalAgency"/></div>
            <div class="panel-body">
                <table class="table table-striped table-bordered" width="900px">
                    <tbody>
                    <tr>
                        <th width="220"><s:text name="project.agencies"/></th>
                        <th width="220"><s:text name="project.projects"/></th>
                    </tr>
					<s:iterator value="summary.agencyCountByAgency" id="agency">
						<tr>
							<td>
								<s:property value="#agency.key"/>
							</td>
							<td>
								<a href="browse/?agency=<s:property value='#agency.value'/>&totalCount=<s:property value='#agency.value'/>&titleValue=<s:property value='#agency.key'/>"><s:property value="#agency.value"/></a>
							</td>
						</tr>
					</s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
</s:if>
			<div class="panel panel-default panel-info">
			<div class="panel-heading"><s:text name="project.submit.type.projectDataType"/></div>
			<div class="panel-body">
				   <table class="table table-striped table-bordered" width="900px">
                    	<tbody>
                        	<tr>
                           	  <th width="175"><s:text name="project.dataType"/></th>
                           	  <th width="175"><s:text name="project.projects"/></th>
                          </tr>
                          <s:iterator value="summary.projectDataTypes" id="dataType">
                          <tr>
                            	<td>
                            		<s:property value="#dataType.value"/>
                            	</td>
                            	<td>
									<s:if test="#dataType.value!='other'">
                            			<a href="browse/?dataType=<s:property value='#dataType.key'/>&totalCount=<s:property value='summary.projectCountByProjectDataType[#dataType.value]'/>&titleValue=<s:property value='#dataType.value'/>"><s:property value="summary.projectCountByProjectDataType[#dataType.value]"/></a>
									</s:if>
									<s:else>
										<s:property value="summary.projectCountByProjectDataType[#dataType.value]"/>
									</s:else>
								</td>
                            </tr>
                            </s:iterator>
                        </tbody>
                    </table>
			</div>
			</div>
			<div class="panel panel-default panel-info">
			<div class="panel-heading"><s:text name="project.organisms"/></div>
			<div class="panel-body">
				<table class="table table-striped table-bordered" width="900px">
                    	<tbody>
                        	<tr>
                        	 <th width="175"><s:text name="project.organism"/></th>
                           	  <th width="175"><s:text name="project.projects"/></th>
                          </tr>
                           <s:iterator value="summary.organisms" id="organism">
                           <s:if test="%{summary.projectCountByOrganism[#organism.value]!=null}">
                          <tr>
                            	<td style="font-style: italic">
                            		<s:if test="%{#organism.value==''}">
                            			Unknown
                            		</s:if>
                            		<s:else>
                            		<s:property value="#organism.value"/>
                            		</s:else>
                            	</td>
                            	<td>
									<a href="browse/?tax=<s:property value='#organism.key'/>&totalCount=<s:property value='summary.projectCountByOrganism[#organism.value]'/>&titleValue=<s:property value='#organism.value'/>"><s:property value="summary.projectCountByOrganism[#organism.value]"/></a>
                            	</td>
                            </tr>
                            </s:if>
                          </s:iterator>
                        </tbody>
                    </table>
			</div>
			</div>
    </div>

  </body>
</html>
