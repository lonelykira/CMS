/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */
package com.shishuo.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shishuo.cms.entity.MainVideo;

/**
 * 视频
 * 
 * @author Zhangjiale
 */

@Repository
public interface MainVideoDao {

	// ///////////////////////////////
	// ///// 增加 ////////
	// ///////////////////////////////

	/**
	 * 添加视频
	 * 
	 * @param MainVideo
	 * @return Integer
	 * 
	 */
	public int addMainVideo(MainVideo mainVideo);

	// ///////////////////////////////
	// ///// 刪除 ////////
	// ///////////////////////////////

	/**
	 * 删除视频
	 * 
	 * @param mid
	 * @return Integer
	 * 
	 */
	public int deleteMainVideo(@Param("mid") long mid);

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
	public int updateMainVideo(MainVideo mainVideo);

	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 获取所有视频列表
	 * 
	 * @param offset
	 * @param rows
	 * @return List<MainVideo>
	 * 
	 */
	public List<MainVideo> getAllList(@Param("offset") long offset,
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
	 * @param mid
	 * @return MainVideo
	 */
	public MainVideo getMainVideoById(@Param("mid") long mid);

}
