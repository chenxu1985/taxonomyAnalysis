package cn.ac.big.gsa.sys.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.sys.service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class CheckEmailAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7147506522260445954L;
	private String email;
	private UserService userService;
	private boolean isEmailRegistered;
	private String message; 
	public String checkEmail() throws IOException{
		if(!"".equals(email)){
			this.isEmailRegistered = this.userService.isEmailRegistered(email);
			//HttpServletResponse response = ServletActionContext.getResponse();
			//response.getWriter().print(true);
//			return isEmailRegistered;
			 HttpServletResponse response = ServletActionContext.getResponse();

	           response.setContentType("text/plain;charset=UTF-8");
	           if(isEmailRegistered)
	        	   response.getWriter().write("false");
	           else
	        	   response.getWriter().write("true");

		}else{
			this.message="Email cannot be empty!";
		}
//		return true;
		return null;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
//	public UserService getUserService() {
//		return userService;
//	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public boolean isEmailRegistered() {
		return isEmailRegistered;
	}
	public void setEmailRegistered(boolean isEmailRegistered) {
		this.isEmailRegistered = isEmailRegistered;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
