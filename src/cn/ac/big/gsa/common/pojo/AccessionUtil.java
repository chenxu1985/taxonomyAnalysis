package cn.ac.big.gsa.common.pojo;

import cn.ac.big.gsa.common.exception.AccessionOverFlowException;

public class AccessionUtil {
        
    public static String prjAccession = "PRJCA000000";
	public static String sampleAccession = "SAMC000000";
	public static String exptAccession = "CRX000000";
	public static String runAccession = "CRR000000";
	
	/*Added by wangyanqing on 2016-12-15*/
	public static String craAccession = "CRA000400";
	public static String crpAccession = "CRP000400";
	public static String crsAccession = "CRS010000";
		
	/**
	 * prjAccession + 1
	 * @throws AccessionOverFlowException
	 * void
	 */
	public synchronized static void addPrjAcc() throws AccessionOverFlowException{
		String prefix = prjAccession.substring(0, 4);
		char alphaCode = prjAccession.charAt(4);
		String numCode = prjAccession.substring(5);
		int num = Integer.parseInt(numCode) + 1;
		if (num == 1000000) {
			if (alphaCode == 'Z') {
				throw new AccessionOverFlowException("Accession overflow");
			} else {
				alphaCode += 1;
				numCode = "000000";
			}

		} else {
			numCode = numCode.substring(0, 6 - String.valueOf(num).length())
					+ num;
		}
		String newAccession = prefix + alphaCode + numCode;
		prjAccession = newAccession;
		System.out.println("acc:"+AccessionUtil.prjAccession);
	}
	
	/**
	 * sampleAccession + 1
	 * @throws AccessionOverFlowException
	 * void
	 */
	public synchronized static void addSampleAcc() throws AccessionOverFlowException{
		String prefix = sampleAccession.substring(0, 4);
		//char alphaCode = sampleAccession.charAt(4);
		String numCode = sampleAccession.substring(4);
		int num = Integer.parseInt(numCode) + 1;
		if (num == 1000000) {
			//if (alphaCode == 'Z') {
				throw new AccessionOverFlowException("Accession overflow");
			//} else {
				//alphaCode += 1;
				//numCode = "000000";
			//}

		} else {
			numCode = numCode.substring(0, 6 - String.valueOf(num).length())
					+ num;
		}
		//String newAccession = prefix + alphaCode + numCode;
		String newAccession = prefix + numCode;
		sampleAccession = newAccession;
	}
	
	/**
	 * exptAccession + 1
	 * @throws AccessionOverFlowException
	 * void
	 */
	public synchronized static void addExptAcc() throws AccessionOverFlowException{
		String prefix = exptAccession.substring(0, 3);
		//char alphaCode = exptAccession.charAt(3);
		String numCode = exptAccession.substring(3);
		int num = Integer.parseInt(numCode) + 1;
		if (num == 1000000) {
			//if (alphaCode == 'Z') {
				throw new AccessionOverFlowException("Accession overflow");
			//} else {
				//alphaCode += 1;
				//numCode = "000000";
			//}

		} else {
			numCode = numCode.substring(0, 6 - String.valueOf(num).length())
					+ num;
		}
		//String newAccession = prefix + alphaCode + numCode;
		String newAccession = prefix  + numCode;
		
		exptAccession = newAccession;
	}
	
	/**
	 * runAccession + 1
	 * @throws AccessionOverFlowException
	 * void
	 */
	public synchronized static void addRunAcc() throws AccessionOverFlowException{
		String prefix = runAccession.substring(0, 3);
		//char alphaCode = runAccession.charAt(3);
		String numCode = runAccession.substring(3);
		int num = Integer.parseInt(numCode) + 1;
		if (num == 1000000) {
			//if (alphaCode == 'Z') {
				throw new AccessionOverFlowException("Accession overflow");
			//} else {
				//alphaCode += 1;
				//numCode = "000000";
			//}

		} else {
			numCode = numCode.substring(0, 6 - String.valueOf(num).length())
					+ num;
		}
		//String newAccession = prefix + alphaCode + numCode;
		String newAccession = prefix +  numCode;
		runAccession = newAccession;
	}  
	
	/**
	 * craAccession + 1
	 * @throws AccessionOverFlowException
	 * void
	 */
	public synchronized static void addCraAcc() throws AccessionOverFlowException{
		String prefix = craAccession.substring(0, 3);
		//char alphaCode = runAccession.charAt(3);
		String numCode = craAccession.substring(3);
		int num = Integer.parseInt(numCode) + 1;
		if (num == 1000000) {
			//if (alphaCode == 'Z') {
				throw new AccessionOverFlowException("Accession overflow");
			//} else {
				//alphaCode += 1;
				//numCode = "000000";
			//}

		} else {
			numCode = numCode.substring(0, 6 - String.valueOf(num).length())
					+ num;
		}
		//String newAccession = prefix + alphaCode + numCode;
		String newAccession = prefix +  numCode;
		craAccession = newAccession;
	} 
	
	/**
	 * crpAccession + 1
	 * @throws AccessionOverFlowException
	 * void
	 */
	public synchronized static void addCrpAcc() throws AccessionOverFlowException{
		String prefix = crpAccession.substring(0, 3);
		//char alphaCode = runAccession.charAt(3);
		String numCode = crpAccession.substring(3);
		int num = Integer.parseInt(numCode) + 1;
		if (num == 1000000) {
			//if (alphaCode == 'Z') {
				throw new AccessionOverFlowException("Accession overflow");
			//} else {
				//alphaCode += 1;
				//numCode = "000000";
			//}

		} else {
			numCode = numCode.substring(0, 6 - String.valueOf(num).length())
					+ num;
		}
		//String newAccession = prefix + alphaCode + numCode;
		String newAccession = prefix +  numCode;
		crpAccession = newAccession;
	}
	
	/**
	 * crsAccession + 1
	 * @throws AccessionOverFlowException
	 * void
	 */
	public synchronized static void addCrsAcc() throws AccessionOverFlowException{
		String prefix = crsAccession.substring(0, 3);
		//char alphaCode = runAccession.charAt(3);
		String numCode = crsAccession.substring(3);
		int num = Integer.parseInt(numCode) + 1;
		if (num == 1000000) {
			//if (alphaCode == 'Z') {
				throw new AccessionOverFlowException("Accession overflow");
			//} else {
				//alphaCode += 1;
				//numCode = "000000";
			//}

		} else {
			numCode = numCode.substring(0, 6 - String.valueOf(num).length())
					+ num;
		}
		//String newAccession = prefix + alphaCode + numCode;
		String newAccession = prefix +  numCode;
		crsAccession = newAccession;
	}
}