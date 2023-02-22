<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>	
<table id="attribute_table" class="projec_table projec_table-border">
	<tbody>
		<!--  <tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.sampleName"></s:text>
			</th>
			<td>
				<s:property value="wrappedSample.sample.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.organism"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.taxon.name" />
			</td>
		</tr>-->
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.isolate"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.isolate" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.strain"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.strain" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.collectedBy"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.collectedBy" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.collectionDate"></s:text>
			</th>
			<td>
				<s:date name="sampleAttribute.collectionDate" format="yyyy-MM-dd"></s:date>
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.geographicLocation"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.geographicLocation" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.host"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostTaxon.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.hostDisease"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostDisease" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.isolationSource"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.isolationSource" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.latitudeAndLongitude"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.latitudeLongitude" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.cultureCollection"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cultureCollection" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.genotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.genotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.hostAge"></s:text>
			</th>
			<td>
				<s:if test="sampleAttribute.hostAge != null && sampleAttribute.hostAge != ''">
				<s:property value="sampleAttribute.hostAge" /> <s:property value="sampleAttribute.hostAgeUnit" />(s)
				</s:if>
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.hostDescription"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostDescription" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.hostDiseaseStage"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostDiseaseStage" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.hostHealthState"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostHealthState" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.hostSex"></s:text>
			</th>
			<td>
				<s:property value="hostSex" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.hostSubjectId"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostSubjectId" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.hostTissueSampled"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.hostTissueSampled" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.passageHistory"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.passageHistory" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.pathotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.pathotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.serotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.serotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.serovar"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.serovar" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.specimenVoucher"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.specimenVoucher" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.subgroup"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.subgroup" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.pathogenclinicalhostassociated.subtype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.subtype" />
			</td>
		</tr>
	</tbody>
</table>
