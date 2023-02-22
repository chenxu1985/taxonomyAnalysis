package cn.ac.big.gsa.common.datasource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;


public class DbContextHolder {
	private static Logger logger = Logger.getLogger(DbContextHolder.class);
	public static final String GSA_DS = "gsaDS";
	public static final String NCBI_DS = "ncbiDS";
	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();   
	  
    public static void setDbType(String dbType) {   
        contextHolder.set(dbType);   
    }   
  
    public static String getDbType() {
        String dataSource = contextHolder.get();
//        System.out.println("datasource:"+dataSource);
//        logger.info("datasource:"+dataSource);
        if (StringUtils.isEmpty(dataSource))
    		return GSA_DS;
    	else
    		return dataSource;   
    }   
  
    public static void clearDbType() {   
        contextHolder.remove();   
    }  
}
