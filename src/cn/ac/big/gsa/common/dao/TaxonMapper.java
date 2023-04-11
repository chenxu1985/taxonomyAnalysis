package cn.ac.big.gsa.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ac.big.gsa.common.pojo.RunTaxon;
import cn.ac.big.gsa.common.pojo.Taxon;
import cn.ac.big.gsa.common.pojo.TaxonRun;

public interface TaxonMapper {
	Taxon findTaxonById(int TaxonId);
	List<Map<String, String>> getTaxonNameAndIdByName(String name);
	List<String> getTaxonNameList(String name);
	List<Map<String,String>> getTaxonNameAndIdList(String name);
	int selectCraCount(String gsaAcc,String runAcc);
	RunTaxon selectRunTaxon(String runAcc);
	List<TaxonRun> selectUnTaxonomyRunList();
	int updateRunTaxonomy(HashMap runMap);
}
