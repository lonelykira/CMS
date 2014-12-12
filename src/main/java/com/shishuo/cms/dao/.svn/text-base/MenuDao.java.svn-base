package com.shishuo.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shishuo.cms.entity.Menu;

/**
 * 菜单
 * 
 * @author mxx
 */

@Repository
public interface MenuDao {

	/**
	 * 添加菜单
	 * 
	 * @param Menu
	 * @return Integer
	 * 
	 */
	public int saveMenu(Menu menu);

	/**
	 * 删除菜单
	 * 
	 * @param menuId
	 * @return Integer
	 * 
	 */
	public int deleteMenu(long menuId);

	/**
	 * 修改菜单资料
	 * 
	 * @param Adin
	 * @return Integer
	 * 
	 */
	public int updateMenu(Menu menu);

	/**
	 * 获取所有菜单列表
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Menu>
	 * 
	 */
	public List<Menu> getAllList(@Param("offset") long offset, @Param("rows") long rows);
	
	/**
	 * 获取所有父菜单列表
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Menu>
	 * 
	 */
	public List<Menu> getParentMenus();

	/**
	 * 获取所有菜单的数量
	 * 
	 * @return Integer
	 * 
	 */
	public int getAllListCount();

	/**
	 * 通过Id获得指定菜单资料
	 * 
	 * @param menuId
	 * @return Menu
	 */
	public Menu getMenuById(@Param("menuId") long menuId);
	
	/**
	 * 通过Id获得指定菜单资料
	 * 
	 * @param menuId
	 * @return Menu
	 */
	public List<Menu> getChildrenMenus(@Param("menuId") String menuId);

}
