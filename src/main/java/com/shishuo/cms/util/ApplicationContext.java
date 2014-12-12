package com.shishuo.cms.util;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;



public class ApplicationContext {
	
	/**
	 * 	当前请求 HttpServletRequest 对象索引
	 */
	public static final short HTTPREQUEST=1;
	
	/**
	 * 	当前请求 HttpServletResponse 对象索引
	 */
	public static final short HTTPRESPONSE=2;
	
	/**
	 * 	当前用户 HttpSession 对象索引
	 */
	public static final short HTTPSESSION=3;
	
	/**
	 * 	服务器全局 ServletContext 对象索引
	 */
	public static final short SERVLETCONTEXT=4;
	
	/**
	 * 	当前请求 HttpServletRequest 对象
	 */
	private static Map<Long,HttpServletRequest> requestMap=new HashMap<Long, HttpServletRequest>();
	
	/**
	 * 	当前请求 HttpServletResponse 对象
	 */
	private static Map<Long,HttpServletResponse> responseMap=new HashMap<Long, HttpServletResponse>();
	
	/**
	 * 	服务器全局 ServletContext 对象
	 */
	private static ServletContext servletContext;
	
	/**
	 * 	设置对象属相，有：request,response,session,servlet
	 * 
	 * 	@param request		请求对象
	 * 	@param response		请求回应对象
	 */
	public synchronized final static void set(long threadId,HttpServletRequest request,HttpServletResponse response){
		requestMap.put(threadId, request);
		responseMap.put(threadId, response);
	}
	
	public synchronized final static void remove(){
		Long id=Thread.currentThread().getId();
		requestMap.remove(id);
		responseMap.remove(id);
	}
	
	public synchronized final static void set(ServletContext servletContext){
		ApplicationContext.servletContext=servletContext;
	}
	
	/**
	 * 	根据对象索引获取对象，其中：1.HttpServletRequest, 2.HttpServletResponse,3.HttpSession,4.ServletContext.否则返回null
	 * 
	 * 	@param key	对象索引，获取索引的方式为：
	 * 			SwiftAjaxContext.HTTPREQUEST,SwiftAjaxContext.HTTPRESPONSE,SwiftAjaxContext.HTTPSESSION,SwiftAjaxContext.SERVLETCONTEXT
	 * 	@return	Object
	 *  
	 */
	public synchronized final static Object get(int key){
		long id=Thread.currentThread().getId();
		switch(key){
			case HTTPREQUEST	:	return requestMap.get(id);
			case HTTPRESPONSE	:	return responseMap.get(id);
			case HTTPSESSION	:	return requestMap.get(id).getSession();
			case SERVLETCONTEXT	:	return servletContext;
			default				:	return null;
		}
	}
	
	/**
	 * 	获取请求对象(HttpServletRequest)
	 * 
	 * 	@return	HttpServletRequest
	 * 
	 */
	public synchronized final static HttpServletRequest getRequest() {
		return requestMap.get(Thread.currentThread().getId());
	}
	
	/**
	 * 	获取请求回应对象(HttpServletResponse)
	 * 
	 * 	@return	HttpServletResponse
	 * 
	 */
	public synchronized final static HttpServletResponse getResponse() {
		return responseMap.get(Thread.currentThread().getId());
	}
	
	/**
	 * 	获取当前用户对象(HttpSession)
	 * 
	 * 	@return	HttpSession
	 * 
	 */
	public synchronized final static HttpSession getSession() {
		return requestMap.get(Thread.currentThread().getId()).getSession();
	}
	
	/**
	 * 	获取服务器全局对象(ServletContext)
	 * 
	 * 	@return	ServletContext
	 * 
	 */
	public synchronized final static ServletContext getServlet() {
		return servletContext;
	}
	
	public synchronized final static String getPath(String rootFilePath){
		return servletContext.getRealPath(rootFilePath);
	}
	public synchronized final static String getProject(){
		return requestMap.get(Thread.currentThread().getId()).getContextPath();
	}
	
	public synchronized final static String getIpAddress(){
		HttpServletRequest request=getRequest();
		String ipAddress = request.getHeader("x-forwarded-for");
		if(StringUtils.isEmpty(ipAddress) || !validateIp(ipAddress)){
			ipAddress=request.getHeader("Proxy-Client-IP");
			if(StringUtils.isEmpty(ipAddress) || !validateIp(ipAddress)){
				ipAddress = request.getHeader("WL-Proxy-Client-IP");
				if(StringUtils.isEmpty(ipAddress) || !validateIp(ipAddress)){
					ipAddress = request.getRemoteAddr(); 
				}
			}
		}
		if(StringUtils.isEmpty(ipAddress) || !validateIp(ipAddress)){
			return "127.0.0.1";
		}
		ipAddress.trim();
		String[] ips=ipAddress.split("\\,");
		if(ips.length>=2){
			return org.apache.commons.lang3.StringUtils.join(",", ips[0],ips[1]);
		}
		return ipAddress;
	}
	private synchronized static boolean validateIp(String ip){
		String regex="^(((\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5]) *\\, *)*(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5]))$";
		return ip.matches(regex);
	}
	
	public synchronized static String getCookie(String name){
		Cookie[] cookies=getRequest().getCookies();
		if(cookies != null && cookies.length != 0){
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals(name)){
					return cookie.getValue();
				}
			}
		}
		return null;
	}
	
}
