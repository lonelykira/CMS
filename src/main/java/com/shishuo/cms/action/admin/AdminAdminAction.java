/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.action.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shishuo.cms.constant.AdminConstant;
import com.shishuo.cms.constant.SystemConstant;
import com.shishuo.cms.entity.Admin;
import com.shishuo.cms.entity.vo.JsonVo;
import com.shishuo.cms.service.RoleService;

/**
 * 管理员action
 * 
 * @author Zhangjiale
 * 
 */
@Controller
@RequestMapping("/admin/admin")
public class AdminAdminAction extends AdminBaseAction {
	
	@Autowired
	protected RoleService roleService;

	/**
	 * 进入添加admin页面
	 * 
	 */
	@RequestMapping(value = "/add.htm", method = RequestMethod.GET)
	public String addUser(ModelMap modelMap) {
		modelMap.put("adminName", "");
		modelMap.put("email", "");
		return "system/admin/add";
	}

	/**
	 * 
	 * 进入管理员管理页面
	 */
	@RequestMapping(value = "/manage.htm", method = RequestMethod.GET)
	public String manage(@RequestParam(value = "p", defaultValue = "1") int pageNum, ModelMap modelMap) {
		modelMap.put("pageVo", adminService.getAllListPage(pageNum));
		modelMap.put("roles", roleService.findAll());
		
		return "system/admin/manage";
	}

	/**
	 * 添加Admin
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/addNew.json", method = RequestMethod.POST)
	public Map<String, Object> addNewUser(@RequestParam(value = "adminName") String adminName,
									@RequestParam(value = "email") String email,
									@RequestParam(value = "password") String password,
									@RequestParam(value = "roleId") String roleId,
									@RequestParam(value = "role") String role) {

		Admin admin = adminService.getAdminByEmail(email);
		try {
			if (adminName.equals("")) {
				this.map.put("msg", "管理员名称不能为空");
				return this.map;
			}
			if (email.equals("")) {
				this.map.put("msg", "管理员邮箱不能为空");
				return this.map;
			} else {
				if (admin != null) {
					this.map.put("msg", "管理员邮箱不能重复");
					return this.map;
				}
			}
			if (StringUtils.isBlank(password)) {
				this.map.put("msg", "管理员密码不能为空");
				return this.map;
			} else if (password.length() < 6) {
				this.map.put("msg", "密码不能小于6位");
				return this.map;
			} else if (password.length() > 16) {
				this.map.put("msg", "密码不能大于16位");
				return this.map;
			}
			if (roleId.equals("")) {
				this.map.put("msg", "角色不能为空");
				return this.map;
			}
			adminService.addAdmin(email, adminName, password, roleId, role, AdminConstant.Status.init);
			this.map.put("result", true);
		} catch (Exception e) {
			this.map.put("result", false);
			this.map.put("msg", e.getMessage());
		}
		return this.map;
	}

	/**
	 * 进入管理员列表页面
	 * 
	 */
	@RequestMapping(value = "/page.htm", method = RequestMethod.GET)
	public String allList(
			@RequestParam(value = "p", defaultValue = "1") int pageNum,
			ModelMap modelMap) {
		modelMap.put("pageVo", adminService.getAllListPage(pageNum));
		return "system/admin/all";
	}

	/**
	 * 进入单个admmin页面
	 * 
	 */
	@RequestMapping(value = "/update.htm", method = RequestMethod.GET)
	public String update(
			@RequestParam(value = "adminId", defaultValue = "0") long adminId,
			ModelMap modelMap, HttpServletRequest request) {
		Admin sessionAdmin = this.getAdmin(request);
		Admin  admin = adminService.getAdminById(sessionAdmin.getAdminId());
		modelMap.put("admin", admin);
		return "system/admin/update";
	}

	/**
	 * 修改指定的admin资料
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/update.json", method = RequestMethod.POST)
	public JsonVo<String> updateAdmin(
			@RequestParam(value = "name") String name,
			@RequestParam(value = "password") String password,
			HttpServletRequest request) {

		JsonVo<String> json = new JsonVo<String>();
		try {

			if (StringUtils.isBlank(name)) {
				json.getErrors().put("name", "管理员名称不能为空");
			}
			if (name.length() > 15) {
				json.getErrors().put("name", "管理员名称不能大于15位");
			}
			if (StringUtils.isBlank(password)) {
				json.getErrors().put("password", "密码不能为空");
			}
			if (password.length() < 6) {
				json.getErrors().put("password", "密码不能小于6位数");
			}
			if (password.length() > 18) {
				json.getErrors().put("password", "密码不能大于18位数");
			}
			// 检测校验结果
			validate(json);
			Admin admin = (Admin) request.getSession().getAttribute(
					SystemConstant.SESSION_ADMIN);
			adminService.updateAdminByAmdinId(admin.getAdminId(), name,
					password);
			json.setResult(true);
		} catch (Exception e) {
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}

	/**
	 * 删除管理员
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/delete.json", method = RequestMethod.POST)
	public JsonVo<String> deleteAdmin(@RequestParam(value = "adminId") long adminId) {
		JsonVo<String> json = new JsonVo<String>();
		try {
			adminService.deleteAdmin(adminId);
			json.setResult(true);
		} catch (Exception e) {
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
}
