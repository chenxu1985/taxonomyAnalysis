package cn.ac.big.gsa.sys.service.impl;

import java.util.Date;
import java.util.List;

import cn.ac.big.gsa.sys.dao.UserMapper;
import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.UserService;

public class UserServiceImpl implements UserService{

	private UserMapper userMapper;
	@Override
	public boolean isEmailRegistered(String email) {
		// TODO Auto-generated method stub
		User user = this.userMapper.selectByEmail(email);
		if(user!=null){
			if(user.getIsActive()==1){
					return true;
			}else{
				Date now = new Date();
				Date activeTime = user.getActiveTime();
				if(!(now.before(activeTime))){//register expired
//					user.setIsDeleted(1);
					this.userMapper.deleteUser(user);
					return false;
				}else{
					return true;
				}
			}
			
		}
			
		else
			return false;
	}
	@Override
	public User selectByEmail(String email) {
		// TODO Auto-generated method stub
		return this.userMapper.selectByEmail(email);
	}
	
	@Override
	public int updateByPrimaryKey(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.updateByPrimaryKey(user);
	}
	
	public UserMapper getUserMapper() {
		return userMapper;
	}
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	@Override
	public User selectUserByPrimaryKey(int userId) {
		// TODO Auto-generated method stub
		return this.userMapper.selectUserByPrimaryKey(userId);
	}
//	@Override
//	public int updateBydeluserId(int userId) {
//		// TODO Auto-generated method stub
//		return this.userMapper.updateBydeluserId(userId);
//	}
	@Override
	public int updateActiveStatus(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.updateActiveStatus(user);
	}
	@Override
	public int deleteUser(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.deleteUser(user);
	}
	@Override
	public List<User> selectAllUsers() {
		// TODO Auto-generated method stub
		return this.userMapper.selectAllUsers();
	}
	@Override
	public User selectUserByEmailAndPasswd(String email, String encryptPwd) {
		// TODO Auto-generated method stub
		return this.userMapper.selectUserByEmailAndPasswd(email, encryptPwd);
	}
	@Override
	public int createUser(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.insert(user);
	}
	@Override
	public User selectUserByCsaId(String casId) {
		// TODO Auto-generated method stub
		return this.userMapper.selectUserByCsaId(casId);
	}
	
	
	 

}
