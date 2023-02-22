package cn.ac.big.gsa.util;

import java.util.Map;

import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;


public class TaxonIdTypeConverte extends DefaultTypeConverter {

	@Override
	public Object convertValue(Map<String, Object> context, Object value, Class toType) {
		System.out.println("converting start");
		if(toType == int.class || toType == Integer.class){
			String[] params = (String[])value;
			System.out.println(params);
			if(params[0].isEmpty()){
				return 0;
			}
			try {
				return Integer.parseInt(params[0]);
			} catch (NumberFormatException e) {}
		}
		if(toType == String.class){
			return value.toString();
		}
		return super.convertValue(value, toType);
	}

}
