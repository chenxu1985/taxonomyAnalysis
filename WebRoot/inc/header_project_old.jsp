<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>  
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    <div class="container" style="background-image:url(img/cra/bj.jpg);">
    <div class="row">
	    <div class="col-md-5 col-sm-12 col-xs-12 pull-left">
		    <a style="font-size:18px;font-weight:bold;color:#9933FF;text-decoration:none;" href=""><img src="img/cra/bioproject.png" /><span >Internal test version</span></a>
		</div>
		<div class="col-md-7 col-sm-12 col-xs-12">
			<div class="col-md-12 col-sm-12 col-xs-12" style="padding-top:5px;padding-bottom:5px;">
				<button style="margin-right:0px;" class="btn btn-primary btn-xs language pull-right" name="en_US">English</button>
		   		<button style="margin-right:10px;" class="btn btn-primary btn-xs language pull-right" name="zh_CN">中文</button>
		   	</div>
		   	<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="col-md-8 col-sm-12 col-xs-12 pull-right" style="padding-right:0px;">
				<s:form  action="searchAll" id="searchAll" namespace="/search" method="get" role="form" style="margin-bottom: 5px;">
				   <div class="input-group">
				      	<s:textfield type="text" cssClass="form-control" id="name" name="search.term" placeholder="search"/>
				   		<span class="input-group-btn">
				   			<button type="submit" class="btn btn-success">
				   				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
				   			</button>
				   		</span>
				   </div>
				</s:form>
			</div>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12 ">
			<div class="col-md-8 col-sm-12 col-xs-12 pull-right">
				<span>&nbsp;&nbsp;Examples: 
		    		<a class="search-a" href="/search/searchAll?search.term=PRJCA000091">PRJCA000091</a>, 
		    		<a class="search-a" href="/search/searchAll?search.term=human">human</a>
		    	</span>
<!-- 		    	<span style="margin-left:10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    		<a class="search-a" href="/advance-search/searchAll">Advanced search</a>
		    	</span> -->
			</div>
			</div>
		<div class="col-md-4 col-sm-12 col-xs-12" style="padding-left:0px;padding-right:0px; ">
		   	<div class="col-md-12 col-sm-12 col-xs-12 pull-right" style="padding-top:10px;padding-left:0px;padding-right:0px;">
				
		   	</div>
		</div>
		</div>
	</div>
	<div class="row" style="background-color:#3aa5c8; margin:0; padding:5px 0;">
		<div class="col-md-1 col-sm-2 col-xs-3 "><a class="menu-a" href="index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;Home</a></div>
		<div class="col-md-1 col-sm-2 col-xs-3 "><a class="menu-a" href="browse/summary">Statistics</a></div>
		<div class="col-md-1 col-sm-2 col-xs-3 "><a class="menu-a" href="download.jsp">Download</a></div>
		<div class="col-md-1 col-sm-2 col-xs-3 "><a class="menu-a" href="document/start_here.jsp">Documentation</a></div>
		<shiro:hasRole name="Admininistrator">
		   <div class="col-md-1 col-sm-2 col-xs-3 " style="min-width:140px;"><a class="menu-a" href="/sys/user/getUserList">System Manager</a></div>
		</shiro:hasRole>
		<shiro:hasRole name="Data administrator">
		   <div class="col-md-1 col-sm-2 col-xs-3 " style="min-width:120px;"><a class="menu-a" href="/sys/data/listProjects">Data Manager</a></div>
		</shiro:hasRole>
		<div class="col-md-3 col-sm-12 col-xs-12 pull-right">
			<shiro:authenticated>
				<a class="login-a pull-right" href="logout" 
					style="background:url(img/cra/reg003.png) left center no-repeat;padding-left:17px;padding-right:7px;">Logout</a>
			   <a class="login-a pull-right" 
			   		style="background:url(img/cra/reg002.png) left center no-repeat;padding-right:20px;padding-left:17px;text-decoration:none;cursor:auto;"><s:property value="#session.curUser.firstName" /></a>
			   </shiro:authenticated>
			   <shiro:notAuthenticated>
			   <a class="login-a pull-right" href="http://sso.big.ac.cn/register/register.jsp?service=http://192.168.108.56/bioproject/account/casregister" 
			   		style="background:url(img/cra/reg003.png) left center no-repeat;padding-left:17px;padding-right:7px;">Register</a>
			   <a class="login-a pull-right" href="http://sso.big.ac.cn/login?service=http://192.168.108.56/bioproject/login" 
			   		style="background:url(img/cra/reg002.png) left center no-repeat;padding-right:20px;padding-left:17px;">Login</a>
			   </shiro:notAuthenticated>
		</div>
	</div>
    </div>