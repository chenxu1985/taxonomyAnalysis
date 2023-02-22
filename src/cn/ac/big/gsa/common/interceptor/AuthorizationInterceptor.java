package cn.ac.big.gsa.common.interceptor;

import java.io.PrintWriter;
import java.util.Map;

/*import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.sys.pojo.UserAuthorityBean;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthorizationInterceptor extends AbstractInterceptor  {

	private static final long serialVersionUID = 678244321181640245L;

	@Override
	public String intercept(ActionInvocation arg) throws Exception {
		// TODO Auto-generated method stub
//		Map session = arg.getInvocationContext().getSession();
//		UserAuthorityBean auth = (UserAuthorityBean)session.get("userAuthor");
//		int flag = 0 ;
//		
//		if(auth == null){
//			HttpServletRequest request = ServletActionContext.getRequest();
//			String prePage = request.getRequestURI();
//			String queryStr = request.getQueryString();
//			System.out.println(prePage);
//			System.out.println("query string:"+queryStr);
//			if(queryStr!=null && !"".equals(queryStr))
//				prePage+="?"+queryStr;
//			System.out.println("pre page:"+prePage);
//			session.put("prePage", prePage);
//			HttpServletResponse response = ServletActionContext.getResponse();
//			PrintWriter pw = response.getWriter();
//
//			if (request.getHeader("X-Requested-With") != null
//			&& request.getHeader("X-Requested-With").equalsIgnoreCase("XMLHttpRequest")) {  
//				System.out.println("authority ajax request");
//				response.setCharacterEncoding("text/html;charset=utf-8");
//				response.setContentType("text/html;charset=utf-8");
//				flag = 999;
//				String jsonstr = "{flag:"+flag+"}";
//				pw.write(jsonstr);
//				pw.close();
//
//				return null;
//				
//			} else {
//				return "login";
//			} 			
//		}
     
	     return arg.invoke();

	}

}
