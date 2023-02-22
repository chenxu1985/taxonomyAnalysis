/**
 * 
 */
package cn.ac.big.gsa.common.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/**
 * @author wang
 *
 * 2017-6-7
 */
public class MyFilter extends StrutsPrepareAndExecuteFilter{

	    public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {
	        HttpServletRequest request = (HttpServletRequest) req;
	        //不过滤的url
	        String url = request.getRequestURI();
//	        System.out.println("====url:"+url+"=========");
	        if (url.indexOf("/rest") >= 0) {
	        	System.out.println("web service.");
//	            System.out.println("使用自定义的过滤器");
	            chain.doFilter(req, res);
	        }else{
//	            System.out.println("使用默认的过滤器");
	            super.doFilter(req, res, chain);
	        }
	    }
}
