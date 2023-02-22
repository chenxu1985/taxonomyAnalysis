package cn.ac.big.gsa.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegTest {

	public static void main(String args[]){
		String str = "a.fastq.tar.gz";
		Pattern pattern1 = Pattern.compile(".*(\\.tar\\.gz|\\.gz|\\.zip|\\.bz)$");
//		Pattern pattern1 = Pattern.compile("a");
		Matcher matcher1 = pattern1.matcher(str);
		System.out.println(matcher1.matches());
	}
}
