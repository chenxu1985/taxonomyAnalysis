package cn.ac.big.gsa.common.init;

import cn.ac.big.gsa.common.service.AccessionService;

public class AccessionInit{

	private AccessionService accessionService;
	public void init(){
		System.out.println("init accessions...");
//		AccessionUtil.prjAccession = "PRJCA000013";
//		System.out.println("init...");
//		System.out.println("prj accession is:"+AccessionUtil.prjAccession);
		this.accessionService.initAccessions();
		
	}
	public void destroy(){
		System.out.println("destory...");
	}
//	public AccessionService getAccessionService() {
//		return accessionService;
//	}
	public void setAccessionService(AccessionService accessionService) {
		this.accessionService = accessionService;
	}
	
	

}
