/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shishuo.cms.dao.VideoDetailDao;
import com.shishuo.cms.entity.Admin;
import com.shishuo.cms.entity.VideoDetail;

/**
 * 视频
 * 
 * @author mxx
 * 
 */
@Service
public class VideoDetailService {

	@Autowired
	private VideoDetailDao videoDetailDao;
	
	/**
	 * 删除视频
	 * 
	 * @param mid
	 * @return Integer
	 */
	public int deleteVideos(long mid) {
		return videoDetailDao.deleteVideos(mid);
	}

	/**
	 * 保存
	 * 
	 * @param videos
	 */
	public void saveMainVideo(String videosJson, Admin admin, Long mid) {
		videoDetailDao.deleteVideos(mid);
		JSONArray jsonArray = JSONArray.fromObject(videosJson);
		for(int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			VideoDetail videoDetail = new VideoDetail();
			videoDetail = (VideoDetail)JSONObject.toBean(jsonObject, VideoDetail.class);
			videoDetail.setCreateUser(admin.getName());
			videoDetail.setCreateTime(new Date());
			videoDetailDao.saveVideo(videoDetail);
		}
			
	}
	
	/**
	 * 获得所有视频的分页数据
	 * 
	 * @param mid
	 * @return List<VideoDetail>
	 */
	public List<VideoDetail> getVideoDetailList(long mid) {
		return videoDetailDao.getVideoListByMid(mid);
	}

	

}
