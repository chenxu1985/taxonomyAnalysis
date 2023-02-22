package cn.ac.big.gsa.sys.action;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.UserService;
import cn.ac.big.gsa.util.MD5Util;

import com.opensymphony.xwork2.ActionSupport;

public class ResetPasswordAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private String email;
	private String time;
	private String password;
	private String confirmPassword;
	private String code;
	private String validateCode;
	private int flag;

	public void validateRegister() throws IllegalArgumentException,
			IllegalAccessException {
		
		if (password == null || password.equals("")) {
			addFieldError("password", "Password cannot be empty.");
		}
		if (confirmPassword == null
				|| confirmPassword.equals("")) {
			addFieldError("confirmPassword",
					"Please input your password again.");
		}
		if (!password.equals(confirmPassword)) {
			// System.out.println("Inconsistent with password.");
			addFieldError("password", "Inconsistent with password");
		}
		if (!isValidatePassword(password)) {
			// System.out.println("Password must consist of uppercase, lowercase and numbers, and with a length of 8 to 15.");
			addFieldError(
					"password",
					"Password must consist of uppercase, lowercase and numbers, and with a length of 8 to 15.");
		}
	}

	public String resetPassword() {
		System.out.println("email:" + this.email);
		System.out.println("time:" + this.time);
		System.out.println("validate code:" + this.validateCode);
		flag = 0;
		if (!validateCode.equals(MD5Util.encode2hex(email))) {// validate code
																// success
			flag = 1;
			return ERROR;
		}

		Date now = new Date();
		long nowtimestamp = now.getTime();
		long interval = nowtimestamp - Long.parseLong(time);
		if (interval / (1000 * 60 * 60) > 1) {
			System.out.println("Long than 1 hour.");
			flag = 2;
			return ERROR;
		} else {
			HttpSession session1 = ServletActionContext.getRequest()
					.getSession();
			String checkCode = session1.getAttribute("randCheckCode")
					.toString();
			if (code.equals(checkCode) || code.toLowerCase().equals(checkCode)
					|| code.toUpperCase().equals(checkCode)) {
				System.out.println("check code success.");
				// sendEmail();
				User user = this.userService.selectByEmail(email);
				user.setPassword(password);
				if (this.userService.updateByPrimaryKey(user) > 0)
					return SUCCESS;
				else {
					flag = 3;
					return ERROR;
				}
			} else {
				flag = 5;
				return ERROR;
			}
		}
		// System.out.println(timestamp);
		// return SUCCESS;
	}

	public boolean isValidatePassword(String passwd){
		String check="((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15})";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(passwd);
		if (matcher.matches())
			return true;
		else
		//String check="[a-zA-Z0-9]+";
		return false;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}


}
