/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.entity;

import java.io.Serializable;
import java.util.Date;

import com.shishuo.cms.constant.AdminConstant;
import com.shishuo.cms.util.Marker;

/**
 * 管理员实体
 * 
 * @author Administrator
 * 
 */

public class Admin extends Marker implements Serializable{

	private static final long serialVersionUID = 1L;

	/**
	 * 管理员Id
	 */
	private long adminId;

	/**
	 * 邮箱地址
	 */
	private String email;

	/**
	 * 管理员名称
	 */
	private String name;

	/**
	 * 密码
	 */
	private String password;
	
	private String roleId;
	
	private String role;

	/**
	 * 状态
	 */
	private AdminConstant.Status status;

	/**
	 * 时间
	 */
	 private String createUser;
	 
    private Date createTime; //时间
    
    private String updateUser;
    
    private Date updateTime;

	public long getAdminId() {
		return adminId;
	}

	public void setAdminId(long adminId) {
		this.adminId = adminId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public AdminConstant.Status getStatus() {
		return status;
	}

	public void setStatus(AdminConstant.Status status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}
