package com.shishuo.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shishuo.cms.dao.RoleDao;
import com.shishuo.cms.entity.Role;
import com.shishuo.cms.entity.vo.PageVo;

/**
 * 角色
 * 
 * @author mxx
 * 
 */
@Service
public class RoleService {

	@Autowired
	private RoleDao roleDao;
	
	/**
	 * 删除
	 * 
	 * @param adminId
	 * @return Integer
	 */
	public int deleteRole(long roleId) {
		return roleDao.deleteRole(roleId);
	}

	/**
	 * 保存
	 * 
	 * @param role
	 */
	public void saveRole(Role role) {
		roleDao.saveRole(role);
	}
	
	/**
	 * 更新
	 * 
	 * @param role
	 */
	public void updateRole(Role role) {
		roleDao.updateRole(role);
	}
	
	/**
	 * 通过Id获得指定角色
	 */
	public Role getRoleById(long roleId) {
		return roleDao.getRoleById(roleId);
	}

	/**
	 * 获得所有角色的分页数据
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Role>
	 */
	public List<Role> getAllList(long offset, long rows) {
		return roleDao.getAllList(offset, rows);
	}

	/**
	 * 获得所有角色的数量
	 * 
	 * @return Integer
	 */
	public int getAllListCount() {
		return roleDao.getAllListCount();
	}

	/**
	 * 获得所有角色的分页
	 * 
	 * @param Integer
	 * @return PageVo<Role>
	 */
	public PageVo<Role> getAllListPage(int pageNum) {
		PageVo<Role> pageVo = new PageVo<Role>(pageNum);
		List<Role> list = this.getAllList(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}
	
	public List<Role> findAll() {
		return roleDao.findAll();
	}

}
