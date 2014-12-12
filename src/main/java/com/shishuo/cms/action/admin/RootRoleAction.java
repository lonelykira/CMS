package com.shishuo.cms.action.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shishuo.cms.constant.SystemConstant;
import com.shishuo.cms.entity.Admin;
import com.shishuo.cms.entity.Menu;
import com.shishuo.cms.entity.Role;
import com.shishuo.cms.service.MenuService;
import com.shishuo.cms.service.RoleService;



@Controller
@RequestMapping("/admin/role")
public class RootRoleAction extends AdminBaseAction{
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * 进入role列表页面
	 * 
	 */
	@RequestMapping(value = "/role-list.htm", method = {RequestMethod.POST, RequestMethod.GET})
	public String roleList(@RequestParam(value = "p", defaultValue = "1") int pageNum, ModelMap modelMap) {
		modelMap.put("pageVo", roleService.getAllListPage(pageNum));
		return "system/role/role-list";
	}
	
	/**
	 * 添加role页面
	 * 
	 */
	@RequestMapping(value = "/add-role.htm", method = RequestMethod.GET)
	public String addRole(ModelMap modelMap, String state, Long roleId, HttpServletRequest request, HttpServletResponse response) {
		modelMap.put("state", state);
		Role role = null;
		if(roleId != null) {
			role = roleService.getRoleById(roleId);
		} else {
			role = new Role();
		}
		List<Menu> menus = menuService.getParentMenus();
		for(Menu menu : menus) {
			List<Menu> childrenMenus = menuService.getChildrenMenus(String.valueOf(menu.getMenuId()));
			menu.setChilds(childrenMenus);
		}
		modelMap.put("role", role);
		modelMap.put("menus", menus);
		
		return "system/role/add-role";
	}
	
	/**
	 * save菜单
	 * 
	 */
	@RequestMapping(value = "/save-role.htm", method = RequestMethod.POST)
	public String saveRole(ModelMap modelMap, Role role, HttpServletRequest request, HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
		if(role.getRoleId() != null) {
			role.setUpdateTime(new Date());
			role.setUpdateUser(admin.getName());
			roleService.updateRole(role);
		} else {
			role.setCreateTime(new Date());
			role.setCreateUser(admin.getName());
			roleService.saveRole(role);
		}
		
		return "redirect:/admin/role/add-role.htm?state=success"; 
	}
	
	/**
	 * 删除
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/del-role.json", method = RequestMethod.POST)
	public String delRole(ModelMap modelMap, @RequestParam(value = "roleId") long roleId, HttpServletRequest request, HttpServletResponse response) {
		try {
			roleService.deleteRole(roleId);
			this.json.put("success", true);
		} catch (Exception e) {
			this.json.put("success", false);
			this.json.put("msg", "删除失败");
			e.printStackTrace();
		}
		return this.json.toString(); 
	}
	
}
