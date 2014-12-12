/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shishuo.cms.dao.MainVideoDao;
import com.shishuo.cms.entity.MainVideo;
import com.shishuo.cms.entity.vo.PageVo;

/**
 * 视频
 * 
 * @author mxx
 * 
 */
@Service
public class MainVideoService {

	@Autowired
	private MainVideoDao mainVideoDao;
	
	/**
	 * 删除视频
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public int deleteVideo(long mid) {
		return mainVideoDao.deleteMainVideo(mid);
	}

	/**
	 * 保存
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public void saveMainVideo(MainVideo mainVideo) {
		mainVideoDao.addMainVideo(mainVideo);
	}
	
	/**
	 * 更新
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public void updateMainVideo(MainVideo mainVideo) {
		mainVideoDao.updateMainVideo(mainVideo);
	}
	
	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 通过Id获得指定视频资料
	 */
	public MainVideo getMainVideoById(long mid) {
		return mainVideoDao.getMainVideoById(mid);
	}

	/**
	 * 获得所有视频的分页数据
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Video>
	 */
	public List<MainVideo> getAllList(long offset, long rows) {
		return mainVideoDao.getAllList(offset, rows);
	}

	/**
	 * 获得所有视频的数量
	 * 
	 * @return Integer
	 */
	public int getAllListCount() {
		return mainVideoDao.getAllListCount();
	}

	/**
	 * 获得所有视频的分页
	 * 
	 * @param Integer
	 * @return PageVo<Video>
	 */
	public PageVo<MainVideo> getAllListPage(int pageNum) {
		PageVo<MainVideo> pageVo = new PageVo<MainVideo>(pageNum);
		pageVo.setRows(10);
		List<MainVideo> list = this
				.getAllList(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}

}
