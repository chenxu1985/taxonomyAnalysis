package cn.ac.big.gsa.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.ac.big.gsa.sys.dao.UserMapper;
import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.pojo.UserExample;

public class UserMapperImpl extends SqlSessionDaoSupport implements UserMapper{

	@Override
	public int countByExample(UserExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByExample(UserExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Integer userId) {
		// TODO Auto-generated method stub
		return getSqlSessionTemplate().delete("cn.ac.big.gsa.sys.dao.UserMaper.deleteByPrimaryKey",userId);
	}

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return getSqlSessionTemplate().insert("cn.ac.big.gsa.sys.dao.UserMapper.insert",record);
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<User> selectByExample(UserExample example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User selectUserByPrimaryKey(int userId) {
		// TODO Auto-generated method stub
		return (User)getSqlSessionTemplate().selectOne("cn.ac.big.ara.sys.dao.UserMapper.selectUserByPrimaryKey",userId);
	}

	@Override
	public User selectByEmail(String email){
		return (User)getSqlSessionTemplate().selectOne("cn.ac.big.gsa.sys.dao.UserMapper.selectByEmail",email);
	}
	@Override
	public int updateByExampleSelective(User record, UserExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(User record, UserExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return getSqlSessionTemplate().update("cn.ac.big.gsa.sys.dao.UserMapper.updateByPrimaryKeySelective",record);
	}

	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return getSqlSessionTemplate().update("cn.ac.big.gsa.sys.dao.UserMapper.updateByPrimaryKey",record);
	}
	
	@Override
	public Integer getUserId(String email){
		return (Integer)getSqlSessionTemplate().selectOne("cn.ac.big.gsa.sys.dao.UserMapper.getUserId",email);
	}

//	@Override
//	public int updateByallocaterole(String email) {
//		// TODO Auto-generated method stub
//		return getSqlSessionTemplate().update("cn.ac.big.gsa.sys.dao.UserMapper.updateByallocaterole",email);
//	}
	
	@Override
	public int updateActiveStatus(User user){
		return getSqlSessionTemplate().update("cn.ac.big.gsa.sys.dao.UserMapper.updateActiveStatus",user);
	}
//	public User selectUnActivedUser(String email){
//		return (User)getSqlSessionTemplate().selectOne("cn.ac.big.gsa.sys.dao.UserMapper.selectUnActivedUser",email);
//	}

	@Override
	public int deleteUser(User user) {
		// TODO Auto-generated method stub
		return getSqlSessionTemplate().update("cn.ac.big.gsa.sys.dao.UserMappaer.userDelete",user);
	}

	@Override
	public List<User> selectAllUsers() {
		// TODO Auto-generated method stub
		return getSqlSessionTemplate().selectList("cn.ac.big.ara.sys.dao.UserMapper.getAllUserList");
	}

	@Override
	public User selectUserByEmailAndPasswd(String email, String encryptPwd) {
		// TODO Auto-generated method stub
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("email", email);
		paramMap.put("encryptPwd", encryptPwd);
		return (User)getSqlSessionTemplate().selectOne("cn.ac.big.ara.sys.dao.UserMapper.selectUserByEmailAndPasswd",paramMap);
	}
	@Override
	public User selectUserByCsaId(String casId) {
		// TODO Auto-generated method stub
		return (User)getSqlSessionTemplate().selectOne("cn.ac.big.ara.sys.dao.UserMapper.selectUserByCsaId",casId);
	}
//	@Override
//	public int updateBydeluserId(int userId) {
//		// TODO Auto-generated method stub
//		return getSqlSessionTemplate().update("cn.ac.big.gsa.sys.dao.UserMapper.updateBydeluserId",userId);
//	}
}
