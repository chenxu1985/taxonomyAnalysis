package cn.ac.big.gsa.sys.service;

import java.util.List;

import cn.ac.big.gsa.sys.pojo.Module;
import cn.ac.big.gsa.sys.pojo.UserAuthorityBean;

/*********************************************************
 * used to help process userAuthority
 * @author sweeter
 *
 */
public class UserAuthorityService {
	private List<Module> moduleBeanList;
	private UserAuthorityBean userAuthBean;
	
	public UserAuthorityService(List<Module> moduleBeanList,UserAuthorityBean userAuthBean){
		this.moduleBeanList =  moduleBeanList;
		this.userAuthBean = userAuthBean;
	}
	
	
	public void mapperAuthority(){
		char res= '1';
		for(Module module:moduleBeanList){
			switch(module.getModuleNumber()){
				case 1:
					userAuthBean.setSysManager(res);
					break;
				case 11:
					userAuthBean.setUserManager(res);
					break;
				case 111:
					userAuthBean.setUserLock(res);
					break;
				case 112:
					userAuthBean.setUserDelete(res);
					break;
				case 113:
					userAuthBean.setUserActive(res);
					break;
				case 114:
					userAuthBean.setUserView(res);
					break;
				case 12:
					userAuthBean.setRoleManager(res);
					break;
				case 121:
					userAuthBean.setRoleAdd(res);
					break;
				case 122:
					userAuthBean.setRoleEdit(res);
					break;
				case 123:
					userAuthBean.setRoleDelete(res);
					break;
				case 124:
					userAuthBean.setRoleView(res);
					break;
				case 13:
					userAuthBean.setAuthorityManager(res);
					break;
				case 131:
					userAuthBean.setAuthorityEdit(res);
					break;
				
				case 132:
					userAuthBean.setAuthorityView(res);
					break;
				case 14:
					userAuthBean.setGroupManager(res);
					break;
				case 141:
					userAuthBean.setGroupAdd(res);
					break;
				case 142:
					userAuthBean.setGroupEdit(res);
					break;
				case 143:
					userAuthBean.setGroupDelete(res);
					break;
				case 144:
					userAuthBean.setGroupView(res);
					break;	
				case 15:
					userAuthBean.setSubmitManager(res);
					break;
				case 151:
					userAuthBean.setPrjSubManager(res);
					break;
				case 1511:
					userAuthBean.setPrjSubManagerView(res);
					break;
				case 1512:
					userAuthBean.setPrjSubManagerEdit(res);
					break;
				case 152:
					userAuthBean.setSampSubManager(res);
					break;
				case 1521:
					userAuthBean.setSampSubManagerView(res);
					break;
				case 1522:
					userAuthBean.setSampSubManagerEdit(res);
					break;
				case 153:
					userAuthBean.setSraSubManager(res);
					break;
				case 1531:
					userAuthBean.setSraSubManagerView(res);
					break;
				case 1532:
					userAuthBean.setSraSubManagerEdit(res);
					break;
				
				
				case 2:
					userAuthBean.setSubmit(res);
					break;
				case 21:
					userAuthBean.setPrjSubmit(res);
					break;
				case 211:
					userAuthBean.setPrjSubmitAdd(res);
					break;
				case 212:
					userAuthBean.setPrjSubmitEdit(res);
					break;
				case 213:
					userAuthBean.setPrjSubmitDelete(res);
					break;
				case 214:
					userAuthBean.setPrjSubmitView(res);
					break;
				case 22:
					userAuthBean.setSampSubmit(res);
					break;
				case 221:
					userAuthBean.setSampSubmitAdd(res);
					break;
				case 222:
					userAuthBean.setSampSubmitEdit(res);
					break;
				case 223:
					userAuthBean.setSampSubmitDelete(res);
					break;
				case 224:
					userAuthBean.setSampSubmitView(res);
					break;	
				case 23:
					userAuthBean.setSraSubmit(res);
					break;
				case 231:
					userAuthBean.setSraSubmitAdd(res);
					break;
					
				case 232:
					userAuthBean.setSraSubmitEdit(res);
					break;	
				case 233:
					userAuthBean.setSraSubmitDelete(res);
					break;
				case 234:
					userAuthBean.setSraSubmitView(res);
					break;
				case 3:
					userAuthBean.setBrowse(res);
					break;
				case 31:
					userAuthBean.setPrjBrowse(res);
					break;
				case 32:
					userAuthBean.setSampBrowse(res);
					break;
				case 33:
					userAuthBean.setExptBrowse(res);
					break;
				case 34:
					userAuthBean.setRunBrowse(res);
					break;
				case 4:
					userAuthBean.setSearch(res);
					break;
				case 5:
					userAuthBean.setDownload(res);
					break;
				case 6:
					userAuthBean.setEGPS(res);
					break;
				case 7:
					userAuthBean.setXiandaoA(res);
					break;
				case 8:
					userAuthBean.setDataManager(res);
					break;
				default:break;
			
			}	
		}		
	}
	
}
