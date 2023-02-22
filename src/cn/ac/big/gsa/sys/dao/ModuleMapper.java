package cn.ac.big.gsa.sys.dao;

import java.util.List;
import cn.ac.big.gsa.sys.pojo.Module;
import cn.ac.big.gsa.sys.pojo.RoleModuleBean;

public interface ModuleMapper {
	List<Module> getAllModuleList();
	List<RoleModuleBean> getAllRoleModuleList();
	int truncateRoleMoudle();
	int insertRoleModule(RoleModuleBean roleModuleBean);
	List<Module> getModulesByRoleId(int roleId);
}
