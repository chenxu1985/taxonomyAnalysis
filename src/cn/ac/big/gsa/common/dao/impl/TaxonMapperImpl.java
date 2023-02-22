package cn.ac.big.gsa.common.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.ac.big.gsa.common.pojo.Taxon;
import cn.ac.big.gsa.common.dao.TaxonMapper;

public class TaxonMapperImpl extends SqlSessionDaoSupport implements TaxonMapper {

	@Override
	public Taxon findTaxonById(int TaxonId) {
		String statement = "cn.ac.big.gsa.common.dao.TaxonMapper.findTaxonById";
		return (Taxon)getSqlSessionTemplate().selectOne(statement,TaxonId);
	}
	@Override
	public List<String> getTaxonNameList(String name) {
		String statement = "cn.ac.big.gsa.common.dao.TaxontMapper.getTaxonNameList";
		return getSqlSessionTemplate().selectList(statement, name);
	}

	@Override
	public List<Map<String, String>> getTaxonNameAndIdList(String name) {
		String statement = "cn.ac.big.gsa.common.dao.TaxonMapper.getTaxonNameAndIdList";
		return getSqlSessionTemplate().selectList(statement, name);
	}
	@Override
	public List<Map<String, String>> getTaxonNameAndIdByName(String name) {
		String statement = "cn.ac.big.gsa.common.dao.TaxonMapper.getTaxonNameAndIdByName";
		return getSqlSessionTemplate().selectList(statement, name);
	}
	@Override
	public int selectCraCount(String gsaAcc,String runAcc) {
		String statement = "cn.ac.big.gsa.common.dao.TaxonMapper.selectCraCount";
		Map<String,String> map = new HashMap<String,String>();
		map.put("gsaAcc",gsaAcc);
		map.put("runAcc",runAcc);
		return (int) getSqlSessionTemplate().selectOne(statement, map);
	}
}
