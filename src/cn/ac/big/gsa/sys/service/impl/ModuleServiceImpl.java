package cn.ac.big.gsa.sys.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.ac.big.gsa.sys.dao.ModuleMapper;
import cn.ac.big.gsa.sys.pojo.Module;
import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.RoleModuleBean;
import cn.ac.big.gsa.sys.service.ModuleService;

public class ModuleServiceImpl implements ModuleService{

	private ModuleMapper moduleMapper;
	@Override
	public List<Module> getAllModuleList() {
		// TODO Auto-generated method stub
		return this.moduleMapper.getAllModuleList();
	}

	@Override
	public List<RoleModuleBean> getAllRoleModuleList() {
		// TODO Auto-generated method stub
		return this.moduleMapper.getAllRoleModuleList();
	}

	@Override
	public int truncateRoleMoudle() {
		// TODO Auto-generated method stub
		return this.moduleMapper.truncateRoleMoudle();
	}

	@Override
	public int insertRoleModule(RoleModuleBean roleModuleBean) {
		// TODO Auto-generated method stub
		return this.moduleMapper.insertRoleModule(roleModuleBean);
	}
	@Override
	public List<Module> getModulesByRoleId(int roleId) {
		// TODO Auto-generated method stub
		return this.moduleMapper.getModulesByRoleId(roleId);
	}
	
	@Override
	public List<Module> getModulesByRoles(List<RoleBean> roles) {
		// TODO Auto-generated method stub
		List<Module> modules = new ArrayList<Module>();
		for(RoleBean role: roles){
			int roleId = role.getRoleId();
			List<Module> subModules = this.moduleMapper.getModulesByRoleId(roleId);
			if(subModules!=null){
				for(Module module: subModules){
					if(!contains(modules, module)){
						modules.add(module);
					}
				}
			}
		}
		return modules;
	}
	
	boolean contains(List<Module> modules, Module module){
		int moduleId = module.getModuleId();
		boolean moduleInList = false;  
		for(Module m: modules){
			if(m.getModuleId()==moduleId){
				moduleInList=true;
				break;
			}
		}
		return moduleInList;
	}
	public ModuleMapper getModuleMapper() {
		return moduleMapper;
	}

	public void setModuleMapper(ModuleMapper moduleMapper) {
		this.moduleMapper = moduleMapper;
	}	
}
