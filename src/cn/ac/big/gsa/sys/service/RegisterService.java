package cn.ac.big.gsa.sys.service;

import java.text.ParseException;

import cn.ac.big.gsa.sys.pojo.User;

public interface RegisterService {

	boolean processregister(User user);
    void processActivate(String email , String validateCode)throws ServiceException, ParseException;
}
