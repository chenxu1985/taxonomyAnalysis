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

public class GetrolelistAction extends ActionSupport {
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
	//private User user;
//	private String hiddenusername;
	private List<Integer> roleIds;
	private RoleService roleService;
	private UserService userService;
	private int roleId;
	private List<RoleAuth> roleAuths;
//	String userName;
//	private List<Integer> assignedRoleIds;
	

	/************************
	 * 获取角色列表
	 */
	@Override
	public String execute() {

		// List<RoleBean>
		// list=(List<RoleBean>)this.redao.findResultList("cn.ac.big.gsa.sys.dao.RoleMapper.selecrolenodel",
		// "");
		List<RoleBean> list = this.roleService.getAllRoleList();
		this.setRoles(list);
		return "success";
	}

	/************************
	 * 添加角色
	 */
	public String addRole() {
		if (addrole.getRoleName() != null && !"".equals(addrole.getRoleName())) {
			// List<RoleBean>
			// list2=(List<RoleBean>)this.redao.findResultList("cn.ac.big.gsa.sys.dao.RoleMapper.selecrolelistbyaddrole",
			// addrole);
			RoleBean role2 = this.roleService.selectRoleByRoleName(addrole
					.getRoleName());
			if (role2 == null) {
				RoleBean newRole = new RoleBean();
				newRole.setRoleName(addrole.getRoleName());
				newRole.setDesp(addrole.getDesp());
				Date d = new Date();
				newRole.setCreateTime(d);
				newRole.setIsDeleted(0);
				// this.redao.insertRoleauthor("cn.ac.big.gsa.sys.dao.RoleMapper.insert",
				// map);
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
		//RoleBean modifyRole = new RoleBean();
		//modifyRole.setRoleName(addrole.getRoleName());
		//modifyRole.setDesp(addrole.getDesp());
		this.roleService.updateRole(addrole);
		// this.redao.updateRoleauthor("cn.ac.big.gsa.sys.dao.RoleMapper.updaterole",
		// modifyRole);
		return "success";
	}

	/************************
	 * 删除角色信息
	 */
	public String deleteRole() {
		Date d = new Date();
		RoleBean roleToDelete = this.roleService.selectRoleByRoleId(roleId);
//		roleToDelete.setRoleName(roleName);
		roleToDelete.setDeleteTime(d);
		this.roleService.deleteRole(roleToDelete);
		// this.redao.deleteRoleauthor("cn.ac.big.gsa.sys.dao.RoleMapper.upadateBydel",
		// map);

//		RoleBean role2 = this.roleService.selectRoleByRoleName(roleName);
//		int roleId = role2.getRoleId();
		List<UserRoleBean> list3 = this.roleService
				.selectUserRoleByRoleId(roleId);
		// List<UserRoleBean>
		// list3=(List<UserRoleBean>)this.redao.findResultList("cn.ac.big.gsa.sys.dao.UserRoleMapper.selectuserid",
		// roleId);
		this.roleService.deleteUserRoleByRoleId(roleId);
		// this.redao.deleteRoleauthor("cn.ac.big.gsa.sys.dao.UserRoleMapper.deleterole_id",
		// roleId);
//		for (UserRoleBean ub : list3) {
//			int userId = ub.getUserId();
//			this.userService.updateBydeluserId(userId);
//		}

		// //
		// this.redao.updateRoleauthor("cn.ac.big.gsa.sys.dao.UserMapper.updateBydeluserId",
		// userId);
		return "success";
	}

	/************************
	 * 
	 */
	public String execute3() {
		RoleBean role = this.roleService.selectRoleByRoleName(roleName);
		this.setRole(role);
		// List<RoleBean>
		// list=(List<RoleBean>)this.redao.findResultList("cn.ac.big.gsa.sys.dao.RoleMapper.selecrolelistbyname",
		// roleName);
		return "success";
	}

	/************************
	 * 获取角色详细信息
	 */
	public String loadroledetail() {
		RoleBean role = this.roleService.selectRoleByRoleId(roleId);
		// List<RoleBean>
		// list=(List<RoleBean>)this.redao.findResultList("cn.ac.big.gsa.sys.dao.RoleMapper.selecrolelistbyname",
		// roleName);
		this.setRole(role);
		return "success";
	}

	/************************
	 * 修改角色信息前获取详细信息
	 */
	public String editroledetail() {
		RoleBean role = this.roleService.selectRoleByRoleId(roleId);
		// List<RoleBean>
		// list=(List<RoleBean>)this.redao.findResultList("cn.ac.big.gsa.sys.dao.RoleMapper.selecrolelistbyname",
		// roleName);
		this.setRole(role);
		return "success";
	}

	/************************
	 * 给用户分配角色
	 */
	public String loaduserrole() {
//		List<RoleBean> list = this.roleService.getAllRoleList();
//		// List<RoleBean>
//		// list=(List<RoleBean>)this.redao.findResultList("cn.ac.big.gsa.sys.dao.RoleMapper.selecrolenodel",
//		// "");
//		this.setRoles(list);
//		//user = new User();
//		//user.setEmail(userName);
//		return "success";
		
		
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
//			this.setAssignedRoleIds(assignedIds);
			return SUCCESS;
		}
		
	}

	/************************
	 * 提交用户角色
	 */
	public String submitUserrole() {
//		String email = hiddenusername;
		User user = this.userService.selectByEmail(userName);
		Integer userId = user.getUserId();
		this.roleService.deleteUserRoleByUserId(userId);
		// this.redao.deleteRoleauthor("cn.ac.big.gsa.sys.dao.UerRoleMapper.deleteuserrole",userId);
		UserRoleBean userRole = new UserRoleBean();
		for (int roleId : roleIds) {
			userRole.setRoleId(roleId);
			userRole.setUserId(userId);
			this.roleService.insertUserRole(userRole);
			// this.redao.insertRoleauthor("cn.ac.big.gsa.sys.dao.UserRoleMapper.insertuserrole",
			// map);
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

//	public String getHiddenusername() {
//		return hiddenusername;
//	}
//
//	public void setHiddenusername(String hiddenusername) {
//		this.hiddenusername = hiddenusername;
//	}

	public List<Integer> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<Integer> roleIds) {
		this.roleIds = roleIds;
	}

//	public User getUser() {
//		return user;
//	}
//
//	public void setUser(User user) {
//		this.user = user;
//	}

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

//	public List<Integer> getAssignedRoleIds() {
//		return assignedRoleIds;
//	}
//
//	public void setAssignedRoleIds(List<Integer> assignedRoleIds) {
//		this.assignedRoleIds = assignedRoleIds;
//	}

	
	

}
