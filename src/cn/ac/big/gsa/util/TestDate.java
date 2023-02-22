/**
 * 
 */
package cn.ac.big.gsa.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author wang
 *
 * 2016-11-30
 */
public class TestDate {
	
	public static void main(String[] args){
		String date="2014-12-16 10:26:58 UTC";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Date dt=null;
		try{
			System.out.println(date.substring(0,20));
			dt = sdf.parse(date.substring(0,20)); 
			System.out.println(dt.toLocaleString());
		}catch(ParseException e){
			e.printStackTrace();
		} 
	}
}
