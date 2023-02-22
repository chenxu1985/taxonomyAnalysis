package cn.ac.big.gsa.util;

import java.lang.reflect.Field;


public class CommonTools {
	private CommonTools(){};
	
	public static <T>boolean validateEntireEntry(T t) throws IllegalArgumentException, IllegalAccessException{
		if(t == null){
			return true;
		}
		Class<?> cls = t.getClass();
        Field[] fields = cls.getDeclaredFields();
        int count = 0;
        int total = 0;
        for(int i = 0; i < fields.length; i++) {
        	fields[i].setAccessible(true);        	
        	if(fields[i].getType().toString().equalsIgnoreCase("class java.lang.String")){
        		total++;
        		if(fields[i].get(t).toString().trim().isEmpty())
        			count++;
        	}else if(fields[i].getType().toString().equalsIgnoreCase("class java.lang.Integer")){
        		total++;
        		if(fields[i].get(t) == null)
        			count++;
        	}
        }
        if(count == 0 || count == total ){
        	return true;
        }else{
        	return false;
        }
	}
	
	public static boolean validateInt(int field){
		if(field == 0){
			return false;
		}
		return true;
	}
	
	public static boolean validateString(String field){
		if(field == null || "".equals(field.trim())){
			return false;
		}
		return true;
	}
	
	
	public static String upperInitials(String str){
		return str.substring(0, 1).toUpperCase()+str.substring(1);
	}
	public static String lowerInitials(String str){
		return str.substring(0, 1).toLowerCase()+str.substring(1);
	}
	public static String ChangeNameStyle(String s){
		String[] stringArray = s.split("_");
		String newString = "";
		for(String str:stringArray)
			newString += upperInitials(str);
		newString = lowerInitials(newString);
		return newString;
	}
}
