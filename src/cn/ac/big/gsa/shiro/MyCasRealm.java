/**
 * 
 */
package cn.ac.big.gsa.shiro;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.ac.big.gsa.common.pojo.Country;
import cn.ac.big.gsa.sys.pojo.Module;
import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.ModuleService;
import cn.ac.big.gsa.sys.service.RoleService;
import cn.ac.big.gsa.sys.service.UserService;

/**
 * @author chenx
 *
 * 2023-02-21
 */
public class MyCasRealm extends CasRealm{

	@Resource(name="userService")
	private UserService userService;
	@Resource(name="roleService")
	private RoleService roleService;
	@Resource(name="moduleService")
	private ModuleService moduleService;
	private static Logger logger = LoggerFactory.getLogger(MyCasRealm.class);
	/**
	 * 设置角色和权限信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		System.out.println("authorization");
		try{		
		List principalsList = principals.asList();
		Map attributes = (Map)principalsList.get(1);
		String email = attributes.get("email").toString();
		String casId = attributes.get("userId").toString();
		System.out.println("email:"+email);
		User user = userService.selectUserByCsaId(casId);
		SimpleAuthorizationInfo info =null;
		if (user != null) {
			// 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
			info = new SimpleAuthorizationInfo();
			// 用户的角色集合
			List<RoleBean> roles = this.roleService.selectRoleByUserId(user.getUserId());
			List<String> roleNames = new ArrayList<String>();
			for(RoleBean role:roles){
				roleNames.add(role.getRoleName());
			}
			info.addRoles(roleNames);
			// 用户的角色对应的所有权限，如果只使用角色定义访问权限
			List<Module> moduleList = this.moduleService.getModulesByRoles(roles);
//			Collection<RoleBean> roleList = user.getRoleList();
			for (Module module : moduleList) {
				info.addStringPermission(module.getMoudleName());
			}
			Session session = SecurityUtils.getSubject().getSession();
			if(session.getAttribute("curUser")==null){
				session.setAttribute("curUser", user);
			}
			
		}
		
		return info;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * 1、CAS认证 ,验证用户身份
	 * 2、将用户基本信息设置到会话中
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) {	
		System.out.println("lelelelee");
		//try{
			

		AuthenticationInfo authc = super.doGetAuthenticationInfo(authenticationToken);
		if(authc==null)
			return null;
		PrincipalCollection principals = authc.getPrincipals();
		List principalsList = principals.asList();
		Map attributes = (Map)principalsList.get(1);
			for(Object obj:attributes.keySet()){
				System.out.println("key:"+obj.toString()+", value:"+attributes.get(obj).toString());
			}
		String email = attributes.get("email").toString();
		int updateTimes = Integer.parseInt(attributes.get("updateTimes").toString()) ;
		String casId = attributes.get("userId").toString();
		System.out.println("email:"+email);
		System.out.println("casId:"+casId);
		User user = userService.selectUserByCsaId(casId);
		if(user==null){
			try{
			System.out.println("user is null.");
			User newUser = new User();
			newUser.setEmail(email);

			newUser.setCasUserId(attributes.get("userId").toString());
			newUser.setFirstName(attributes.get("firstName").toString());
			newUser.setMiddleName(attributes.get("middleName").toString());
			newUser.setLastName(attributes.get("lastName").toString());
			newUser.setCity(attributes.get("city").toString());
			newUser.setOrganization(attributes.get("organization").toString());
			if(attributes.containsKey("isStandardOrganization")) {
				int isStandardOrganization = Integer.parseInt(attributes.get("isStandardOrganization").toString());
				if(isStandardOrganization==1) {
					newUser.setOrganizationStandard(attributes.get("organization").toString());
				}
			}
			newUser.setDepartment(attributes.get("department").toString());
			newUser.setLab(attributes.get("lab").toString());
			newUser.setResearchArea(attributes.get("researchArea").toString());
			newUser.setStreet(attributes.get("street").toString());
			newUser.setTitle(attributes.get("jobTitle").toString());
			newUser.setPostalCode(attributes.get("postalCode").toString().trim());
			newUser.setUpdateTimes(updateTimes);

			newUser.setCreateTime(new Date());
			Country country = new Country();
			country.setCountryId(Integer.parseInt(attributes.get("countryId").toString()));
			newUser.setCountry(country);
			newUser.setIsActive(1);
			newUser.setActiveTime(new Date());
			this.userService.createUser(newUser);
			user=newUser;
			System.out.println("user id:"+user.getUserId());
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else{
			System.out.println("user is not null.");
			if(updateTimes!=0) {
				int localUpdateTimes = user.getUpdateTimes();
				if(updateTimes>localUpdateTimes) {
					User newUser = new User();
					newUser.setEmail(email);
					newUser.setCasUserId(attributes.get("userId").toString());
					newUser.setFirstName(attributes.get("firstName").toString());
					newUser.setMiddleName(attributes.get("middleName").toString());
					newUser.setLastName(attributes.get("lastName").toString());
					newUser.setCity(attributes.get("city").toString());
					newUser.setOrganization(attributes.get("organization").toString());
					int isStandardOrganization = Integer.parseInt(attributes.get("isStandardOrganization").toString());
					if(isStandardOrganization==1) {
						newUser.setOrganizationStandard(attributes.get("organization").toString());
					}
					newUser.setDepartment(attributes.get("department").toString());
					newUser.setLab(attributes.get("lab").toString());
					newUser.setResearchArea(attributes.get("researchArea").toString());
					newUser.setStreet(attributes.get("street").toString());
					newUser.setTitle(attributes.get("jobTitle").toString());
					newUser.setPostalCode(attributes.get("postalCode").toString().trim());
					newUser.setUpdateTimes(updateTimes);
					newUser.setCreateTime(new Date());
					Country country = new Country();
					country.setCountryId(Integer.parseInt(attributes.get("countryId").toString()));
					newUser.setCountry(country);
					newUser.setIsActive(1);
					newUser.setActiveTime(new Date());
					newUser.setUserId(user.getUserId());
					this.userService.updateByPrimaryKey(newUser);
				}
			}
		}
		SecurityUtils.getSubject().getSession().setAttribute("curUser", user);

		return authc;
	}
}
