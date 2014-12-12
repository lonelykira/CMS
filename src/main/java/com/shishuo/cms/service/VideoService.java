/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shishuo.cms.constant.AttachmentConstant;
import com.shishuo.cms.constant.SystemConstant;
import com.shishuo.cms.dao.AttachmentDao;
import com.shishuo.cms.dao.VideoDao;
import com.shishuo.cms.entity.Attachment;
import com.shishuo.cms.entity.VideoFactory;
import com.shishuo.cms.entity.vo.PageVo;
import com.shishuo.cms.exception.AuthException;
import com.shishuo.cms.exception.UploadException;
import com.shishuo.cms.util.UploadUtils;

/**
 * 视频
 * 
 * @author mxx
 * 
 */
@Service
public class VideoService {

	@Autowired
	private VideoDao videoDao;
	
	@Autowired
	private AttachmentDao attachmentDao;

	/**
	 * 添加图片
	 * 
	 * @param email
	 * @param name
	 * @param password
	 * @return Video
	 * @throws UploadException 
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	public String uploadVideo(MultipartFile multipartFile) throws AuthException, UploadException, IllegalStateException, IOException {
		AttachmentConstant.Type type = AttachmentConstant.Type.video;
		String fileName = multipartFile.getOriginalFilename();
		Date now = new Date();
		String uploadPath = UploadUtils.getUploadPath(fileName, now.getTime(), SystemConstant.VIDEO);
		Attachment attachment = new Attachment();
		//attachment.setKindId(kindId);
		attachment.setDescription("");
		attachment.setName(fileName);
		attachment.setPath(uploadPath);
		attachment.setType(type);
		attachment.setLink("javascript:void(0);");
		attachment.setSize(multipartFile.getSize());
		//attachment.setKind(kind);
		//attachment.setStatus(status);
		attachment.setCreateTime(now);
		UploadUtils.uploadFile(multipartFile, SystemConstant.VIDEO, uploadPath);
		attachmentDao.addAttachment(attachment);
		//videoDao.addVideo(video);
		return uploadPath;
	}
	
	/**
	 * 添加视频
	 * 
	 * @param email
	 * @param name
	 * @param password
	 * @return Video
	 * @throws UploadException 
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	public String uploadPicture(MultipartFile multipartFile) throws AuthException, UploadException, IllegalStateException, IOException {
		String fileName = multipartFile.getOriginalFilename();
		AttachmentConstant.Type type = AttachmentConstant.Type.picture;
		Date now = new Date();
		String uploadPath = UploadUtils.getUploadPath(fileName, now.getTime(), SystemConstant.PICTURE);
		Attachment attachment = new Attachment();
		attachment.setName(fileName);
		attachment.setPath(uploadPath);
		attachment.setType(type);
		attachment.setLink("javascript:void(0);");
		attachment.setSize(multipartFile.getSize());
		attachment.setCreateTime(now);
		UploadUtils.uploadFile(multipartFile, SystemConstant.PICTURE, uploadPath);
		attachmentDao.addAttachment(attachment);
		//videoDao.addVideo(video);
		return uploadPath;
	}

	// ///////////////////////////////
	// ///// 刪除 ////////
	// ///////////////////////////////

	/**
	 * 删除视频
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public int deleteVideo(long videoFactoryId) {
		return videoDao.deleteVideo(videoFactoryId);
	}

	/**
	 * 保存
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public void saveVideoFactory(VideoFactory video) {
		videoDao.addVideo(video);
	}
	
	/**
	 * 更新
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public void updateVideoFactory(VideoFactory video) {
		videoDao.updateVideo(video);
	}
	
	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 通过Id获得指定视频资料
	 */
	public VideoFactory getVideoById(long videoFactoryId) {
		return videoDao.getVideoFactoryById(videoFactoryId);
	}

	/**
	 * 获得所有视频的分页数据
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Video>
	 */
	public List<VideoFactory> getAllList(long offset, long rows) {
		return videoDao.getAllList(offset, rows);
	}

	/**
	 * 获得所有视频的数量
	 * 
	 * @return Integer
	 */
	public int getAllListCount() {
		return videoDao.getAllListCount();
	}

	/**
	 * 获得所有视频的分页
	 * 
	 * @param Integer
	 * @return PageVo<Video>
	 */
	public PageVo<VideoFactory> getAllListPage(int pageNum) {
		PageVo<VideoFactory> pageVo = new PageVo<VideoFactory>(pageNum);
		pageVo.setRows(10);
		List<VideoFactory> list = this
				.getAllList(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}

	/**
	 * 获得所有视频的分页数据
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Video>
	 */
	public List<VideoFactory> getVideoListByMid(long mid) {
		return videoDao.getVideoListByMid(mid);
	}
}
