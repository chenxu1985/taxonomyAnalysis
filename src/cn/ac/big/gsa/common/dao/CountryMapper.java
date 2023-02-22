package cn.ac.big.gsa.common.dao;

import java.util.List;

import cn.ac.big.gsa.common.pojo.Country;

public interface CountryMapper {
//	Country findByCountryName(String countryName);
	Country findCountryById(int countryId);
	List<Country> listAllCountries();
}
