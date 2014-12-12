/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */
package com.shishuo.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shishuo.cms.entity.VideoFactory;

/**
 * 视频
 * 
 * @author Zhangjiale
 */

@Repository
public interface VideoDao {

	// ///////////////////////////////
	// ///// 增加 ////////
	// ///////////////////////////////

	/**
	 * 添加视频
	 * 
	 * @param VideoFactory
	 * @return Integer
	 * 
	 */
	public int addVideo(VideoFactory videoFactory);

	// ///////////////////////////////
	// ///// 刪除 ////////
	// ///////////////////////////////

	/**
	 * 删除视频
	 * 
	 * @param videoFactoryId
	 * @return Integer
	 * 
	 */
	public int deleteVideo(@Param("videoFactoryId") long videoFactoryId);

	// ///////////////////////////////
	// ///// 修改 ////////
	// ///////////////////////////////

	/**
	 * 修改视频资料
	 * 
	 * @param Adin
	 * @return Integer
	 * 
	 */
	public int updateVideo(VideoFactory videoFactory);

	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 获取所有视频列表
	 * 
	 * @param offset
	 * @param rows
	 * @return List<VideoFactory>
	 * 
	 */
	public List<VideoFactory> getAllList(@Param("offset") long offset,
			@Param("rows") long rows);

	/**
	 * 获取所有视频的数量
	 * 
	 * @return Integer
	 * 
	 */
	public int getAllListCount();

	/**
	 * 通过Id获得指定视频资料
	 * 
	 * @param videoFactoryId
	 * @return VideoFactory
	 */
	public VideoFactory getVideoFactoryById(@Param("videoFactoryId") long videoFactoryId);
	
	/**
	 * 根据主ID获取所有视频列表
	 * 
	 * @param offset
	 * @param rows
	 * @return List<VideoFactory>
	 * 
	 */
	public List<VideoFactory> getVideoListByMid(@Param("mid") long mid);

}
