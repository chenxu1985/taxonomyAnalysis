<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>	
<table id="attribute_table" class="projec_table projec_table-border">
	<tbody>
		<!--  <tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.sampleName"></s:text>
			</th>
			<td>
				<s:property value="wrappedSample.sample.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.organism"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.taxon.name" />
			</td>
		</tr>-->
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.isolate"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.isolate" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.strain"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.strain" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.collectedBy"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.collectedBy" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.collectionDate"></s:text>
			</th>
			<td>
			    <s:date name="sampleAttribute.collectionDate" format="yyyy-MM-dd"></s:date>
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.geographicLocation"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.geographicLocation" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.isolationSource"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.isolationSource" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.latitudeAndLongitude"></s:text>
			</th>
			<td>
				 <s:property value="sampleAttribute.latitudeLongitude" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.cultureCollection"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cultureCollection" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.genotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.genotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.passageHistory"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.passageHistory" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.serovar"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.serovar" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.specimenVoucher"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.specimenVoucher" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.subgroup"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.subgroup" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.subtype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.subtype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenenvironmentalfoodother.addAttribute"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.addAttribute" />
			</td>
		</tr>
	</tbody>
</table>

