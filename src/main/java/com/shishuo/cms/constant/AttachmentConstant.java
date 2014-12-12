/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.constant;

/**
 * 附件
 * 
 * @author Herbert
 * 
 */
public class AttachmentConstant {

	/**
	 * 类型<br>
	 * photo：照片<br>
	 * file：文件<br>
	 * 
	 * @author Herbert
	 * 
	 */
	public static enum Type {
		/**
		 * 相册
		 */
		picture, 
		/**
		 * 文件
		 */
		file,
		/**
		 * 视频
		 */
		video
	}

	/**
	 * 种类
	 * 
	 * @author Herbert
	 * 
	 */
	public static enum Kind {
		folder, article
	}

	public static enum Status {
		/**
		 * 隐藏是嵌入文章的
		 */
		hidden, /**
		 * 没有嵌入文章的
		 */
		display
	}
}
