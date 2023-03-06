package cn.ac.big.gsa.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author: chenx
 * @Date: 2021/5/27
 **/
public class HttpHostFilter extends HttpServlet implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        // 头攻击检测  过滤主机名
        String requestHost = request.getHeader("host");
        if (requestHost != null && !checkBlankList(requestHost)) {
            response.setStatus(403);
            return;
        }
        String url=request.getRequestURL().toString();
        if(url.contains("logout")){
            HttpSession httpSession = request.getSession();
            httpSession.removeAttribute("curUser");
            System.out.println("test");
        }
        filterChain.doFilter(request, response);
    }

    //判断主机是否存在白名单中
    private boolean checkBlankList(String host){
        //此处为自己网站的主机地址
        return host.contains("localhost:8080") || host.contains("192.168.166.21")|| host.contains("192.168.164.20") || host.contains("bigd.big.ac.cn") || host.contains("ngdc.cncb.ac.cn");
    }
}
