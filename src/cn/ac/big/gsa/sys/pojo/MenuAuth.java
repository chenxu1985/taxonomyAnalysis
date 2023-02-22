package cn.ac.big.gsa.sys.pojo;
/************************************************
 * this class used to process each role operate each menu's authority
 * @author sweeter
 *
 */
public class MenuAuth {
	private int roleid;
	private int permit; //0 do not have authority,1 have
	
	public MenuAuth(){
		
	}
	
	public MenuAuth(int roleid,int permit){
		this.roleid = roleid;
		this.permit = permit;
	}
	
	
	public int getRoleid() {
		return roleid;
	}
	public int getPermit() {
		return permit;
	}
	
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public void setPermit(int permit) {
		this.permit = permit;
	}
	
	
}
