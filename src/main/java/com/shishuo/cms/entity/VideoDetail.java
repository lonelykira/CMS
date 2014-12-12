package com.shishuo.cms.entity;

import java.io.Serializable;

public class VideoDetail extends BaseEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	private Long vid;
	private Long mid;
	private String title;
	private String imageurl; // 缩略图地址
	private String videourl; // 视频地址
	private String tag; // 标签
	private Long up; // 顶
	private Long down; // 踩
	private Long record; //播放数
	private String introduction; // 简介
	private String status; // 状态
	public Long getVid() {
		return vid;
	}
	public void setVid(Long vid) {
		this.vid = vid;
	}
	public Long getMid() {
		return mid;
	}
	public void setMid(Long mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public String getVideourl() {
		return videourl;
	}
	public void setVideourl(String videourl) {
		this.videourl = videourl;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Long getUp() {
		return up;
	}
	public void setUp(Long up) {
		this.up = up;
	}
	public Long getDown() {
		return down;
	}
	public void setDown(Long down) {
		this.down = down;
	}
	public Long getRecord() {
		return record;
	}
	public void setRecord(Long record) {
		this.record = record;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
