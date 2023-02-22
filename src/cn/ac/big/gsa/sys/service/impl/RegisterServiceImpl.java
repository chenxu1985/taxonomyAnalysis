package cn.ac.big.gsa.sys.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.sys.dao.UserMapper;
import cn.ac.big.gsa.sys.dao.UserRoleMapper;
import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.RegisterService;
import cn.ac.big.gsa.sys.service.ServiceException;
import cn.ac.big.gsa.util.MD5Util;
import cn.ac.big.gsa.util.SendEmail;
import cn.ac.big.gsa.sys.pojo.RoleNumber;
public class RegisterServiceImpl implements RegisterService{
    private UserMapper userMapper;
    private UserRoleMapper userRoleMapper;
    
    @Override
	public boolean processregister(User user){
    	HttpServletRequest request = ServletActionContext.getRequest();
    	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
//    	System.out.println("url is:"+path);
    	//如果处于安全，可以将激活码处理的更复杂点，这里我稍做简单处理
        String email = user.getEmail();
        if(userMapper.insert(user)==1){
    		Date date = new Date();
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		String dateStr = sdf.format(date);
    		
        	StringBuffer sb=new StringBuffer();
        	sb.append("Dear user,<br/><br/>");
        	sb.append("Please click the URL below to active your account within 48 hours or you will need to register again.<br/>");
            sb.append("<a href=\"").append(path).append("/register/active.action?mailAddr=");
            sb.append(email); 
            sb.append("&validateCode="); 
//            sb.append(user.getValidateCode());
            sb.append(MD5Util.encode2hex(email));
            sb.append("\">").append(path).append("/register/active.action?mailAddr="); 
            sb.append(email);
            sb.append("&validateCode=");
            sb.append(MD5Util.encode2hex(email));
            sb.append("</a><br/><br/>");
    		sb.append("Thanks.<br/><br/>");
    		sb.append("GSA ADMIN<br/>");
    		sb.append(dateStr).append("<br/><br/>");
    		sb.append("-------------------------------<br/>");
    		sb.append("NOTE: THIS MAIL IS SENT BY SYSTEM AUTOMATIC, PLEASE DO NOT REPLY DIRECTLY.");
            
    		//发送邮件
            SendEmail.send(email, "GSA Account Activation", sb.toString());
            System.out.println("send email");
            return true;
        }else
        	return false; 
    }
    
    /**
     * Process active
     * @throws ParseException 
     */
  ///传递激活码和email过来
    @Override
	public void processActivate(String email , String validateCode)throws ServiceException, ParseException{  
    	//数据访问层，通过email获取用户信息
        User user=userMapper.selectByEmail(email);
        //验证用户是否存在 
        if(user!=null) {  
        	//验证用户激活状态  
            if(user.getIsActive()==0) { 
            	///没激活            
            	Date currentTime = new Date();//获取当前时间  
            	//验证链接是否过期  
                if(currentTime.before(user.getActiveTime())) {  
                	//验证激活码是否正确  
                    if(validateCode.equals(MD5Util.encode2hex(email))) {  
                    	//激活成功， //并更新用户的激活状态，为已激活 
                        user.setIsActive(1);//把状态改为激活                      
//                        user.setIsRoleAllocated(1);      
                        //为用户分配默认角色
                        userRoleMapper.insert(user.getUserId(), RoleNumber.COMMON_USER);
                        userMapper.updateByPrimaryKey(user);
                    } else {  
                       throw new ServiceException("Wrong activation code.");  
                    }  
                } else {
                	user.setIsDeleted(1);
                	userMapper.updateByPrimaryKey(user);
                	throw new ServiceException("Activation url is expired, please register again.");  
                }  
            } else if(user.getIsLocked()==0){
               throw new ServiceException("Account is active, please login.");  
            } else{
            	throw new ServiceException("Account is locked, please contact the administrator of GSA.");
            }  
        } else {
            throw new ServiceException("The email address is not registered.");  
        }  
          
    }

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	public void setUserRoleMapper(UserRoleMapper userRoleMapper) {
		this.userRoleMapper = userRoleMapper;
	} 
    
}
