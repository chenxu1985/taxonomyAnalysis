package cn.ac.big.gsa.sys.action;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.RegisterService;
import cn.ac.big.gsa.sys.service.ServiceException;
import cn.ac.big.gsa.sys.service.UserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @Author wangyanqing
 * **/
public class RegisterAction extends ActionSupport implements ModelDriven<User> {
	private User user;
	private static final long serialVersionUID = 1L;
	private RegisterService registerService;
	private UserService userService;
	private String mailAddr;
	private String validateCode;
	
	//added on 2017-05-11
	private String username;
	
	// private int emailFlag;

	private Map<String, String> errorStr = null;

	public void validateRegister() throws IllegalArgumentException,
			IllegalAccessException {
		if (user.getEmail() == null || user.getEmail().equals("")) {
			addFieldError("user.email", "Email cannot be empty.");
		}
		if(!isValidateEmailAddr(user.getEmail())){
//			System.out.println("Email address is not correct.");
			addFieldError("user.email","Email address is not correct.");
		}
//		boolean isEmailRegistered = this.userService.isEmailRegistered(user
//				.getEmail());
		if (isEmailRegistered(user.getEmail())) {
//			System.out.println("This email is registered.");
			addFieldError("user.email",
					"This email is registered, please check.");
			// this.emailFlag = 2;
			// flag = false;
		}
		if(user.getCountry()==null){
			addFieldError("user.country","Country cannot be empty.");
		}
		if(user.getFirstName()==null || user.getFirstName().equals("")){
			addFieldError("user.firstName","First name cannot be empty.");
		}
		if(user.getLastName()==null || user.getLastName().equals("")){
			addFieldError("user.lastName","Last name cannot be empty.");
		}
		if(user.getPassword()==null || user.getPassword().equals("")){
			addFieldError("user.password","Password cannot be empty.");
		}
		if(user.getConfirmPassword()==null || user.getConfirmPassword().equals("")){
			addFieldError("user.confirmPassword","Please input your password again.");
		}
		if(!user.getPassword().equals(user.getConfirmPassword())){
//			System.out.println("Inconsistent with password.");
			addFieldError("user.password","Inconsistent with password");
		}
		if(!isValidatePassword(user.getPassword())){
//			System.out.println("Password must consist of uppercase, lowercase and numbers, and with a length of 8 to 15.");
			addFieldError("user.password","Password must consist of uppercase, lowercase and numbers, and with a length of 8 to 15.");
		}
		if(user.getPostalCode()==null){
			addFieldError("user.postalCode","Postalcode is cannot be empty.");
		}
		if(!isValidatePostalCode(String.valueOf(user.getPostalCode()))){
			addFieldError("user.postalCode","Incorrect postal code.");
		}
		if(user.getCity()==null || user.getCity().equals("")){
			addFieldError("user.city","City cannot be empty.");
		}
		if(user.getOrganization()==null || user.getOrganization().equals("")){
			addFieldError("user.organization","Organization cannot be empty.");
		}
		if(user.getDepartment()==null || user.getDepartment().equals("")){
			addFieldError("user.department","Department cannot be empty.");
		}
		if(user.getStreet()==null || user.getStreet().equals("")){
			addFieldError("user.street","Street address cannot be empty.");
		}
	}

	public String register() throws Exception {

		HttpSession session = ServletActionContext.getRequest().getSession();
		// if (this.isValidate()) {
		Calendar c = Calendar.getInstance();
		Date d = c.getTime();

		c.add(Calendar.DAY_OF_MONTH, 2);
		Date d1 = c.getTime();
		user.setCreateTime(d);
		user.setActiveTime(d1);
		if (this.registerService.processregister(user)) {
			session.setAttribute("user", user.getEmail());
			return SUCCESS;
		} else {
			System.out.println("insert db failed");
			return ERROR;
		}
	}

	public String activeRegister() throws ParseException {
		try {
			System.out.println("email:" + this.mailAddr);
			System.out.println("validateCode:" + this.validateCode);
			registerService.processActivate(mailAddr, validateCode);// 调用激活方法
			return SUCCESS;
		} catch (ServiceException e) {
			// e.printStackTrace();
			errorStr = new HashMap<String, String>();
			errorStr.put("activeErr", e.getMessage());
			System.out.println(errorStr.get("activeErr"));
			return ERROR;
		}

	}

	public boolean isValidateEmailAddr(String emailAddr) {
		String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(emailAddr);
		if (matcher.matches())
			return true;
		else
			return false;
	}
	public boolean isValidatePostalCode(String postalCode){
		String check="[1-9]\\d{5}(?!\\d)";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(postalCode);
		if(matcher.matches())
			return true;
		else
			return false;
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
	
	//added on 2017-05-11
	/********************************************************
	 * this is used to execute user register from client
	 * @return
	 */
	public String execUserRegisterFromCAS(){
		String result="success";
//		String wsurl = "http://sso.big.ac.cn/rest/service/userdetail";
		
//		System.out.println("++++++++++++++++++++++++++++++execUserRegisterFromCAS");
		
	/*	Client client = BIGWebServiceClientFactory.getClient();
		System.out.println(wsurl);
        WebResource r = client.resource(wsurl);
        MultivaluedMap<String, String> param = new MultivaluedMapImpl();
      
        if(username != null ){
        	System.out.println("username="+username);
        	param.add("username", username);
        }
        
        ClientResponse response =   r.queryParams(param).type(MediaType.APPLICATION_JSON_TYPE).get(ClientResponse.class);;
        System.out.println(response.toString());
        cn.ac.big.cloud.common.po.UserBean info =  response.getEntity(new GenericType<cn.ac.big.cloud.common.po.UserBean>() {}) ;
        
        if(info!= null ){*/
        //	System.out.println("userid"+info.getUserId());
//        	UserBean tuser = new UserBean();
        	
        	//LOGIC LIKE LOGIN
        	
        	
//			if(username!=null){
//				tuser.setEmail(username);
//			
//				UserBean userbean = (UserBean)baseService.findObjectByObject("identifyValidateUser", tuser);
//				if(userbean ==null){
//
//					tuser.setIsActive(0);
//					tuser.setIsLocked(0);
//					tuser.setIsDeleted(0);
//					tuser.setIsRoleAllocated(0);
//					tuser.setIsDataAllocated(0);
//					baseService.insertObjectToTable("cn.ac.big.cloud.common.dao.UserMapper.insert", tuser);
//					
//					//does not have login authority
//					flag = 2;
//				}
//				
//				
//			}

        	
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("username", username);
		return SUCCESS;
	}
	
	public boolean isEmailRegistered(String email){
		return this.userService.isEmailRegistered(email);
	}
	public void setRegisterService(RegisterService registerService) {
		this.registerService = registerService;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public String getMailAddr() {
		return mailAddr;
	}

	public void setMailAddr(String mailAddr) {
		this.mailAddr = mailAddr;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		if (user == null) {

			user = new User();

		}

		return user;
	}

	public Map<String, String> getErrorStr() {
		return errorStr;
	}

	public void setErrorStr(Map<String, String> errorStr) {
		this.errorStr = errorStr;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	// public int getEmailFlag() {
	// return emailFlag;
	// }
	//
	// public void setEmailFlag(int emailFlag) {
	// this.emailFlag = emailFlag;
	// }

}
