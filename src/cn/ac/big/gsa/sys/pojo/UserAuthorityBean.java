package cn.ac.big.gsa.sys.pojo;

/**************************************************************************
 * used to identify user authority 1 means have this authority '0' means do not
 * have
 * 
 * @author sweeter
 * 
 */
public class UserAuthorityBean {
	private int userId; // user primary id
	private String userName; // email

	private char idenAdminRole = '0'; // used to identify administrator role

	private char sysManager = '0';
	private char dataManager = '0';
	private char userManager = '0';
	private char userLock = '0';
	private char userDelete = '0';
	private char userActive = '0';
	private char userView = '0';

	private char roleManager = '0';
	private char roleAdd = '0';
	private char roleEdit = '0';
	private char roleDelete = '0';
	private char roleView = '0';

	private char authorityManager = '0';
	private char authorityEdit = '0';
	private char authorityView = '0';
	
	private char groupManager ='0';
	private char groupAdd = '0';
	private char groupEdit = '0';
	private char groupDelete = '0';
	private char groupView = '0';
	
	private char submitManager = '0';
	private char prjSubManager = '0';
	private char prjSubManagerView = '0';
	private char prjSubManagerEdit = '0';
	private char sampSubManager = '0';
	private char sampSubManagerView = '0';
	private char sampSubManagerEdit = '0';
	private char sraSubManager = '0';
	private char sraSubManagerView = '0';
	private char sraSubManagerEdit = '0';
	
	private char submit = '0';
	private char prjSubmit = '0';
	private char prjSubmitAdd = '0';
	private char prjSubmitEdit = '0';
	private char prjSubmitDelete = '0';
	private char prjSubmitView = '0';
	private char sampSubmit = '0';
	private char sampSubmitAdd = '0';
	private char sampSubmitEdit = '0';
	private char sampSubmitDelete = '0';
	private char sampSubmitView = '0';
	private char sraSubmit = '0';
	private char sraSubmitAdd = '0';
	private char sraSubmitEdit = '0';
	private char sraSubmitDelete = '0';
	private char sraSubmitView = '0';
	
	private char browse = '0';
	private char prjBrowse = '0';
	private char sampBrowse = '0';
	private char exptBrowse = '0';
	private char runBrowse = '0';
	
	private char search = '0';
	private char download = '0';
	
