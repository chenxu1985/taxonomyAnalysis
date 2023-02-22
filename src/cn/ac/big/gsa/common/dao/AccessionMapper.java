package cn.ac.big.gsa.common.dao;

import java.util.List;

import cn.ac.big.gsa.common.pojo.Accession;

public interface AccessionMapper {
    int insert(Accession record);

    int insertSelective(Accession record);
    String selectMaxPrjAcc();
    String selectMaxSampleAcc();
    String selectMaxExptAcc();
    String selectMaxRunAcc();
    String selectMaxCraAcc();
    String selectMaxCrpAcc();
    String selectMaxCrsAcc();
    int updateByAccType(Accession accession);
    Accession selectByAccType(String accType);
    List<Accession> selectAllAccessions();
}