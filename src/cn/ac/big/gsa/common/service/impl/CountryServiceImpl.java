package cn.ac.big.gsa.common.service.impl;

import java.util.List;

import cn.ac.big.gsa.common.dao.CountryMapper;
import cn.ac.big.gsa.common.pojo.Country;
import cn.ac.big.gsa.common.service.CountryService;

public class CountryServiceImpl implements CountryService {
	
	private CountryMapper countryMapper;



	public void setCountryMapper(CountryMapper countryMapper) {
		this.countryMapper = countryMapper;
	}

	@Override
	public List<Country> listAllCountries() {
		return countryMapper.listAllCountries();
	}

	@Override
	public Country findCountryById(int id) {
		return countryMapper.findCountryById(id);
	}

}
