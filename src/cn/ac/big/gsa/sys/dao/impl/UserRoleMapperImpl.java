package cn.ac.big.gsa.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.ac.big.gsa.sys.dao.UserRoleMapper;
import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.UserRoleBean;

public class UserRoleMapperImpl extends SqlSessionDaoSupport implements UserRoleMapper{

	@Override
	public int insert(int userId, int roleId) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("userId", userId);
		map.put("roleId", roleId);
		return getSqlSessionTemplate().insert("cn.ac.big.gsa.sys.dao.UserRoleMapper.insertuserrole",map);
	}

	@Override
	public List<RoleBean> findRolesByUserId(int userId) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.UserRoleMapper.findRolesByUserId";
		return getSqlSessionTemplate().selectList(statement,userId);
	}
	
	@Override
	public List<UserRoleBean> selectUserRoleByRoleId(int roleId) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.UserRoleMapper.selectUserRoleByRoleId";
		return getSqlSessionTemplate().selectList(statement,roleId);
	}

	@Override
	public List<UserRoleBean> selectUserRoleByUserId(int userId) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.UserRoleMapper.selectUserRoleByUserId";
		return getSqlSessionTemplate().selectList(statement,userId);
	}

	@Override
	public int deleteUserRoleByRoleId(int roleId) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.UserRoleMapper.deleteByRoleId";
		return getSqlSessionTemplate().delete(statement,roleId);
	}

	@Override
	public int deleteUserRoleByUserId(int userId) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.UserRoleMapper.deleteByUserId";
		return getSqlSessionTemplate().delete(statement,userId);
	}

	@Override
	public int insertUserRole(UserRoleBean userRole) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.UserRoleMapper.insertuserrole";
		return getSqlSessionTemplate().insert(statement,userRole);
	}

}
