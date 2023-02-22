package cn.ac.big.gsa.common.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.ac.big.gsa.common.dao.CountryMapper;
import cn.ac.big.gsa.common.pojo.Country;

public class CountryMapperImpl extends SqlSessionDaoSupport implements CountryMapper {
	
//	@Override
//	public Country findByCountryName(String countryName){
//		String statement = "cn.ac.big.gsa.project.dao.CountryMapper.findByCountryName";
//		return (Country) getSqlSessionTemplate().selectOne(statement , countryName);
//	}
	
	@Override
	public Country findCountryById(int countryId){
		String statement = "cn.ac.big.gsa.project.dao.CountryMapper.findCountryById";
		return (Country) getSqlSessionTemplate().selectOne(statement , countryId);
	}

	@Override
	public List<Country> listAllCountries() {
		String statement = "cn.ac.big.gsa.project.dao.CountryMapper.listAllCountries";
		return getSqlSessionTemplate().selectList(statement);
	}
}
