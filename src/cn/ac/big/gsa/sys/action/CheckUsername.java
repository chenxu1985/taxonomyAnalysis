package cn.ac.big.gsa.sys.action;
import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.sys.pojo.RoleBean;
import cn.ac.big.gsa.sys.pojo.User;
import cn.ac.big.gsa.sys.service.RoleService;
import cn.ac.big.gsa.sys.service.UserService;

import com.opensymphony.xwork2.ActionSupport;


public class CheckUsername extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//	private SysDao redao;
	private String username;
	private String addname;
	private String addrole;
	private String useremail;
	private User user;
	private String sysaccount;
	private UserService userService;
	private RoleService roleService;
	public String getSysaccount() {
		return sysaccount;
	}
	public void setSysaccount(String sysaccount) {
		this.sysaccount = sysaccount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getAddrole() {
		return addrole;
	}
	public void setAddrole(String addrole) {
		this.addrole = addrole;
	}
	public String getAddname() {
		return addname;
	}
	public void setAddname(String addname) {
		this.addname = addname;
	}
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	//	public void setRedao(SysDao redao){
//		this.redao=redao;
//	}
	public void setUsername(String username){
		this.username=username;
	}
	public String getUsername(){
		return username;
	}
	
    public void doGet()
           {
   
    	int num=0;
        StringBuilder builder=new StringBuilder();
        builder.append("<message>");
        if(username==null||username.length()==0){
        	builder.append("username is empty").append("</message>");
        	num=1;
        }else{        	
        	try{
        	Pattern emailer = Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
        	if(emailer.matcher(username).matches()){
//        	List list=this.redao.checkUsernameList("cn.ac.big.cloud.common.dao.UserMapper.getEmail", username);            
            User uesr = this.userService.selectByEmail(username);
//        	if(list.size()!=0){
        	if(user!=null){
                //返回页面数据
            	builder.append(username+" is already exist").append("</message>");
            	num=2;
            }else{
            	builder.append(username+" can be used").append("</message>");
            	num=3;
            }
            System.out.println("builder.toString()"+"*******************************");
            System.out.println(builder.toString());
            HttpServletResponse response = ServletActionContext.getResponse(); 
            response.setContentType("text/xml");
            response.setCharacterEncoding("UTF-8"); 
            response.getWriter().write(builder.toString());
          // out.println(builder.toString());
        	}else{
        		builder.append(username+" format is wrong").append("</message>");
        		 HttpServletResponse response = ServletActionContext.getResponse(); 
                 response.setContentType("text/xml");
                 response.setCharacterEncoding("UTF-8"); 
                 response.getWriter().write(builder.toString());
        	}
        	}catch(Exception e){
        		e.printStackTrace();
        	}

        }                  
    }

    public void checkaddrolename(){
    	StringBuilder builder=new StringBuilder();
        builder.append("<message>");
        try{
//        	 List list=this.redao.checkUsernameList("cn.ac.big.cloud.common.dao.RoleMapper.selecrolelistbyaddrole", addrole);
        	RoleBean role = this.roleService.selectRoleByRoleName(addrole); 
//        	if(list.size()!=0){
            if(role!=null){
        		//返回页面数据
             	builder.append("name is already exist").append("</message>");
     
             }else{
             	builder.append("</message>");
      
             }

             HttpServletResponse response = ServletActionContext.getResponse(); 
             response.setContentType("text/xml");
             response.setCharacterEncoding("UTF-8"); 
             response.getWriter().write(builder.toString());
        }catch(Exception e){
        	e.printStackTrace();
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/xml");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
     //   doGet(request,response);
    }
}