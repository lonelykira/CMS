package com.shishuo.cms.action.admin;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shishuo.cms.constant.AttachmentConstant;
import com.shishuo.cms.constant.SystemConstant;
import com.shishuo.cms.entity.Admin;
import com.shishuo.cms.entity.MainVideo;
import com.shishuo.cms.entity.VideoFactory;
import com.shishuo.cms.exception.UploadException;
import com.shishuo.cms.service.MainVideoService;
import com.shishuo.cms.service.VideoService;
import com.shishuo.cms.util.MySessionContext;
import com.shishuo.cms.util.UploadUtils;

/**
 * 管理员action
 * 
 * @author mxx
 * 
 */
@Controller
@RequestMapping("/admin/video")
public class RootVideoAction extends AdminBaseAction {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private MainVideoService mainVideoService;
	
	/**
	 * 进入添加video页面
	 * 
	 */
	@RequestMapping(value = "/video-info.htm", method = RequestMethod.GET)
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
		return "system/video/video-info";
	}
	
	@RequestMapping(value = "/save-mainvideo.htm", method = RequestMethod.POST)
	public String saveMainVideo(ModelMap modelMap, MainVideo mainVideo, HttpServletRequest request, HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
		if(mainVideo.getMid() != null) {
			mainVideo.setUpdateTime(new Date());
			mainVideo.setUpdateUser(admin.getName());
			mainVideoService.updateMainVideo(mainVideo);
			return "redirect:/admin/video/add-video.htm?state=success"; 
		} else {
			mainVideo.setCreateTime(new Date());
			mainVideo.setCreateUser(admin.getName());
			mainVideoService.saveMainVideo(mainVideo);
			return "redirect:/admin/video/mainvideo-list.htm?state=success"; 
		}
	}
	
	/**
	 * 进入video列表页面
	 * 
	 */
	@RequestMapping(value = "/video-list.htm", method = {RequestMethod.POST, RequestMethod.GET})
	public String videoList(@RequestParam(value = "p", defaultValue = "1") int pageNum,ModelMap modelMap) {
		modelMap.put("pageVo", videoService.getAllListPage(pageNum));
		return "system/video/video-list";
	}
	
	/**
	 * 进入添加video页面
	 * 
	 */
	@RequestMapping(value = "/add-video.htm", method = RequestMethod.GET)
	public String addVideo(ModelMap modelMap, String state, Long videoFactoryId, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie("jsessinid", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		modelMap.put("state", state);
		modelMap.put("JSESSIONID", request.getSession().getId());
		MySessionContext.getInstance().AddSession(request.getSession());
		VideoFactory videoFactory = null;
		if(videoFactoryId != null) {
			videoFactory = videoService.getVideoById(videoFactoryId);
		} else {
			videoFactory = new VideoFactory();
		}
		modelMap.put("videoFactory", videoFactory);
		return "system/video/add-videoUpload";
	}
	
	/**
	 * 进入添加video页面
	 * 
	 */
	@RequestMapping(value = "/save-videoFactory.htm", method = RequestMethod.POST)
	public String saveVideoFactory(ModelMap modelMap, VideoFactory videoFactory, HttpServletRequest request, HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
		if(videoFactory.getVideoFactoryId() != null) {
			videoFactory.setUpdateTime(new Date());
			videoFactory.setUpdateUser(admin.getName());
			videoService.updateVideoFactory(videoFactory);
		} else {
			videoFactory.setCreateTime(new Date());
			videoFactory.setCreateUser(admin.getName());
			videoService.saveVideoFactory(videoFactory);
		}
		
		return "redirect:/admin/video/add-video.htm?state=success"; 
	}
	
	/**
	 * 进入添加video页面
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/del-videoFactory.json", method = RequestMethod.POST)
	public Map<String, Object> delVideoFactory(ModelMap modelMap, @RequestParam(value = "videoFactoryId") long videoFactoryId, HttpServletRequest request, HttpServletResponse response) {
		try {
			VideoFactory videoFactory = new VideoFactory();
			videoFactory = videoService.getVideoById(videoFactoryId);
			videoService.deleteVideo(videoFactoryId);
			UploadUtils.deleteFile(videoFactory.getVideoUrl()); // 删除视频
			UploadUtils.deleteFile(videoFactory.getFrontCoverUrl()); // 删除图片
			this.map.put("success", true);
		} catch (Exception e) {
			this.map.put("success", false);
			this.map.put("msg", "删除失败");
			e.printStackTrace();
		}
		return this.map; 
	}
	
	/**
	 * 保存视频
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/save-video.json", method = RequestMethod.POST)
	public String saveVideo(@RequestParam(value = "file") MultipartFile file) {
		JSONObject json = new JSONObject();
		try {
			String uploadPath = videoService.uploadVideo(file);
			json.put("success", true);
			json.put("uploadPath", uploadPath);
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
		} 
		
		return json.toString();
	}
	
	/**
	 * 保存图片
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/save-picture.json", method = RequestMethod.POST)
	public String savePicture(@RequestParam(value = "file") MultipartFile file) {
		JSONObject json = new JSONObject();
		try {
			String uploadPath = videoService.uploadPicture(file);
			json.put("success", true);
			json.put("uploadPath", uploadPath);
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
		} 
		
		return json.toString();
	}
	
	/**
	 * 附件上传
	 */
	@ResponseBody
	@RequestMapping(value = "/save-file.json", method = RequestMethod.POST)
	public String saveFile(@RequestParam(value = "kindId") long kindId,
			@RequestParam(value = "kind") AttachmentConstant.Kind kind,
			@RequestParam(value = "file") MultipartFile file,
			HttpServletRequest request) {
		try {
			attachmentService.addUploadFile(file, file.getOriginalFilename(),
					kindId, kind, AttachmentConstant.Status.display);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (UploadException e) {
			e.printStackTrace();
		}
		JSONObject json = new JSONObject();
		return json.toString();
	}
}
