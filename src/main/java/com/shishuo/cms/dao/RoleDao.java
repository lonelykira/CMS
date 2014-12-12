package com.shishuo.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shishuo.cms.entity.Role;

/**
 * 角色
 * 
 * @author mxx
 */

@Repository
public interface RoleDao {

	/**
	 * 添加角色
	 * 
	 * @param Role
	 * @return Integer
	 * 
	 */
	public int saveRole(Role role);

	/**
	 * 删除角色
	 * 
	 * @param roleId
	 * @return Integer
	 * 
	 */
	public int deleteRole(long roleId);

	/**
	 * 修改角色资料
	 * 
	 * @param Adin
	 * @return Integer
	 * 
	 */
	public int updateRole(Role role);

	/**
	 * 获取所有角色列表
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Role>
	 * 
	 */
	public List<Role> getAllList(@Param("offset") long offset, @Param("rows") long rows);

	/**
	 * 获取所有角色的数量
	 * 
	 * @return Integer
	 * 
	 */
	public int getAllListCount();

	/**
	 * 通过Id获得指定角色资料
	 * 
	 * @param roleId
	 * @return Role
	 */
	public Role getRoleById(@Param("roleId") long roleId);
	
	public List<Role> findAll();

}
