/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */
package com.shishuo.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shishuo.cms.entity.VideoDetail;

/**
 * 视频
 * 
 * @author Zhangjiale
 */

@Repository
public interface VideoDetailDao {

	/**
	 * 添加视频
	 * 
	 * @param VideoDetail
	 * @return Long
	 * 
	 */
	public int saveVideo(VideoDetail entity);

	/**
	 * 删除视频
	 * 
	 * @param mid
	 * @return Long
	 * 
	 */
	public int deleteVideos(@Param("mid") long mid);

	/**
	 * 根据主ID获取所有视频列表
	 * @param mid
	 * @return List<VideoDetail>
	 */
	public List<VideoDetail> getVideoListByMid(@Param("mid") long mid);

}
