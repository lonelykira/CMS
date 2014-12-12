/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.shishuo.cms.constant.AttachmentConstant;
import com.shishuo.cms.constant.SystemConstant;
import com.shishuo.cms.exception.UploadException;

/**
 * @author Herbert
 * 
 */
public class UploadUtils {

	/**
	 * 文件允许格式
	 */
	public static String[] FILE_TYPE = { ".rar", ".doc", ".docx", ".zip",
			".pdf", ".txt", ".swf", ".wmv" };

	/**
	 * 图片允许格式
	 */
	public static String[] PICTURE_TYPE = { ".gif", ".png", ".jpg", ".jpeg",
			".bmp" };
	
	/**
	 * 视频允许格式
	 */
	public static String[] VIDEO_TYPE = { ".mp4", ".avi", ".swf", ".flv",
			".rmvb" };

	public static boolean isFileType(String fileName, String[] typeArray) {
		for (String type : typeArray) {
			if (fileName.toLowerCase().endsWith(type)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 递归获得目录的所有地址
	 * 
	 * @param realpath
	 * @param files
	 * @param fileType
	 * @return
	 */
	public static List<java.io.File> getFiles(String realpath,
			List<File> files, String[] fileType) {
		File realFile = new File(realpath);
		if (realFile.isDirectory()) {
			File[] subfiles = realFile.listFiles();
			for (File file : subfiles) {
				if (file.isDirectory()) {
					getFiles(file.getAbsolutePath(), files, fileType);
				} else {
					if (isFileType(file.getName(), fileType)) {
						files.add(file);
					}
				}
			}
		}
		return files;
	}

	/**
	 * 得到文件上传的相对路径
	 * 
	 * @param fileName文件名
	 * @param type类型（图片/视频）           
	 * @return
	 */
	public static String getUploadPath(String fileName, long time, String type) {
		SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
		String uploadPath = "/upload/" + type + "/" + formater.format(new Date()) + "/"
				+ time + getFileExt(fileName);
		File dir = new File(SystemConstant.CMS_ROOT + uploadPath);
		if (!dir.exists()) {
			try {
				dir.mkdirs();
			} catch (Exception e) {
				e.printStackTrace();
				return "";
			}
		}
		return uploadPath;
	}

	/**
	 * 获取文件扩展名
	 * 
	 * @return string
	 */
	public static String getFileExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	/**
	 * 删除物理文件
	 * 
	 * @param path
	 */
	public static void deleteFile(String path) {
		File file = new File(SystemConstant.CMS_ROOT + path);
		file.delete();
	}
	
	/**
	 * 上传
	 * @param multipartFile 文件
	 * @param uploadType 类型
	 * @param uploadPath 上传路径
	 * @throws UploadException 
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@SuppressWarnings("unused")
	public static void uploadFile(MultipartFile multipartFile, String uploadType, String uploadPath) throws UploadException, IllegalStateException, IOException {
		String fileName = multipartFile.getOriginalFilename();
		AttachmentConstant.Type type;
		if (UploadUtils.isFileType(fileName, UploadUtils.PICTURE_TYPE)) {
			type = AttachmentConstant.Type.picture;
		} else if (UploadUtils.isFileType(fileName, UploadUtils.FILE_TYPE)) {
			type = AttachmentConstant.Type.file;
		} else if (UploadUtils.isFileType(fileName, UploadUtils.VIDEO_TYPE)) {
			type = AttachmentConstant.Type.file;
		}else {
			throw new UploadException("文件类型有误");
		}
		multipartFile.transferTo(new java.io.File(SystemConstant.CMS_ROOT + uploadPath));
	}

}
