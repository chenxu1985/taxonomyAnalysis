package cn.ac.big.gsa.sys.service.impl;

import java.util.List;

import cn.ac.big.gsa.sys.dao.RoleMapper;
import cn.ac.big.gsa.sys.dao.UserRoleMapper;
import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.UserRoleBean;
import cn.ac.big.gsa.sys.service.RoleService;

public class RoleServiceImpl implements RoleService{
	
	private UserRoleMapper userRoleMapper;
	private RoleMapper roleMapper;
	@Override
	public List<RoleBean> findRolesByUserId(int userId) {
		// TODO Auto-generated method stub
		return this.userRoleMapper.findRolesByUserId(userId);
	}

	@Override
	public List<RoleBean> getAllRoleList() {
		// TODO Auto-generated method stub
		return this.roleMapper.getAllRoleList();
	}
	@Override
	public RoleBean selectRoleByRoleName(String roleName) {
		// TODO Auto-generated method stub
		return this.roleMapper.selectRoleByRoleName(roleName);
	}
//	@Override
//	public List<RoleBean> selecrolenodel() {
//		// TODO Auto-generated method stub
//		return this.roleMapper.selectrolenodel();
//	}
//	@Override
//	public List<RoleBean> selecrolelist() {
//		// TODO Auto-generated method stub
//		return this.roleMapper.selectrolelist();
//	}
	@Override
	public RoleBean selectRoleByRoleId(int roleId) {
		// TODO Auto-generated method stub
		return this.roleMapper.selectRoleByRoleId(roleId);
	}
	@Override
	public int insertRole(RoleBean role) {
		// TODO Auto-generated method stub
		return this.roleMapper.insertRole(role);
	}
	@Override
	public int updateRole(RoleBean role) {
		// TODO Auto-generated method stub
		return this.roleMapper.updateRole(role);
	}
	@Override
	public int deleteRole(RoleBean role) {
		// TODO Auto-generated method stub
		return this.roleMapper.deleteRole(role);
	}
	@Override
	public List<UserRoleBean> selectUserRoleByRoleId(int roleId) {
		// TODO Auto-generated method stub
		return this.userRoleMapper.selectUserRoleByRoleId(roleId);
	}
	@Override
	public List<UserRoleBean> selectUserRoleByUserId(int userId) {
		// TODO Auto-generated method stub
		return this.userRoleMapper.selectUserRoleByUserId(userId);
	}
	@Override
	public int deleteUserRoleByRoleId(int roleId) {
		// TODO Auto-generated method stub
		return this.userRoleMapper.deleteUserRoleByRoleId(roleId);
	}
	@Override
	public int deleteUserRoleByUserId(int userId) {
		// TODO Auto-generated method stub
		return this.userRoleMapper.deleteUserRoleByUserId(userId);
	}
	@Override
	public int insertUserRole(UserRoleBean userRoleBean) {
		// TODO Auto-generated method stub
		return this.userRoleMapper.insertUserRole(userRoleBean);
	}
	@Override
	public List<Integer> findAssignedRoleIdsByUserId(int userId) {
		// TODO Auto-generated method stub
		return this.roleMapper.findAssignedRoleIdsByUserId(userId);
	}
	
	
	public RoleMapper getRoleMapper() {
		return roleMapper;
	}
	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleMapper = roleMapper;
	}

	public UserRoleMapper getUserRoleMapper() {
		return userRoleMapper;
	}
	public void setUserRoleMapper(UserRoleMapper userRoleMapper) {
		this.userRoleMapper = userRoleMapper;
	}

	@Override
	public List<RoleBean> selectRoleByUserId(int userId) {
		// TODO Auto-generated method stub
		return this.roleMapper.selectRoleByUserId(userId);
	}




}
