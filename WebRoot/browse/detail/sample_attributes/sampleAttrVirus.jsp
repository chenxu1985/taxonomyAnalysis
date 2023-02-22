<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>	
<table id="attribute_table" class="projec_table projec_table-border">
	<tbody>
		<!--  <tr>
			<th>
				<s:text name="sample.submit.attr.virus.sampleName"></s:text>
			</th>
			<td>
				<s:property value="wrappedSample.sample.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.organism"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.taxon.name" />
			</td>
		</tr>-->
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.strain"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.strain" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.isolate"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.isolate" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.host"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostTaxon.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.labHost"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.labHost" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.collectionDate"></s:text>
			</th>
			<td>
				<s:date name="sampleAttribute.collectionDate" format="yyyy-MM-dd"></s:date>
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.geographicLocation"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.geographicLocation" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.isolationSource"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.isolationSource" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.altitude"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.altitude" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.biomaterialProvider"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.biomaterialProvider" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.collectedBy"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.collectedBy" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.cultureCollection"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cultureCollection" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.depth"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.depth" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.disease"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.disease" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.environmentBiome"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.environmentBiome" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.genotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.genotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.hostTissueSampled"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostTissueSampled" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.identifiedBy"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.identifiedBy" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.latitudeAndLongitude"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.latitudeLongitude" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.passageHistory"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.passageHistory" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.sampleSize"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.sampleSize" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.serotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.serotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.specimenVoucher"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.specimenVoucher" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.virus.temperature"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.temperature" />
			</td>
		</tr>
	</tbody>
</table>

