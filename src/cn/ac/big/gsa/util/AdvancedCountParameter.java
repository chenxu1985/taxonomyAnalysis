package cn.ac.big.gsa.util;

public class AdvancedCountParameter
{	
	private String term;
	private String name;
	private String dataTypeName;
	private String methodologyName;
	private String relevance;
	private String materialName;
	private String title;
	private String time1;
	private String time2;
	private String biomaterialProvider;
	private String organization;

	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDataTypeName() {
		return dataTypeName;
	}
	public void setDataTypeName(String dataTypeName) {
		this.dataTypeName = dataTypeName;
	}
	public String getMethodologyName() {
		return methodologyName;
	}
	public void setMethodologyName(String methodologyName) {
		this.methodologyName = methodologyName;
	}
	public String getRelevance() {
		return relevance;
	}
	public void setRelevance(String relevance) {
		this.relevance = relevance;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	public String getBiomaterialProvider() {
		return biomaterialProvider;
	}
	public void setBiomaterialProvider(String biomaterialProvider) {
		this.biomaterialProvider = biomaterialProvider;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public AdvancedCountParameter(String term, String name,
			String dataTypeName, String methodologyName, String relevance,
			String materialName, String title, String time1, String time2,
			String biomaterialProvider, String organization) {
		super();
		this.term = term;
		this.name = name;
		this.dataTypeName = dataTypeName;
		this.methodologyName = methodologyName;
		this.relevance = relevance;
		this.materialName = materialName;
		this.title = title;
		this.time1 = time1;
		this.time2 = time2;
		this.biomaterialProvider = biomaterialProvider;
		this.organization = organization;
	}
	public AdvancedCountParameter() {
		super();
	}

}