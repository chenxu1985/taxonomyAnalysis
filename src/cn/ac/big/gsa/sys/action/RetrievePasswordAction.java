package cn.ac.big.gsa.sys.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.UserService;
import cn.ac.big.gsa.util.MD5Util;
import cn.ac.big.gsa.util.SendEmail;

import com.opensymphony.xwork2.ActionSupport;

/***
 * @author wang
 * request to reset passwd
 * **/
public class RetrievePasswordAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String code;
	private String email;
	private int flag;
	private UserService userService;
	
	public String retrievePassword() {
		flag = 0;
		HttpSession session1 = ServletActionContext.getRequest().getSession();
		User user = this.userService.selectByEmail(email);
		if (user != null) { // existed
			if (user.getIsActive() == 1) {
				String checkCode = session1.getAttribute("randCheckCode").toString();
				if (code.equals(checkCode)||code.toLowerCase().equals(checkCode)||code.toUpperCase().equals(checkCode)) {
					System.out.println("check code success.");
					sendEmail();
					
				} else {
					flag = 5;
				}
			} else {
				//
				flag = 2;
			}

		} else {

			flag = 1;
		}

		String result = "success";
		if (flag != 0) {
			result = "error";
		}

		return result;
		// return ERROR;
	}
	
	public void sendEmail(){
		HttpServletRequest request = ServletActionContext.getRequest();
    	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
    	Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = sdf.format(date);
		
    	StringBuffer sb=new StringBuffer();
    	sb.append("Dear user,<br/><br/>");
    	sb.append("Please click the URL below to reset your password within 1 hour.<br/>");
        sb.append("<a href=\"").append(path).append("/member/reset_passwd.jsp?email=");
        sb.append(email);
        sb.append("&validateCode="); 
        sb.append(MD5Util.encode2hex(email));
        sb.append("&amp;timestamp=");
        sb.append(date.getTime());
        sb.append("\">").append(path).append("/member/reset_passwd.jsp?email="); 
        sb.append(email);
        sb.append("&validateCode=");
        sb.append(MD5Util.encode2hex(email));
        sb.append("&amp;timestamp=");
        sb.append(date.getTime());
        sb.append("</a><br/><br/>");
		sb.append("Thanks.<br/><br/>");
		sb.append("GSA ADMIN<br/>");
		sb.append(dateStr).append("<br/><br/>");
		sb.append("-------------------------------<br/>");
		sb.append("NOTE: THIS MAIL IS SENT BY SYSTEM AUTOMATIC, PLEASE DO NOT REPLY DIRECTLY.");
		
		SendEmail.send(email, "GSA ACCOUNT: Reset Password",sb.toString());
        System.out.println("send email");
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	
}
