package cn.ac.big.gsa.common.service;

import cn.ac.big.gsa.common.pojo.Accession;

public interface AccessionService {

	void initAccessions(); //when load servlet context, 
						   //select the max accessions from the related tables,
						   //init the static accession parameters in the class AccessionUtil
						   //and update the accessions of table accession
	int updateByAccType(Accession accession);
}
