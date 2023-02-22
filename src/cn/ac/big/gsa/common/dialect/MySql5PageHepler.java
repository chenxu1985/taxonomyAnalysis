package cn.ac.big.gsa.common.dialect;

public class MySql5PageHepler {

	public static String getLimitString(String querySelect,int offset, int limit) {
		querySelect		= getLineSql(querySelect);
		String sql = querySelect+" limit "+ offset +" ,"+ limit;
		return sql;
	}

	private static String getLineSql(String sql) {
		return sql.replaceAll("[\r\n]", " ").replaceAll("\\s{2,}", " ");
	}


}
