<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
	<table id="attribute_table" class="projec_table projec_table-border">
	<tbody>
		<!-- <tr>
			<th width="240px">
				<s:text name="sample.submit.attr.microbe.sampleName"></s:text>
			</th>
			<td>
				<s:property value="wrappedSample.sample.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.organism"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.taxon.name" />
			</td>
		</tr>-->	
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.strain"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.strain" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.isolationSource"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.isolationSource" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.collectionDate"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.geographicLocation" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.geographicLocation"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.geographicLocation" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.altitude"></s:text>	
			</th>
			<td>
				<s:property value="sampleAttribute.altitude" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.biomaterialProvider"></s:text>	
			</th>
			<td>
				<s:property value="sampleAttribute.biomaterialProvider" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.collectedBy"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.collectedBy" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.cultureCollection"></s:text>		
			</th>
			<td>
				<s:property value="sampleAttribute.cultureCollection" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.depth"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.depth" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.environmentBiome"></s:text>		
			</th>
			<td>
				<s:property value="sampleAttribute.environmentBiome" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.genotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.genotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.host"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostTaxon.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.hostTissueSampled"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostTissueSampled" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.identifiedBy"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.identifiedBy" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.labHost"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.labHost" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.latitudeAndLongitude"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.latitudeLongitude" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.matingType"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.matingType" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.passageHistory"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.passageHistory" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.sampleSize"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.sampleSize" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.serotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.serotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.serovar"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.serovar" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.specimenVoucher"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.specimenVoucher" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.microbe.temperature"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.temperature" />
			</td>
		</tr>
</tbody>
</table>