	private char eGPS ='0';
	private char xiandaoA = '0';
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public char getIdenAdminRole() {
		return idenAdminRole;
	}
	public void setIdenAdminRole(char idenAdminRole) {
		this.idenAdminRole = idenAdminRole;
	}
	public char getSysManager() {
		return sysManager;
	}
	public void setSysManager(char sysManager) {
		this.sysManager = sysManager;
	}
	public char getDataManager() {
		return dataManager;
	}
	public void setDataManager(char dataManager) {
		this.dataManager = dataManager;
	}
	public char getUserManager() {
		return userManager;
	}
	public void setUserManager(char userManager) {
		this.userManager = userManager;
	}
	public char getUserLock() {
		return userLock;
	}
	public void setUserLock(char userLock) {
		this.userLock = userLock;
	}
	public char getUserDelete() {
		return userDelete;
	}
	public void setUserDelete(char userDelete) {
		this.userDelete = userDelete;
	}
	public char getUserActive() {
		return userActive;
	}
	public void setUserActive(char userActive) {
		this.userActive = userActive;
	}
	public char getUserView() {
		return userView;
	}
	public void setUserView(char userView) {
		this.userView = userView;
	}
	public char getRoleManager() {
		return roleManager;
	}
	public void setRoleManager(char roleManager) {
		this.roleManager = roleManager;
	}
	public char getRoleAdd() {
		return roleAdd;
	}
	public void setRoleAdd(char roleAdd) {
		this.roleAdd = roleAdd;
	}
	public char getRoleEdit() {
		return roleEdit;
	}
	public void setRoleEdit(char roleEdit) {
		this.roleEdit = roleEdit;
	}
	public char getRoleDelete() {
		return roleDelete;
	}
	public void setRoleDelete(char roleDelete) {
		this.roleDelete = roleDelete;
	}
	public char getRoleView() {
		return roleView;
	}
	public void setRoleView(char roleView) {
		this.roleView = roleView;
	}
	public char getAuthorityManager() {
		return authorityManager;
	}
	public void setAuthorityManager(char authorityManager) {
		this.authorityManager = authorityManager;
	}
	public char getAuthorityEdit() {
		return authorityEdit;
	}
	public void setAuthorityEdit(char authorityEdit) {
		this.authorityEdit = authorityEdit;
	}
	public char getAuthorityView() {
		return authorityView;
	}
	public void setAuthorityView(char authorityView) {
		this.authorityView = authorityView;
	}
	public char getGroupManager() {
		return groupManager;
	}
	public void setGroupManager(char groupManager) {
		this.groupManager = groupManager;
	}
	public char getGroupAdd() {
		return groupAdd;
	}
	public void setGroupAdd(char groupAdd) {
		this.groupAdd = groupAdd;
	}
	public char getGroupEdit() {
		return groupEdit;
	}
	public void setGroupEdit(char groupEdit) {
		this.groupEdit = groupEdit;
	}
	public char getGroupDelete() {
		return groupDelete;
	}
	public void setGroupDelete(char groupDelete) {
		this.groupDelete = groupDelete;
	}
	public char getGroupView() {
		return groupView;
	}
	public void setGroupView(char groupView) {
		this.groupView = groupView;
	}
	public char getSubmitManager() {
		return submitManager;
	}
	public void setSubmitManager(char submitManager) {
		this.submitManager = submitManager;
	}
	public char getPrjSubManager() {
		return prjSubManager;
	}
	public void setPrjSubManager(char prjSubManager) {
		this.prjSubManager = prjSubManager;
	}

	public char getPrjSubManagerView() {
		return prjSubManagerView;
	}
	public void setPrjSubManagerView(char prjSubManagerView) {
		this.prjSubManagerView = prjSubManagerView;
	}
	public char getPrjSubManagerEdit() {
		return prjSubManagerEdit;
	}
	public void setPrjSubManagerEdit(char prjSubManagerEdit) {
		this.prjSubManagerEdit = prjSubManagerEdit;
	}
	public char getSampSubManager() {
		return sampSubManager;
	}
	public void setSampSubManager(char sampSubManager) {
		this.sampSubManager = sampSubManager;
	}

	public char getSampSubManagerView() {
		return sampSubManagerView;
	}
	public void setSampSubManagerView(char sampSubManagerView) {
		this.sampSubManagerView = sampSubManagerView;
	}
	public char getSampSubManagerEdit() {
		return sampSubManagerEdit;
	}
	public void setSampSubManagerEdit(char sampSubManagerEdit) {
		this.sampSubManagerEdit = sampSubManagerEdit;
	}
	public char getSraSubManager() {
		return sraSubManager;
	}
	public void setSraSubManager(char sraSubManager) {
		this.sraSubManager = sraSubManager;
	}

