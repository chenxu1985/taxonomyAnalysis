package cn.ac.big.gsa.sys.pojo;

import java.util.Date;

/*************************************************
 * according to the tb_role
 * @author sweeter
 *
 */
public class RoleBean {
	private int roleId;
	private String roleName;
	private String desp;
	private Date createTime;
	private int isDeleted;
	private Date deleteTime;
	public int getRoleId() {
		return roleId;
	}
	public String getRoleName() {
		return roleName;
	}

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getDesp() {
		return desp;
	}
	public void setDesp(String desp) {
		this.desp = desp;
	}
//	public String getCreateTime() {
//		return createTime;
//	}
//	public void setCreateTime(String createTime) {
//		this.createTime = createTime;
//	}
//	public String getDeleteTime() {
//		return deleteTime;
//	}
//	public void setDeleteTime(String deleteTime) {
//		this.deleteTime = deleteTime;
//	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getDeleteTime() {
		return deleteTime;
	}
	public void setDeleteTime(Date deleteTime) {
		this.deleteTime = deleteTime;
	}
	

}
