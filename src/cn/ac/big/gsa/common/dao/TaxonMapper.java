package cn.ac.big.gsa.common.dao;

import java.util.List;
import java.util.Map;

import cn.ac.big.gsa.common.pojo.Taxon;

public interface TaxonMapper {
	Taxon findTaxonById(int TaxonId);
	List<Map<String, String>> getTaxonNameAndIdByName(String name);
	List<String> getTaxonNameList(String name);
	List<Map<String,String>> getTaxonNameAndIdList(String name);
	int selectCraCount(String gsaAcc,String runAcc);
}
