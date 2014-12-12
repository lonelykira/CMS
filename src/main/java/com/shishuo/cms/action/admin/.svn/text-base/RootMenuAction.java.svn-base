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
import com.shishuo.cms.service.MenuService;
import com.shishuo.cms.util.SpringContextUtil;



@Controller
@RequestMapping("/admin/menu")
public class RootMenuAction extends AdminBaseAction{
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * 进入menu列表页面
	 * 
	 */
	@RequestMapping(value = "/menu-list.htm", method = {RequestMethod.POST, RequestMethod.GET})
	public String menuList(@RequestParam(value = "p", defaultValue = "1") int pageNum, String state, ModelMap modelMap) {
		modelMap.put("pageVo", menuService.getAllListPage(pageNum));
		return "system/menu/menu-list";
	}
	
	/**
	 * 添加menu页面
	 * 
	 */
	@RequestMapping(value = "/add-menu.htm", method = RequestMethod.GET)
	public String addMenu(ModelMap modelMap, String state, Long menuId) {
		MenuService menuService = (MenuService)SpringContextUtil.getBean("menuService");
		List<Menu> parentmenus = menuService.getParentMenus();
		Menu menu = null;
		if(menuId != null) {
			menu = menuService.getMenuById(menuId);
		} else {
			menu = new Menu();
		}
		modelMap.put("parentmenus", parentmenus);
		modelMap.put("rootmenu", menu);
		modelMap.put("state", state);
		return "system/menu/add-menu";
	}
	
	/**
	 * save菜单
	 * 
	 */
	@RequestMapping(value = "/save-menu.htm", method = RequestMethod.POST)
	public String saveMenu(ModelMap modelMap, Menu menu, HttpServletRequest request, HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
		Long menuId = menu.getMenuId(); 
		if(menu.getMenuId() != null) {
			menu.setUpdateTime(new Date());
			menu.setUpdateUser(admin.getName());
			menuService.updateMenu(menu);
		} else {
			menu.setStatus(1);
			menu.setCreateTime(new Date());
			menu.setCreateUser(admin.getName());
			menuService.saveMenu(menu);
		}
		if(menuId == null) {
			return "redirect:/admin/menu/add-menu.htm?state=success"; 
		} else {
			return "redirect:/admin/menu/menu-list.htm?state=success"; 
		}
		
	}
	
	/**
	 * 删除
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/del-menu.json", method = RequestMethod.POST)
	public String delMenu(ModelMap modelMap, @RequestParam(value = "menuId") long menuId, HttpServletRequest request, HttpServletResponse response) {
		try {
			menuService.deleteMenu(menuId);
			this.json.put("success", true);
		} catch (Exception e) {
			this.json.put("success", false);
			this.json.put("msg", "删除失败");
			e.printStackTrace();
		}
		return this.json.toString(); 
	}
	
}
