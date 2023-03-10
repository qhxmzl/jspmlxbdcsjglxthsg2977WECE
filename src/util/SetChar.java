package util;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.util.Iterator;
//字符编码设置
public class SetChar extends HttpServlet implements Filter {
	private FilterConfig filterConfig;

	// Handle the passed-in FilterConfig
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	// Process the request/response pair
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) {
		try {
			//request.setCharacterEncoding("UTF-8");
			
			HttpServletRequest req = (HttpServletRequest) request;

			if (req.getMethod().equalsIgnoreCase("get")) {
	            this.encoding(req);
	        }

			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			filterChain.doFilter(request, response);//在没有新的filter的情况下，doFilter（）返回当前的请求（也就是你在地址栏输入的地址）。
		} catch (ServletException sx) {
			filterConfig.getServletContext().log(sx.getMessage());
		} catch (IOException iox) {
			filterConfig.getServletContext().log(iox.getMessage());
		}
	}
	
	  private void encoding(HttpServletRequest request) {
	        Iterator iter = request.getParameterMap().values().iterator();
	        while (iter.hasNext()) {
	            String[] parames = (String[]) iter.next();
	            for (int i = 0; i < parames.length; i++) {
	                try {
	                    parames[i] = new String(parames[i].getBytes("iso8859-1"),
	                            "UTF-8");
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	  }
 

	// Clean up resources
	public void destroy() {
	}
}
