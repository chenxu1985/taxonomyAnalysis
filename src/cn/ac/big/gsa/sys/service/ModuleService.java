package cn.ac.big.gsa.sys.service;

import java.util.List;

import cn.ac.big.gsa.sys.pojo.Module;
import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.RoleModuleBean;

public interface ModuleService {
	List<Module> getAllModuleList();
	List<RoleModuleBean> getAllRoleModuleList();
	int truncateRoleMoudle();
	int insertRoleModule(RoleModuleBean roleModuleBean);
	List<Module> getModulesByRoleId(int roleId);
	List<Module> getModulesByRoles(List<RoleBean> roles);
	
}
