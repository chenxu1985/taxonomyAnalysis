package cn.ac.big.gsa.shiro;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import cn.ac.big.gsa.sys.pojo.Module;
import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.ModuleService;
import cn.ac.big.gsa.sys.service.RoleService;
import cn.ac.big.gsa.sys.service.UserService;


//import com.etop.pojo.Role;
//import com.etop.pojo.User;
//import com.etop.service.UserService;

/**
 * @类名: MyRealm
 * @描述: 自定义Realm,进行数据源配置
 * @作者 liuren-mail@163.com
 * @日期 2015年5月20日 上午11:50:21
 */

public class MyRealm extends AuthorizingRealm {

	@Resource(name="userService")
	private UserService userService;
	@Resource(name="roleService")
	private RoleService roleService;
	@Resource(name="moduleService")
	private ModuleService moduleService;

	/**
	 * 获取授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principalCollection) {
		// 获取登录时输入的用户名
		String loginName = (String) principalCollection.fromRealm(getName())
				.iterator().next();
		// 到数据库获取此用户
		User user = userService.selectByEmail(loginName);
		if (user != null) {
			// 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
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
			return info;
		}
		return null;
	}

	/**
	 * 获取身份验证相关信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authenticationToken)
			throws AuthenticationException {
		// UsernamePasswordToken对象用来存放提交的登录信息
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
//		System.out.println("token user name"+token.getUsername());
		// 查出是否有此用户
//		User user = userService.findByName(token.getUsername());
		User user = userService.selectByEmail(token.getUsername());
		if (user != null) {
			// 若存在，将此用户存放到登录认证info中
			return new SimpleAuthenticationInfo(user.getEmail(),
					user.getEncryptPwd(), getName());
		}
		return null;
	}
	


}