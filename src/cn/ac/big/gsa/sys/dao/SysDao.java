package cn.ac.big.gsa.sys.dao;

import java.util.List;

public interface SysDao {
  // public boolean register(RegisterBean registerbean);
   public abstract int getinsertUserDBTable(String mappername,Object param);
   public abstract List findResultList(String mappername,Object param);
   public abstract List checkUsernameList(String mappername,Object param);
   public abstract int deleteRoleauthor(String mappername,Object param);
   public abstract int insertRoleauthor(String mappername,Object param);
   public abstract int updateRoleauthor(String mappername,Object param);
   //public abstract int addRole(String mappername,Object param);
}
