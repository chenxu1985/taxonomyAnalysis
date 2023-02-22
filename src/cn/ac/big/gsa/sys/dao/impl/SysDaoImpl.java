package cn.ac.big.gsa.sys.dao.impl;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.ac.big.gsa.sys.dao.SysDao;

public class SysDaoImpl extends SqlSessionDaoSupport implements SysDao {
	//private JdbcTemplate jdbcTemplate;
	private SqlSessionFactory sessionFactory;
	public void setSessionFactory(SqlSessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	@Override
	public int getinsertUserDBTable(String mappername,Object param){
		int res= getSqlSessionTemplate().insert(mappername, param);
		return res;
  }

	@Override
	public List findResultList(String mappername,Object param){
		return getSqlSessionTemplate().selectList(mappername, param);
    }
	@Override
	public  List checkUsernameList(String mappername,Object param){
		SqlSession session = sessionFactory.openSession();
        List list =null;
        if(param!=null){
            list= session.selectList(mappername,param);
        }else{
            list = session.selectList(mappername);
        }
        session.close();
        return list;
	}
	@Override
	public int deleteRoleauthor(String mappername,Object param){
		return getSqlSessionTemplate().delete(mappername, param);
	}
	@Override
	public int insertRoleauthor(String mappername,Object param){
		int res= getSqlSessionTemplate().insert(mappername, param);
		return res;
	}
	@Override
	public int updateRoleauthor(String mappername,Object param){
		return getSqlSessionTemplate().update(mappername, param);
	}
}
