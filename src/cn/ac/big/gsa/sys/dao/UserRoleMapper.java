package cn.ac.big.gsa.sys.dao;

import java.util.List;

import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.UserRoleBean;


public interface UserRoleMapper {
	int insert(int userId,int roleId);
	List<RoleBean> findRolesByUserId(int userId);
	List<UserRoleBean> selectUserRoleByRoleId(int roleId);
	List<UserRoleBean> selectUserRoleByUserId(int userId);
	int deleteUserRoleByRoleId(int roleId);
	int deleteUserRoleByUserId(int userId);
	int insertUserRole(UserRoleBean userRole);
}
