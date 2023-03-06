package cn.ac.big.gsa.common.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LangAction extends ActionSupport{

	/**
	 * 中英文切换
	 * @author 宋福海
	 * 2016-08-06
	 */
	private static final long serialVersionUID = 1L;
//	private String prePage;
//	private Map<String, Object> session;
	
	@Override
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("WW_TRANS_I18N_LOCALE")+"lang");
		return SUCCESS;
	}

//	public String getPrePage() {
//		return prePage;
//	}
//
//	@Override
//	public void setSession(Map<String, Object> session) {
//		this.session = session;
//	}


}
