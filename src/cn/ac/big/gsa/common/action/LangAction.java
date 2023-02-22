package cn.ac.big.gsa.common.action;

import com.opensymphony.xwork2.ActionSupport;

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
//		HttpServletRequest request = ServletActionContext.getRequest();
//		this.prePage = request.getRequestURI();
//		String queryStr = request.getQueryString();
//		if(queryStr!=null && !"".equals(queryStr))
//			this.prePage+="?"+queryStr;	
//		this.prePage = (String)session.get("prePage");
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
