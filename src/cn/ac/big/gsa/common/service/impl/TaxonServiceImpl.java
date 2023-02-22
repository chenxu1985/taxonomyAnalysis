package cn.ac.big.gsa.common.service.impl;

import java.util.List;
import java.util.Map;

import cn.ac.big.gsa.common.pojo.Taxon;
import cn.ac.big.gsa.common.dao.TaxonMapper;
import cn.ac.big.gsa.common.service.TaxonService;

public class TaxonServiceImpl implements TaxonService {
	
	TaxonMapper taxonMapper;

	public void setTaxonMapper(TaxonMapper taxonMapper) {
		this.taxonMapper = taxonMapper;
	}

	@Override
	public Taxon findTaxonById(int taxonId) {
		return this.taxonMapper.findTaxonById(taxonId);
	}
	@Override
	public List<String> getTaxonNameList(String name) {
		return taxonMapper.getTaxonNameList(name);
	}

	@Override
	public List<Map<String, String>> getTaxonNameAndIdList(String name) {
		return taxonMapper.getTaxonNameAndIdList(name);
	}
	@Override
	public List<Map<String, String>> getTaxonNameAndIdByName(String name) {
		return taxonMapper.getTaxonNameAndIdByName(name);
	}
	@Override
	public int selectCraCount(String gsaAcc,String runAcc) {
		return taxonMapper.selectCraCount(gsaAcc,runAcc);
	}

}
