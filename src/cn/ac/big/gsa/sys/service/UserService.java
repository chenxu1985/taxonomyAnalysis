package cn.ac.big.gsa.sys.service;

import java.util.List;

import cn.ac.big.gsa.sys.pojo.User;


public interface UserService {
	boolean isEmailRegistered(String email);
	User selectByEmail(String email);
	int updateByPrimaryKey(User user);
	User selectUserByPrimaryKey(int userId);
	int updateActiveStatus(User user);
//	int updateBydeluserId(int userId);
	int deleteUser(User user);
	List<User> selectAllUsers();
	User selectUserByEmailAndPasswd(String email, String encryptPwd);
	int createUser(User user);
	User selectUserByCsaId(String cas_id);
}
