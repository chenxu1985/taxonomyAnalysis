package cn.ac.big.gsa.sys.dao;

import java.util.List;

import cn.ac.big.gsa.sys.pojo.RoleBean;

public interface RoleMapper {
	List<RoleBean> getAllRoleList();
	List<RoleBean> selectRoleByUserId(int userId);
	RoleBean selectRoleByRoleName(String roleName);
	RoleBean selectRoleByRoleId(int roleId);
//	List<RoleBean> selectrolenodel();
//	List<RoleBean> selectrolelist();
	int insertRole(RoleBean role);
	int updateRole(RoleBean role);
	int deleteRole(RoleBean role);
//	List<UserRoleBean> selectUserRoleByRoleId(int roleId);
//	List<UserRoleBean> selectUserRoleByUserId(int userId);
//	int deleteUserRoleByRoleId(int roleId);
//	int deleteUserRoleByUserId(int userId);
//	int insertUserRole(UserRoleBean userRole);
	List<Integer> findAssignedRoleIdsByUserId(int userId);
}
