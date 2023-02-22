package cn.ac.big.gsa.sys.service;

import java.util.List;

import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.UserRoleBean;

public interface RoleService {
	List<RoleBean> findRolesByUserId(int userId);
	List<RoleBean> getAllRoleList();
	RoleBean selectRoleByRoleName(String roleName);
//	List<RoleBean> selecrolenodel();
//	List<RoleBean> selecrolelist();
	RoleBean selectRoleByRoleId(int roleId);
	int insertRole(RoleBean role);
	int updateRole(RoleBean role);
	int deleteRole(RoleBean role);
	List<UserRoleBean> selectUserRoleByRoleId(int roleId);
	List<UserRoleBean> selectUserRoleByUserId(int userId);
	int deleteUserRoleByRoleId(int roleId);
	int deleteUserRoleByUserId(int userId);
	int insertUserRole(UserRoleBean userRoleBean);
	List<Integer> findAssignedRoleIdsByUserId(int userId);
	List<RoleBean> selectRoleByUserId(int userId);
	
}
