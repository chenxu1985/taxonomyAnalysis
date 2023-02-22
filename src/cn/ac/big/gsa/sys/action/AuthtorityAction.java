package cn.ac.big.gsa.sys.action;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.sys.pojo.MenuAuth;
import cn.ac.big.gsa.sys.pojo.MenuView;
import cn.ac.big.gsa.sys.pojo.Module;
import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.RoleModuleBean;
import cn.ac.big.gsa.sys.service.ModuleService;
import cn.ac.big.gsa.sys.service.RoleService;

import com.opensymphony.xwork2.ActionSupport;

/**********************************************************************
 * used to process user authority
 * 
 * @author sweeter
 *
 */
public class AuthtorityAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private RoleService roleService;
	private ModuleService moduleService;
	
	private List<RoleBean> roleList;
	private List<MenuView> menuViewList;
	
	
	/***************************************************************
	 * authority operation
	 * @return
	 */
	public String execAuthorityOperationFunc(){
		menuViewList = new ArrayList<MenuView>();
		roleList = roleService.getAllRoleList();
		
		List<Module> moduleList = this.moduleService.getAllModuleList();
		List<RoleModuleBean> roleModuleList = this.moduleService.getAllRoleModuleList();
		if(moduleList!=null){			
			if(roleList!=null){ // have no rule
				for(Module module:moduleList){
					MenuView menuview = new MenuView();
					menuview.setMenu(module);
					for(RoleBean role:roleList){
						MenuAuth menuauth = new MenuAuth(role.getRoleId(),0);
						int res = findRoleMenuAuth(role.getRoleId(), module.getModuleId(), roleModuleList);
						if(res ==1){ //find
							menuauth.setPermit(1);
						}						
						menuview.addMenuAuth(menuauth);						
					}
					
					menuViewList.add(menuview);
				}				
			}
		}
				
		return SUCCESS;
	}
	
	/**************************************************
	 * this used to find given role at given menu's opration
	 * 0 not have
	 * 1 have
	 * @return
	 */
	private int findRoleMenuAuth(int roleid, int moduleid,List<RoleModuleBean> roleModuleList){
		int res = 0 ;
		
		if(roleModuleList!=null){
			for(RoleModuleBean roleModule:roleModuleList){
				if(roleModule.getModuleId() == moduleid && roleModule.getRoleId() == roleid){
					res = 1;
					break;
				}
			}
		}
		
		
		return res;
	}
	

	/*******************************************************
	 * used to process authority save (modify )
	 * @return
	 */
	public String execSaveAuthorityFunc(){
		
		System.out.println("---------------------------------------save fun");
		//first delete tb_role_module
		this.moduleService.truncateRoleMoudle();
		//then insert
		HttpServletRequest request = ServletActionContext.getRequest();
		Map paramsMap = new HashMap();

		// use to get the webpage valid params and value
		Enumeration enum1 = request.getParameterNames();
		System.out.println("get parameters from form");
		while (enum1.hasMoreElements()) {
			String key = (String) enum1.nextElement();
			System.out.println("========="+key);
			if (key.endsWith("$$")==false)
				continue;
			
			String value =  request.getParameter(key);
			String []temp = value.split(",");
			if(temp!=null && temp.length ==2){
				RoleModuleBean rolemodule = new RoleModuleBean();
				rolemodule.setRoleId(new Integer(temp[0]));
				rolemodule.setModuleId(new Integer(temp[1]));
				this.moduleService.insertRoleModule(rolemodule);
			}
			
		}
		
		
		
		return SUCCESS;
	}

	public List<RoleBean> getRoleList() {
		return roleList;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public ModuleService getModuleService() {
		return moduleService;
	}

	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}

	public List<MenuView> getMenuViewList() {
		return menuViewList;
	}

	public void setRoleList(List<RoleBean> roleList) {
		this.roleList = roleList;
	}

	public void setMenuViewList(List<MenuView> menuViewList) {
		this.menuViewList = menuViewList;
	}	
		
	
}
