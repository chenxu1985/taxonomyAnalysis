package cn.ac.big.gsa.sys.action;

import java.util.List;

import cn.ac.big.gsa.common.pojo.Country;
import cn.ac.big.gsa.common.service.CountryService;

import com.opensymphony.xwork2.ActionSupport;

public class CountryAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3519711238076386548L;
	private List<Country> countries;
	private CountryService countryService;
	
	public String listCountries(){
		this.setCountries(countryService.listAllCountries());
		return SUCCESS;
	}

	public List<Country> getCountries() {
		return countries;
	}

	public void setCountries(List<Country> countries) {
		this.countries = countries;
	}

	public CountryService getCountryService() {
		return countryService;
	}

	public void setCountryService(CountryService countryService) {
		this.countryService = countryService;
	}
	
	

}
