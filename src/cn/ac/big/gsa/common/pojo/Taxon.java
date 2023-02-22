package cn.ac.big.gsa.common.pojo;

public class Taxon {
	
	private Integer taxonId;
	private String name;
	public Taxon(int taxonId) {
		super();
		this.taxonId = taxonId;
	}
	public Taxon() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getTaxonId() {
		return taxonId;
	}
	public void setTaxonId(String taxonId) {
		if(taxonId.trim().isEmpty()){
			this.taxonId = null;
			return;
		}
		Integer result = Integer.valueOf(taxonId);
		this.taxonId = result;
	}
//	public void setTaxonId(int taxonId) {
//		this.taxonId = taxonId;
//	}
	@Override
	public String toString() {
		return "Taxon [taxonId=" + taxonId + ", name=" + name + "]";
	}
}
