package cn.ac.big.gsa.util;

public class SubmitAccessionUtil {
	public static final int PROJECT=1;
	public static final int SAMPLE=2;
	public static final int CRA=3;
	public static final int EXPERIMENT=4;
	public static final int RUN=5;
	
	public static String getSubmitId(int type, int id){
		StringBuffer submitAcc=new StringBuffer("sub");
		String recordType;
		switch(type){
		case PROJECT:
			recordType="PRO";
			break;
		case SAMPLE:
			recordType="Sam";
			break;
		case CRA:
			recordType="CRA";
			break;
		default:
			recordType="PRO";
			break;
		}
		String suffix="";
//		int tens = id%10;
//		for(int i=5;i>=tens;i--){
//			suffix+="0";
//		}
		String idStr = String.valueOf(id);
		int tens=idStr.length();
		for(int i=5;i>tens;i--){
		 suffix+="0";
	    }
		suffix+=idStr;
		submitAcc.append(recordType);
		submitAcc.append(suffix);
		return submitAcc.toString();
	}
	
	public static String stringToAscii(String value) { 
		StringBuffer sbu = new StringBuffer(); 
		char[] chars = value.toCharArray(); 
		for (int i = 0; i<chars.length; i++) { 
			if(i != chars.length - 1) {
				sbu.append((int)chars[i]).append(","); 
			} else {
				sbu.append((int)chars[i]); 
			} 
		} 
		return sbu.toString(); 
	}
	
	public static String asciiToString(String value) { 
		StringBuffer sbu = new StringBuffer(); 
		String[] chars = value.split(","); 
		for (int i = 0; i<chars.length; i++) { 
			sbu.append((char) Integer.parseInt(chars[i])); 
		}
		return sbu.toString(); 
	}
}