	public char getSraSubManagerView() {
		return sraSubManagerView;
	}
	public void setSraSubManagerView(char sraSubManagerView) {
		this.sraSubManagerView = sraSubManagerView;
	}
	public char getSraSubManagerEdit() {
		return sraSubManagerEdit;
	}
	public void setSraSubManagerEdit(char sraSubManagerEdit) {
		this.sraSubManagerEdit = sraSubManagerEdit;
	}
	public char getSubmit() {
		return submit;
	}
	public void setSubmit(char submit) {
		this.submit = submit;
	}
	public char getPrjSubmit() {
		return prjSubmit;
	}
	public void setPrjSubmit(char prjSubmit) {
		this.prjSubmit = prjSubmit;
	}
	public char getPrjSubmitAdd() {
		return prjSubmitAdd;
	}
	public void setPrjSubmitAdd(char prjSubmitAdd) {
		this.prjSubmitAdd = prjSubmitAdd;
	}
	public char getPrjSubmitEdit() {
		return prjSubmitEdit;
	}
	public void setPrjSubmitEdit(char prjSubmitEdit) {
		this.prjSubmitEdit = prjSubmitEdit;
	}
	public char getPrjSubmitDelete() {
		return prjSubmitDelete;
	}
	public void setPrjSubmitDelete(char prjSubmitDelete) {
		this.prjSubmitDelete = prjSubmitDelete;
	}
	public char getPrjSubmitView() {
		return prjSubmitView;
	}
	public void setPrjSubmitView(char prjSubmitView) {
		this.prjSubmitView = prjSubmitView;
	}
	public char getSampSubmit() {
		return sampSubmit;
	}
	public void setSampSubmit(char sampSubmit) {
		this.sampSubmit = sampSubmit;
	}
	public char getSampSubmitAdd() {
		return sampSubmitAdd;
	}
	public void setSampSubmitAdd(char sampSubmitAdd) {
		this.sampSubmitAdd = sampSubmitAdd;
	}
	public char getSampSubmitEdit() {
		return sampSubmitEdit;
	}
	public void setSampSubmitEdit(char sampSubmitEdit) {
		this.sampSubmitEdit = sampSubmitEdit;
	}
	public char getSampSubmitDelete() {
		return sampSubmitDelete;
	}
	public void setSampSubmitDelete(char sampSubmitDelete) {
		this.sampSubmitDelete = sampSubmitDelete;
	}
	public char getSampSubmitView() {
		return sampSubmitView;
	}
	public void setSampSubmitView(char sampSubmitView) {
		this.sampSubmitView = sampSubmitView;
	}
	public char getSraSubmit() {
		return sraSubmit;
	}
	public void setSraSubmit(char sraSubmit) {
		this.sraSubmit = sraSubmit;
	}
	public char getSraSubmitAdd() {
		return sraSubmitAdd;
	}
	public void setSraSubmitAdd(char sraSubmitAdd) {
		this.sraSubmitAdd = sraSubmitAdd;
	}
	public char getSraSubmitEdit() {
		return sraSubmitEdit;
	}
	public void setSraSubmitEdit(char sraSubmitEdit) {
		this.sraSubmitEdit = sraSubmitEdit;
	}
	public char getSraSubmitDelete() {
		return sraSubmitDelete;
	}
	public void setSraSubmitDelete(char sraSubmitDelete) {
		this.sraSubmitDelete = sraSubmitDelete;
	}
	public char getSraSubmitView() {
		return sraSubmitView;
	}
	public void setSraSubmitView(char sraSubmitView) {
		this.sraSubmitView = sraSubmitView;
	}
	public char getBrowse() {
		return browse;
	}
	public void setBrowse(char browse) {
		this.browse = browse;
	}
	public char getPrjBrowse() {
		return prjBrowse;
	}
	public void setPrjBrowse(char prjBrowse) {
		this.prjBrowse = prjBrowse;
	}
	public char getSampBrowse() {
		return sampBrowse;
	}
	public void setSampBrowse(char sampBrowse) {
		this.sampBrowse = sampBrowse;
	}
	public char getExptBrowse() {
		return exptBrowse;
	}
	public void setExptBrowse(char exptBrowse) {
		this.exptBrowse = exptBrowse;
	}
	public char getRunBrowse() {
		return runBrowse;
	}
	public void setRunBrowse(char runBrowse) {
		this.runBrowse = runBrowse;
	}
	public char getSearch() {
		return search;
	}
	public void setSearch(char search) {
		this.search = search;
	}
	public char getDownload() {
		return download;
	}
	public void setDownload(char download) {
		this.download = download;
	}
	public char getEGPS() {
		return eGPS;
	}
	public void setEGPS(char eGPS) {
		this.eGPS = eGPS;
	}
	public char getXiandaoA() {
		return xiandaoA;
	}
	public void setXiandaoA(char xiandaoA) {
		this.xiandaoA = xiandaoA;
	}
	
	
}
