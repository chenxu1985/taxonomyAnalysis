package cn.ac.big.gsa.common.datasource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import java.util.logging.Logger;

public class DynamicDataSource extends AbstractRoutingDataSource {

	static Logger log = Logger.getLogger("DynamicDataSource");   
    @Override  
    protected Object determineCurrentLookupKey() {   
        // TODO Auto-generated method stub  
        return DbContextHolder.getDbType();
    }
    
	@Override
	public Logger getParentLogger()
			 {
		// TODO Auto-generated method stub
//		Logger logger = new 
//		return null;
		return log;
	}   
}
