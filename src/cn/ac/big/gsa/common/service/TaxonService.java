package cn.ac.big.gsa.common.service;

import java.util.List;
import java.util.Map;

import cn.ac.big.gsa.common.pojo.RunTaxon;
import cn.ac.big.gsa.common.pojo.Taxon;


public interface TaxonService {
	Taxon findTaxonById(int taxonId);
	List<String> getTaxonNameList(String name);
	List<Map<String, String>> getTaxonNameAndIdList(String name);
	List<Map<String, String>> getTaxonNameAndIdByName(String name);
	int selectCraCount(String gsaAcc,String runAcc);
	RunTaxon selectRunTaxon(String runAcc);

}
