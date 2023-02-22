package cn.ac.big.gsa.sys.action;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.RoleService;
import cn.ac.big.gsa.sys.service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class UserOperationAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private RoleService roleService;
	private UserService userService;
	private List<User> userList;
	private User user;	
	private int userId;

 	
	/**********************************************************
	 * used to get all user list
	 * @return
	 */
	public String execGetAllUserListFunc(){
		userList = this.userService.selectAllUsers();
		return SUCCESS;
	}
	
	/******************************************************************
	 * use to get user detail information
	 * @return
	 */
	public String execGetUserDetailFunc(){
		user = userService.selectUserByPrimaryKey(userId);
		List<RoleBean> trole = roleService.findRolesByUserId(userId);
		if(trole!=null){
			user.setRoles(trole);
		}
		return SUCCESS;
	}
	
	/*****************************************************
	 * used to active or unactive user
	 * if active,the user must have allocate role and dataspace
	 * @return
	 */
	
	public String activeUser(){
		User user = this.userService.selectUserByPrimaryKey(userId);
		if(user!=null){
			user.setIsActive(1);
			user.setIsLocked(0);
			this.userService.updateActiveStatus(user);
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	public String lockUser(){
		User user = this.userService.selectUserByPrimaryKey(userId);
		if(user!=null){
			user.setIsActive(0);
			user.setIsLocked(1);
			this.userService.updateActiveStatus(user);
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	@Transactional
	public String deleteUser(){
		User tuser = new User();
		tuser.setUserId(userId);
		
		Date date = new Date();
		tuser.setDeleteTime(date);
		this.userService.deleteUser(tuser);	
		this.roleService.deleteUserRoleByUserId(userId);
		return SUCCESS;
	}		
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public User getUser() {
		return user;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
	
	
}
