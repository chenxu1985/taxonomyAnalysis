package cn.ac.big.gsa.sys.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.ac.big.gsa.sys.pojo.RoleAuth;
import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.pojo.UserRoleBean;
import cn.ac.big.gsa.sys.service.RoleService;
import cn.ac.big.gsa.sys.service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class RoleOperationAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<RoleBean> roles;
	private RoleBean role;
	private String roleName;
	private RoleBean addrole;
	private String userName;
	private int userId;
	private List<Integer> roleIds;
	private RoleService roleService;
	private UserService userService;
	private int roleId;
	private List<RoleAuth> roleAuths;

	

	/************************
	 * 获取角色列表
	 */
	public String loadRoles() {
		List<RoleBean> list = this.roleService.getAllRoleList();
		this.setRoles(list);
		return "success";
	}

	/************************
	 * 添加角色
	 */
	public String addRole() {
		if (addrole.getRoleName() != null && !"".equals(addrole.getRoleName())) {
			RoleBean role2 = this.roleService.selectRoleByRoleName(addrole
					.getRoleName());
			if (role2 == null) {
				RoleBean newRole = new RoleBean();
				newRole.setRoleName(addrole.getRoleName());
				newRole.setDesp(addrole.getDesp());
				Date d = new Date();
				newRole.setCreateTime(d);
				newRole.setIsDeleted(0);
				this.roleService.insertRole(newRole);
				return "success";
			} else {
				return "error";
			}
		} else {
			return "error";
		}
	}

	/************************
	 * 修改角色信息
	 */
	public String editRole() {
		this.roleService.updateRole(addrole);
		return "success";
	}

	/************************
	 * 删除角色信息
	 */
	public String deleteRole() {
		Date d = new Date();
		RoleBean roleToDelete = this.roleService.selectRoleByRoleId(roleId);
		roleToDelete.setDeleteTime(d);
		this.roleService.deleteRole(roleToDelete);
		this.roleService.deleteUserRoleByRoleId(roleId);
		return "success";
	}


	/************************
	 * 获取角色详细信息
	 */
	public String loadroledetail() {
		RoleBean role = this.roleService.selectRoleByRoleId(roleId);
		this.setRole(role);
		return "success";
	}

	/************************
	 * 修改角色信息前获取详细信息
	 */
	public String editroledetail() {
		RoleBean role = this.roleService.selectRoleByRoleId(roleId);
		this.setRole(role);
		return "success";
	}

	/************************
	 * 给用户分配角色
	 */
	public String loaduserrole() {		
		List<RoleBean> roles = this.roleService.getAllRoleList();
		if(roles==null)
			return ERROR;
		if(userId==0){
			roleAuths = new ArrayList<RoleAuth>(); 
			for(RoleBean role:roles){
				RoleAuth roleAuth = new RoleAuth();
				roleAuth.setRole(role);
				roleAuths.add(roleAuth);
			}
			return SUCCESS;
		}else{
			List<Integer> assignedIds = this.roleService.findAssignedRoleIdsByUserId(userId);
			roleAuths = new ArrayList<RoleAuth>(); 
			if(assignedIds!=null && assignedIds.size()>0){
				for(RoleBean role:roles){
					RoleAuth roleAuth = new RoleAuth();
					roleAuth.setRole(role);
					for(int roleId: assignedIds){
						if(roleId==role.getRoleId()){
							roleAuth.setIsAssigned(1);
							break;
						}
					}
					roleAuths.add(roleAuth);
				}
			}else{
				for(RoleBean role:roles){
					RoleAuth roleAuth = new RoleAuth();
					roleAuth.setRole(role);
					roleAuths.add(roleAuth);
				}
			}
			User user = this.userService.selectUserByPrimaryKey(userId);
			this.setUserName(user.getEmail());
			return SUCCESS;
		}
		
	}

	/************************
	 * 提交用户角色
	 */
	public String submitUserrole() {
		User user = this.userService.selectByEmail(userName);
		Integer userId = user.getUserId();
		this.roleService.deleteUserRoleByUserId(userId);
		UserRoleBean userRole = new UserRoleBean();
		for (int roleId : roleIds) {
			userRole.setRoleId(roleId);
			userRole.setUserId(userId);
			this.roleService.insertUserRole(userRole);
		}
		return "success";
	}

	public List<RoleBean> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleBean> roles) {
		this.roles = roles;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public List<Integer> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<Integer> roleIds) {
		this.roleIds = roleIds;
	}
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public RoleBean getRole() {
		return role;
	}

	public void setRole(RoleBean role) {
		this.role = role;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public RoleBean getAddrole() {
		return addrole;
	}

	public void setAddrole(RoleBean addrole) {
		this.addrole = addrole;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public List<RoleAuth> getRoleAuths() {
		return roleAuths;
	}

	public void setRoleAuths(List<RoleAuth> roleAuths) {
		this.roleAuths = roleAuths;
	}
}
