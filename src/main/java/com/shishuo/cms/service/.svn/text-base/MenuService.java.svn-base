package com.shishuo.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shishuo.cms.dao.MenuDao;
import com.shishuo.cms.entity.Menu;
import com.shishuo.cms.entity.vo.PageVo;

/**
 * 菜单
 * 
 * @author mxx
 * 
 */
@Service("menuService")
public class MenuService {

	@Autowired
	private MenuDao menuDao;
	
	/**
	 * 删除
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public int deleteMenu(long menuId) {
		return menuDao.deleteMenu(menuId);
	}

	/**
	 * 保存
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public void saveMenu(Menu menu) {
		menuDao.saveMenu(menu);
	}
	
	/**
	 * 更新
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public void updateMenu(Menu menu) {
		menuDao.updateMenu(menu);
	}
	
	/**
	 * 通过Id获得指定菜单
	 */
	public Menu getMenuById(long menuId) {
		return menuDao.getMenuById(menuId);
	}

	/**
	 * 获得所有菜单的分页数据
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Menu>
	 */
	public List<Menu> getAllList(long offset, long rows) {
		return menuDao.getAllList(offset, rows);
	}
	
	/**
	 * 获得所有父菜单数据
	 * 
	 * @return List<Menu>
	 */
	public List<Menu> getParentMenus() {
		return menuDao.getParentMenus();
	}
	
	/**
	 * 获得所有子菜单数据
	 * 
	 * @return List<Menu>
	 */
	public List<Menu> getChildrenMenus(String menuId) {
		return menuDao.getChildrenMenus(menuId);
	}

	/**
	 * 获得所有菜单的数量
	 * 
	 * @return Integer
	 */
	public int getAllListCount() {
		return menuDao.getAllListCount();
	}

	/**
	 * 获得所有菜单的分页
	 * 
	 * @param Integer
	 * @return PageVo<Menu>
	 */
	public PageVo<Menu> getAllListPage(int pageNum) {
		PageVo<Menu> pageVo = new PageVo<Menu>(pageNum);
		List<Menu> list = this.getAllList(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}

}
