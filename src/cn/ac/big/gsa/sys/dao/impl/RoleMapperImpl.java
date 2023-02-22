package cn.ac.big.gsa.sys.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.ac.big.gsa.sys.dao.RoleMapper;
import cn.ac.big.gsa.sys.pojo.RoleBean;

public class RoleMapperImpl extends SqlSessionDaoSupport implements RoleMapper{

	@Override
	public List<RoleBean> getAllRoleList() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.RoleMapper.selecrolenodel";
		return getSqlSessionTemplate().selectList(statement);
	}

	@Override
	public RoleBean selectRoleByRoleName(String roleName) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.RoleMapper.selectRoleByRoleName";
		return (RoleBean)getSqlSessionTemplate().selectOne(statement,roleName);
	}

//	@Override
//	public List<RoleBean> selectrolenodel() {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public List<RoleBean> selectrolelist() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int insertRole(RoleBean role) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.RoleMapper.insert";
		return getSqlSessionTemplate().insert(statement,role);
	}

	@Override
	public int updateRole(RoleBean role) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.RoleMapper.updateRole";
		return getSqlSessionTemplate().update(statement,role);
	}

	@Override
	public int deleteRole(RoleBean role) {
		// TODO Auto-generated method stub
		String statement="cn.ac.big.gsa.sys.dao.RoleMapper.deleteRole";
		return getSqlSessionTemplate().update(statement,role);
	}

	@Override
	public RoleBean selectRoleByRoleId(int roleId) {
		// TODO Auto-generated method stub
		String statement="cn.ac.big.gsa.sys.dao.RoleMapper.selectByPrimaryKey";
		return (RoleBean) getSqlSessionTemplate().selectOne(statement,roleId);
	}

	@Override
	public List<Integer> findAssignedRoleIdsByUserId(int userId) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.RoleMapper.findAssignedRoleIdsByUserId";
		return getSqlSessionTemplate().selectList(statement,userId);
	}

	@Override
	public List<RoleBean> selectRoleByUserId(int userId) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.RoleMapper.selectRoleByUserId";
		return getSqlSessionTemplate().selectList(statement,userId);
	}

	

}
