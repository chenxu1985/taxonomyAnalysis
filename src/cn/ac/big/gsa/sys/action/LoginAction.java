package cn.ac.big.gsa.sys.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.apache.struts2.ServletActionContext;
import org.jasig.cas.client.authentication.AttributePrincipal;

import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	/**
	 * @author wang
	 */
	private static final long serialVersionUID = 3993342445556912102L;
	private UserService userService;
	private User user;
	private int flag;
	private String code;
	private String prePage;
	private String ticket;
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	public String loggedIn(){
		HttpServletRequest request =ServletActionContext.getRequest() ;
		SavedRequest savedRequest = WebUtils.getSavedRequest(request);
		if(savedRequest==null || savedRequest.getRequestUrl()==null){
			System.out.println("Saved Request is null.");
			return SUCCESS;
		}else{			
			this.prePage=savedRequest.getRequestUrl();
			System.out.println("Saved request: "+prePage);
			return "relogin";
		}
			
	}
	public String loginFail(){
		Session session = SecurityUtils.getSubject().getSession();
		User curUser = (User)session.getAttribute("curUser");
		if(curUser!=null)
			return SUCCESS;
		else
			return ERROR;
	}
	public String login1(){
	   
//		Subject subject = SecurityUtils.getSubject();  
//        Object principal = subject.getPrincipal();  
//        PrincipalCollection principals = subject.getPrincipals();  
		
		
		System.out.println("-----helele.");
		HttpServletRequest request =ServletActionContext.getRequest() ;
		
		AttributePrincipal principal = (AttributePrincipal)request.getUserPrincipal();
		if(principal !=null){
			System.out.println("principal not null.");
			String username = principal.getName();
			System.out.println("sso cas user="+username);
			Map<String,Object> attributes = principal.getAttributes();
			for(String str:attributes.keySet()){
				System.out.println("key:"+str+",value:"+attributes.get(str));
			}
//			SecurityUtils.getSubject().login(new UsernamePasswordToken(username,""));
			
//			CasToken ct = new CasToken(username);
		}
		else{
			System.out.println("principal is null.");
			return "login";
		}
		return SUCCESS;
		}
		
//	}
	public String login() {
		flag = 0;
		HttpSession session1 = ServletActionContext.getRequest().getSession();

		// validate check code
		if (session1.getAttribute("randCheckCode") == null)
			return LOGIN;

		String checkCode = session1.getAttribute("randCheckCode").toString();
		if (code.equals(checkCode) || code.toLowerCase().equals(checkCode)
				|| code.toUpperCase().equals(checkCode)) {
			System.out.println("check code success.");

			try {
				if (user.getEmail() == null || "".equals(user.getEmail())
						|| user.getPassword() == null
						|| "".equals(user.getPassword())) {
					flag = 1;
					return LOGIN;
				}
				String email = user.getEmail();
				String encryptPwd = user.getEncryptPwd();
				SecurityUtils.getSubject().login(
						new UsernamePasswordToken(email, encryptPwd));
				User userbean = userService.selectUserByEmailAndPasswd(email,
						encryptPwd);
				if (userbean.getIsActive() == 1) { //user is active
					//put into session
					Session session = SecurityUtils.getSubject().getSession();
					System.out.println("====host:"+session.getHost());
					System.out.println("====sessionId"+session.getId());
					System.out.println("====host1:"+session1.getAttribute("host"));
					System.out.println("====sessionId1"+session1.getId());
					session1.setAttribute("curUser", userbean);
				} else if (userbean.getIsLocked() == 0) {
					flag = 2; // user is not active
					return LOGIN;
				} else {
					flag = 3; // user is locked
					return LOGIN;
				}

			} catch (AuthenticationException e) {
				e.printStackTrace();
				System.out.println("auth failure");
				flag = 1; // user is not exist or password is not right
				return LOGIN;
			}

		} else {
			flag = 5; // code is wrong
			return LOGIN;
		}
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String requestUrl="";
		SavedRequest savedRequest = WebUtils.getSavedRequest(request);
		if(savedRequest!=null){
			requestUrl = savedRequest.getRequestUrl();
			System.out.println("saved request url:"+requestUrl);
		}else{
			System.out.println("login from loign page.");
		}
		if(!"".equals(requestUrl)){
			this.prePage=requestUrl;
			return "redirectPrepage";
		}
		return SUCCESS;
	}

	public String logout() {
//		HttpServletRequest request = ServletActionContext.getRequest();
//		HttpSession session = request.getSession();
//		if (session.getAttribute("userAuthor") != null) {
//			session.setAttribute("userAuthor", null);
//		}
//		if (session.getAttribute("currentUser") != null) {
//			session.setAttribute("currentUser", null);
//		}
//		session.invalidate();
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getPrePage() {
		return prePage;
	}

	public void setPrePage(String prePage) {
		this.prePage = prePage;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	
}
