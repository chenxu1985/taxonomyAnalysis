<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ page language="java" import="java.io.*"  import="java.util.Calendar,java.util.TimeZone" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>GSA| Login</title>
<link rel="stylesheet" type="text/css" href="/css/member.css" />
<script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
<body>
<!-- header -->
<div class="login">
  <div class="login1">
    <div class="login1_1"><img src="/img/login.png" width="673" height="146" /></div>
    <div class="login1_1"><img src="/img/login_1.png" width="673" height="318" /></div>
    <div class="login1_1"><img src="/img/login_2.png" width="673" height="265" /></div>
  </div>
  <div class="login2">
  <form id="loginSubmit" action="/account/login" method="post" onsubmit="return validateLoginForm();">
    <div class="login2_1">
      <div class="login2_2"><a href="/"><img src="/img/in_logo2.png"/></a></div>
      <div class="login3">
        <div class="registered_title" style="width:340px;">Sign in to GSA</div>
        <div class="login3_2">Email<span id="nameerr" style="color:red;font-size:12px;margin-left:5px;"></span></div>
        <div class="login3_3"><input type="text" name="user.email" id="username"  value="<s:property value='user.email'/>"/></div>
        <div class="login3_2">Password<span id="pwderr" style="color:red;font-size:12px;margin-left:5px;"></span> <a href="/member/forget_passwd.jsp">Forgot password?</a></div>
        <div class="login3_4"><input type="password" name="user.password" id="passwd" /></div>
        <div class="login3_2">Check code</div>
        <div class="login3_5"><input name="code" id="code" type="text" /></div>
        <div class="login3_6"><img id="checkimg" src="/account/checkcode" width="80" height="25" onclick="this.src='/account/checkcode?d='+(new Date().getTime())"  style="cursor:pointer" /></div>
        <div class="login3_8"><a href="javascript:subForm();">Login</a><a href="javascript:resetForm();">Reset</a><a href="javascript:window.location.href='/member/register.jsp'">Register</a>
        </div>
        <div style="margin: 5px 5px;padding:5px 5px;">
           <div id="error" style="text-align:left;font-size:14px;color:red;padding-left:5px;padding-bottom:5px;">
            <s:if test="flag ==1"> The user does not exist or password is wrong, please check your email and password.<br/>
            </s:if>
            <s:if test="flag ==2"> This user is still under validation, please wait for the email notification.<br/>
            </s:if>
            <s:if test="flag ==3"> This user is locked, please contact the GSA administrator at <a href="mailto:">gsa.big.ac.cn.</a><br/>
            </s:if>
            <s:if test="flag ==5"> Code is wrong,please check<br/>
            </s:if>
          </div>
      </div>
    </div>
    </div>
    </form>
  </div>
</div>
<!-- header | end -->
<!-- manager1-->

<!-- manager1-end  -->
<div style="clear:both"></div>
<div class="login_foot">©BIG 2014-2015, Beijing Institute of Genomics, Chinese Academy of Sciences<br />
NO.1 Beichen West Road, Chaoyang District, Beijing 100101, China.</div>
<script language="javascript" type="text/javascript">
	function subForm(){
		$("#loginSubmit").submit();
	}
	function resetForm(){
		$("#loginSubmit")[0].reset();
	}
	function validateLoginForm(){
		var result = true;
		var username = document.getElementById("username").value;
		var password = document.getElementById("passwd").value;
		if(username == ""){
			document.getElementById("nameerr").innerHTML="username can't be empty";
			result = false;
		}
		if(password == ""){
			document.getElementById("pwderr").innerHTML="password can't be empty";
			result = false;
		}	
		return result;	
	}
	
</script>
</body>
</html>