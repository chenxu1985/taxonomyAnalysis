package cn.ac.big.gsa.common.action;

import java.util.List;
import java.util.Map;

import cn.ac.big.gsa.common.service.TaxonService;

import com.opensymphony.xwork2.ActionSupport;

public class TaxonAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 706113945932503112L;
	private TaxonService taxonService; 
	private List<Map<String,String>> listTaxonNameAndId;
	private List<Map<String,String>> taxonNameAndId;
	private String name;
	private String taxonName;
	public String listTaxonNameAndId(){
		this.listTaxonNameAndId = this.taxonService.getTaxonNameAndIdList(name);
		return SUCCESS;
	}
	
	public String getTaxonNameAndIdByName(){
		this.taxonNameAndId = this.taxonService.getTaxonNameAndIdByName(taxonName);
		return SUCCESS;
	}
	public List<Map<String, String>> getListTaxonNameAndId() {
		return listTaxonNameAndId;
	}
	public void setListTaxonNameAndId(List<Map<String, String>> listTaxonNameAndId) {
		this.listTaxonNameAndId = listTaxonNameAndId;
	}
	public List<Map<String, String>> getTaxonNameAndId() {
		return taxonNameAndId;
	}
	public void setTaxonNameAndId(List<Map<String, String>> taxonNameAndId) {
		this.taxonNameAndId = taxonNameAndId;
	}

	public TaxonService getTaxonService() {
		return taxonService;
	}

	public void setTaxonService(TaxonService taxonService) {
		this.taxonService = taxonService;
	}
	
	public String getTaxonName() {
		return taxonName;
	}
	public void setTaxonName(String taxonName) {
		this.taxonName = taxonName;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


}
