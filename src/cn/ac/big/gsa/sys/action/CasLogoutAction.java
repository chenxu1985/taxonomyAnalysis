/**
 * 
 */
package cn.ac.big.gsa.sys.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author wang
 *
 * 2016-12-14
 */
public class CasLogoutAction extends ActionSupport{
	

	/**
	 * CasLogoutAction.java
	 * 2016-12-14
	 */
	private static final long serialVersionUID = -471595646759494383L;
	private String logoutURL="https://ngdc.cncb.ac.cn/cloud/cas/logout?service=http://192.168.72.57/logout";
	
	/***
	 * 
	 * @return
	 * String
	 */
	public String logout(){
	        try {
	            URL realUrl = new URL(logoutURL);
	            // 打开和URL之间的连接
	            HttpURLConnection conn = (HttpURLConnection)realUrl.openConnection();
	            // 设置通用的请求属性
	            //conn.setRequestProperty("accept", "*/*");
	           // conn.setRequestProperty("connection", "Keep-Alive");
	           // conn.setRequestProperty("user-agent",
	                    //"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
	            // 发送POST请求必须设置如下两行
	            conn.setDoOutput(true);
	            conn.setDoInput(true);
	            conn.setUseCaches(false);
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Charsert", "UTF-8");
	            conn.setRequestProperty("content-type","text/html");
//	            conn.setRequestProperty("Content-type", "application/x-java-serialized-object");
	            conn.connect();
	            
	            int responseCode = conn.getResponseCode();   
	            
	            
	            if (HttpURLConnection.HTTP_OK == responseCode) {// 连接成功   
	            	System.out.println("退出登录连接成功。");
	            // 当正确响应时处理数据   
	            StringBuffer sb = new StringBuffer();   
	            String readLine;   
	            BufferedReader responseReader;   
	            // 处理响应流，必须与服务器响应流输出的编码一致   
	             responseReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));   
	            while ((readLine = responseReader.readLine()) != null) {   
	            sb.append(readLine).append("\n");   
	            }   
	            responseReader.close();   
	            System.out.println(sb.toString());   
	            }   
	            } catch (Exception ex) {   
	            ex.printStackTrace();   
	            }   
	            
		
		return SUCCESS;
	}
}
