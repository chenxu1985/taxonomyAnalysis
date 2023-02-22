package cn.ac.big.gsa.common.service.impl;

import cn.ac.big.gsa.common.dao.AccessionMapper;
import cn.ac.big.gsa.common.pojo.Accession;
import cn.ac.big.gsa.common.pojo.AccessionUtil;
import cn.ac.big.gsa.common.service.AccessionService;

public class AccessionServiceImpl implements AccessionService{

	private AccessionMapper accessionMapper;
	
	public AccessionMapper getAccessionMapper() {
		return accessionMapper;
	}

	public void setAccessionMapper(AccessionMapper accessionMapper) {
		this.accessionMapper = accessionMapper;
	}

	@Override
	public void initAccessions() {
		// TODO Auto-generated method stub
		String maxPrjAccession = this.accessionMapper.selectMaxPrjAcc();
		String maxSampAccession = this.accessionMapper.selectMaxSampleAcc();
		String maxExptAccession = this.accessionMapper.selectMaxExptAcc();
		String maxRunAccession = this.accessionMapper.selectMaxRunAcc();
		/*updated by wangyanqing at 2017-01-06**/
		String maxCraAccession = this.accessionMapper.selectMaxCraAcc();
		String maxCrpAccession = this.accessionMapper.selectMaxCrpAcc();
		String maxCrsAccession = this.accessionMapper.selectMaxCrsAcc();
		
		AccessionUtil.prjAccession = (maxPrjAccession==null||maxPrjAccession.equals(""))?"PRJCA000000":maxPrjAccession;
		AccessionUtil.sampleAccession = (maxSampAccession==null||maxSampAccession.equals(""))?"SAMC000000":maxSampAccession;
		AccessionUtil.exptAccession = (maxExptAccession==null||maxExptAccession.equals(""))?"CRX000000":maxExptAccession;
		AccessionUtil.runAccession = (maxRunAccession==null||maxRunAccession.equals(""))?"CRR000000":maxRunAccession;
		AccessionUtil.craAccession = (maxCraAccession==null||maxCraAccession.equals(""))?"CRA000400":maxCraAccession;
		AccessionUtil.crpAccession = (maxCrpAccession==null||maxCrpAccession.equals(""))?"CRP000400":maxCrpAccession;
		AccessionUtil.crsAccession = (maxCrsAccession==null||maxCrsAccession.equals(""))?"CRS010000":maxCrsAccession;
		
		System.out.println("prjAcc:"+AccessionUtil.prjAccession);
		System.out.println("sampleAcc:"+AccessionUtil.sampleAccession);
		System.out.println("exptAcc:"+AccessionUtil.exptAccession);
		System.out.println("runAcc:"+AccessionUtil.runAccession);
		System.out.println("craAcc:"+AccessionUtil.craAccession);
		System.out.println("crpAcc:"+AccessionUtil.crpAccession);
		System.out.println("crsAcc:"+AccessionUtil.crsAccession);
		
//		this.accessionMapper.updateByAccType(accession)
		
	}

	@Override
	public int updateByAccType(Accession accession) {
		// TODO Auto-generated method stub
		return this.accessionMapper.updateByAccType(accession);
	}

}
