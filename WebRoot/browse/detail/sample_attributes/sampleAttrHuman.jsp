<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<table id="attribute_table" class="projec_table projec_table-border">
	<tbody>
		<!--  <tr>
			<th width="240px">
				<s:text name="sample.submit.attr.human.sampleName"/>
			</th>
			<td>
				<s:property value="wrappedSample.sample.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.organism"/>
			</th>
			<td>
				<s:property value="sampleAttribute.taxon.name" />
			</td>
		</tr>-->
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.isolate"></s:text>
			</td>
			<th>
				<s:property value="sampleAttribute.isolate" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.age"></s:text>
			</th>
			<td>
					<s:if test="sampleAttribute.age != null && sampleAttribute.age != ''">
						<s:property value="sampleAttribute.age" /> <s:property value="sampleAttribute.ageUnit" />(s)
					</s:if>
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.biomaterialProvider"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.biomaterialProvider" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.sex"></s:text>
			</th>
			<td>
				  	<s:set var="sex" value="sampleAttribute.sex"/>
  					<s:if test="#sex==1">male</s:if>
  					<s:elseif test="#sex==2">female</s:elseif>
  					<s:elseif test="#sex==3">neuter</s:elseif>
  					<s:elseif test="#sex==4">hermaphrodite</s:elseif>
  					<s:else>not applicable</s:else> 
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.tissue"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.tissue" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.disease"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.disease" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.cellLine"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cellLine" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.cellSubtype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cellSubtype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.cellType"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cellType" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.cultureCollection"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cultureCollection" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.developmentStage"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.devStage" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.diseaseStage"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.diseaseStage" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.ethnicity"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.ethnicity" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.healthState"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.healthState" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.karyotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.karyotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.phenotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.phenotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.population"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.population" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.race"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.race" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.type"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.type" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.human.treatment"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.treatment" />
			</td>
		</tr>
	</tbody>
</table>
