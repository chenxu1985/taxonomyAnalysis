package cn.ac.big.gsa.util;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;


public class DateTypeConverte extends DefaultTypeConverter {

	@Override
	public Object convertValue(Map<String, Object> context, Object value, Class toType) {
		System.out.println("date converter");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		if(toType == Date.class){
			String[] params = (String[])value;
			try {
				return dateFormat.parse(params[0]);
			} catch (ParseException e) {
//				e.printStackTrace();
			}
		}
		if(toType == String.class){
			Date date = (Date)value;
			return dateFormat.format(date);
		}
		return super.convertValue(value, toType);
	}

}
