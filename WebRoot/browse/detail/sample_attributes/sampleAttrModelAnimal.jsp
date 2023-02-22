<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<table id="attribute_table" class="projec_table projec_table-border">
	<tbody>
		<!-- <tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.sampleName"></s:text>
			</th>
			<td>
				<s:property value="wrappedSample.sample.name" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.organism"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.taxon.name" />
			</td>
		</tr>-->
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.breed"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.breed" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.strain"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.strain" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.age"></s:text>
			</th>
			<td>
				<s:if test="sampleAttribute.age != null && sampleAttribute.age != ''">
				<s:property value="sampleAttribute.age" /> <s:property value="sampleAttribute.ageUnit" />(s)
				</s:if>
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.biomaterialProvider"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.biomaterialProvider" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.sex"></s:text>	
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
				<s:text name="sample.submit.attr.modelanimal.tissue"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.tissue" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.birthDate"></s:text>
			</th>
			<td>
				<s:date name="sampleAttribute.birthDate" format="yyyy-MM-dd"></s:date>
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.birthLocation"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.birthLocation" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.breedHistory"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.breedHistory" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.breedMethod"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.breedMethod" />
			</td>
		</tr>		
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.cellLine"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cellLine" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.cellSubtype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cellSubtype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.cellType"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cellType" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.collectedBy"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.collectedBy" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.cultureCollection"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.cultureCollection" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.deathDate"></s:text>
			</th>
			<td>
				<s:date name="sampleAttribute.deathDate"  format="yyyy-MM-dd"></s:date>
			</td>
		</tr>		
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.developmentStage"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.developmentStage" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.disease"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.disease" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.diseaseStage"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.diseaseStage" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.genotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.genotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.geographicLocation"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.geographicLocation" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.growthProtocol"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.growthProtocol" />
			</td>
		</tr>		
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.healthState"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.healthState" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.isolationSource"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.isolationSource" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.latitudeAndLongitude"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.latitudeLongitude" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.phenotype"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.phenotype" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.type"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.type" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.specimenVoucher"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.specimenVoucher" />
			</td>
		</tr>
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.storageConditions"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.storageConditions" />
			</td>
		</tr>		
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.studyBookNumber"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.studyBookNumber" />
			</td>
		</tr>	
		<tr>
			<th>
				<s:text name="sample.submit.attr.modelanimal.treatment"></s:text>
			</th>
			<td>
				<s:property value="sampleAttribute.treatment" />
			</td>
		</tr>								
	</tbody>
</table>

