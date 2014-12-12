package com.shishuo.cms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.shishuo.cms.constant.SystemConstant;
import com.shishuo.cms.entity.Admin;
import com.shishuo.cms.util.MySessionContext;

/**
 * 
 * 管理过滤器
 * 
 * @author mxx
 * 
 */
public class AdminFilter implements Filter {

	protected final Logger logger = Logger.getLogger(this.getClass());
	
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		Admin admin = (Admin) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
		if(admin == null) {
			String sessionid= (String) request.getParameter("sid");
	        if (sessionid != null && !"".equals(sessionid)) {
	            HttpSession session = MySessionContext.getInstance().getSession(sessionid);
	            admin = (Admin)session.getAttribute(SystemConstant.SESSION_ADMIN);
	        }
		}
		if (admin == null) {
			logger.info("====adminFilter session中登录用户为空！");
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path;
			response.sendRedirect(basePath + "/auth/admin/login.htm");
		} else {
			chain.doFilter(request, response);
		}
	}

	public void destroy() {
		// TODO Auto-generated method stub

	}

}
