<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<table id="attribute_table" class="projec_table projec_table-border">
	<tbody>
		<!--  <tr>
			<th>
				<s:text name="sample.submit.attr.plant.sampleName"></s:text>
			</th>
			<td>
				<s:property value="wrappedSample.sample.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.organism"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.taxon.name" />
			</td>
		</tr>-->
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.cultivar"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cultivar" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.biomaterialProvider"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.biomaterialProvider" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.tissue"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.tissue" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.age"></s:text>
			</th>
			<td>
				<s:if test="sampleAttribute.age != null && sampleAttribute.age != ''">
					<s:property value="sampleAttribute.age" /> <s:property value="sampleAttribute.ageUnit" />(s)
				</s:if>
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.cellLine"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cellLine" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.cellType"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cellType" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.collectedBy"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.collectedBy" />
			</td>
		</tr>

		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.collectionDate"></s:text>
			</th>
			<td>
				<s:date name="sampleAttribute.collectionDate" format="yyyy-MM-dd"></s:date>
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.cultureCollection"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cultureCollection" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.developmentStage"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.developmentStage" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.disease"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.disease" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.diseaseStage"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.diseaseStage" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.genotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.genotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.growthProtocol"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.growthProtocol" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.heightOrLength"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.heightLength" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.isolationSource"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.isolationSource" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.latitudeAndLongitude"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.latitudeLongitude" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.phenotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.phenotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.population"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.population" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.type"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.type" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.sex"></s:text>
			</th>
			<td>
				<s:property value="sex" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.specimenVoucher"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.specimenVoucher" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.temperature"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.temperature" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.plant.treatment"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.treatment" />
			</td>
		</tr>
	</tbody>
</table>

