package cn.ac.big.gsa.common.service;

import java.util.List;

import cn.ac.big.gsa.common.pojo.Country;

public interface CountryService {
	List<Country> listAllCountries();
	Country findCountryById(int id);
}
