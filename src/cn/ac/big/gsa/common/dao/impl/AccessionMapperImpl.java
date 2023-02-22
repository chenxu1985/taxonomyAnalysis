package cn.ac.big.gsa.common.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.ac.big.gsa.common.dao.AccessionMapper;
import cn.ac.big.gsa.common.pojo.Accession;

public class AccessionMapperImpl extends SqlSessionDaoSupport implements AccessionMapper{

	@Override
	public int insert(Accession record) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.insert";
		return getSqlSessionTemplate().insert(statement,record);
	}

	@Override
	public int insertSelective(Accession record) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.insertSelective";
		return getSqlSessionTemplate().insert(statement,record);
	}

	@Override
	public String selectMaxPrjAcc() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.selectMaxPrjAcc";
		return (String)getSqlSessionTemplate().selectOne(statement);
	}

	@Override
	public String selectMaxSampleAcc() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.selectMaxSampleAcc";
		return (String)getSqlSessionTemplate().selectOne(statement);
	}

	@Override
	public String selectMaxExptAcc() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.selectMaxExptAcc";
		return (String)getSqlSessionTemplate().selectOne(statement);
	}

	@Override
	public String selectMaxRunAcc() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.selectMaxRunAcc";
		return (String)getSqlSessionTemplate().selectOne(statement);
	}

	@Override
	public int updateByAccType(Accession accession) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.updateByAccType";
		return getSqlSessionTemplate().update(statement,accession);
	}

	@Override
	public Accession selectByAccType(String accType) {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.selectByAccType";
		return (Accession)getSqlSessionTemplate().selectOne(statement);
	}

	@Override
	public List<Accession> selectAllAccessions() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.selectAllAccessions";
		return getSqlSessionTemplate().selectList(statement);
	}

	@Override
	public String selectMaxCraAcc() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.selectMaxCraAcc";
		return (String)getSqlSessionTemplate().selectOne(statement);
	}

	@Override
	public String selectMaxCrpAcc() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.selectMaxCrpAcc";
		return (String)getSqlSessionTemplate().selectOne(statement);
	}

	@Override
	public String selectMaxCrsAcc() {
		// TODO Auto-generated method stub
		String statement = "cn.ac.big.gsa.common.dao.AccessionMapper.selectMaxCrsAcc";
		return (String)getSqlSessionTemplate().selectOne(statement);
	}

}
