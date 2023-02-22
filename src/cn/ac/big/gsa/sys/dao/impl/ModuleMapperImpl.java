package cn.ac.big.gsa.sys.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.ac.big.gsa.sys.dao.ModuleMapper;
import cn.ac.big.gsa.sys.pojo.Module;
import cn.ac.big.gsa.sys.pojo.RoleModuleBean;

public class ModuleMapperImpl extends SqlSessionDaoSupport implements ModuleMapper{

	@Override
	public List<Module> getAllModuleList() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.ModuleMapper.getAllModuleList";
		return getSqlSessionTemplate().selectList(statement);
	}

	@Override
	public List<RoleModuleBean> getAllRoleModuleList() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.ModuleMapper.getAllRoleModuleList";
		return getSqlSessionTemplate().selectList(statement);
	}

	@Override
	public int truncateRoleMoudle() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.ModuleMapper.truncateRoleMoudle";
		return getSqlSessionTemplate().update(statement);
	}

	@Override
	public int insertRoleModule(RoleModuleBean roleModuleBean) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.ModuleMapper.insertRoleModule";
		return getSqlSessionTemplate().insert(statement,roleModuleBean);
	}

	@Override
	public List<Module> getModulesByRoleId(int roleId) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.sys.dao.ModuleMapper.getModulesByRoleId";
		return getSqlSessionTemplate().selectList(statement,roleId);
	}

}
