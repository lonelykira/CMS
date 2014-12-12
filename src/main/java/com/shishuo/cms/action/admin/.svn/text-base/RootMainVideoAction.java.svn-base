package com.shishuo.cms.action.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shishuo.cms.constant.SystemConstant;
import com.shishuo.cms.entity.Admin;
import com.shishuo.cms.entity.MainVideo;
import com.shishuo.cms.entity.VideoDetail;
import com.shishuo.cms.service.MainVideoService;
import com.shishuo.cms.service.VideoDetailService;
import com.shishuo.cms.util.MySessionContext;

/**
 * 管理员action
 * 
 * @author mxx
 * 
 */
@Controller
@RequestMapping("/admin/mainvideo")
public class RootMainVideoAction extends AdminBaseAction {
	
	@Autowired
	private MainVideoService mainVideoService;
	
	@Autowired
	private VideoDetailService videoDetailService;
	
	/**
	 * 进入添加mainvideo页面
	 * 
	 */
	@RequestMapping(value = "/add-mainvideo.htm", method = RequestMethod.GET)
	public String addMainVideo(ModelMap modelMap, String state, Long mid, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie("jsessinid", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		modelMap.put("state", state);
		modelMap.put("JSESSIONID", request.getSession().getId());
		MySessionContext.getInstance().AddSession(request.getSession());
		MainVideo mainVideo = null;
		if(mid != null) {
			mainVideo = mainVideoService.getMainVideoById(mid);
		} else {
			mainVideo = new MainVideo();
		}
		modelMap.put("mainVideo", mainVideo);
		return "system/mainvideo/video-info";
	}
	
	@RequestMapping(value = "/save-mainvideo.htm", method = RequestMethod.POST)
	public String saveMainVideo(ModelMap modelMap, MainVideo mainVideo, HttpServletRequest request, HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
		if(mainVideo.getMid() != null) {
			mainVideo.setUpdateTime(new Date());
			mainVideo.setUpdateUser(admin.getName());
			mainVideoService.updateMainVideo(mainVideo);
			return "redirect:/admin/mainvideo/add-videolist.htm?state=success&mid="+mainVideo.getMid(); 
		} else {
			mainVideo.setCreateTime(new Date());
			mainVideo.setCreateUser(admin.getName());
			mainVideoService.saveMainVideo(mainVideo);
			return "redirect:/admin/mainvideo/add-videolist.htm?state=success&mid="+mainVideo.getMid();
		}
	}
	
	/**
	 * 进入添加视频列表页面
	 * 
	 */
	@RequestMapping(value = "/add-videolist.htm", method = {RequestMethod.POST, RequestMethod.GET})
	public String addvideoList(ModelMap modelMap, String state, Long mid, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie("jsessinid", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		modelMap.put("JSESSIONID", request.getSession().getId());
		MySessionContext.getInstance().AddSession(request.getSession());
		List<VideoDetail> videoList = videoDetailService.getVideoDetailList(mid);
		MainVideo mainVideo = mainVideoService.getMainVideoById(mid);
		modelMap.put("mainVideo", mainVideo);
		modelMap.put("videoList", videoList);
		modelMap.put("state", state);
		return "system/mainvideo/add-videolist";
	}
	
	/**
	 * 进入mainvideo列表页面
	 * 
	 */
	@RequestMapping(value = "/mainvideo-list.htm", method = {RequestMethod.POST, RequestMethod.GET})
	public String videoList(@RequestParam(value = "p", defaultValue = "1") int pageNum,ModelMap modelMap) {
		modelMap.put("pageVo", mainVideoService.getAllListPage(pageNum));
		return "system/mainvideo/mainvideo-list";
	}
	
	/**
	 * 保存video列表
	 * 
	 */
	@RequestMapping(value = "/save-videolist.htm", method = {RequestMethod.POST})
	public String saveVideoList(ModelMap modelMap, String videosJson, Long mid, HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
		videoDetailService.saveMainVideo(videosJson, admin, mid); // 先删除后插入
		return "redirect:/admin/mainvideo/mainvideo-list.htm?state=succes";
	}
}
