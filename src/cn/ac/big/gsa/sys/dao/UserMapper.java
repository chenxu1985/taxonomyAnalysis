package cn.ac.big.gsa.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.pojo.UserExample;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectUserByPrimaryKey(int userId);
    User selectByEmail(String email);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    Integer getUserId(String email);
    int deleteUser(User user);
    List<User> selectAllUsers();
    int updateActiveStatus(User user);
    User selectUserByEmailAndPasswd(String email, String encryptPwd);
    User selectUserByCsaId(String casId);
}