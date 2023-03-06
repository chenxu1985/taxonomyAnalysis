<%@ page import="cn.ac.big.gsa.sys.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    User u = (User) session.getAttribute("curUser");
    String uid = null;
    if(u!=null) {
        uid = u.getCasUserId();
        System.out.println(uid);
    } else {
        System.out.println("no login");
    }

%>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="DataTables/SemanticUI-2.2.13/semantic.min.css" type="text/css" rel="stylesheet">
<style type="text/css">
    .navbar{min-height:30px; margin-bottom:0px;}
    .navbar-nav>li>a{padding:5px 15px; color:#fff; margin: 0 7px; }
    .navbar-default .navbar-nav>li>a {color: #fff;}
    .navbar-header{ background-color:#3aa5c8;  min-height:30px;}
    .navbar-toggle {padding: 5px 10px;margin-top: 0px;margin-right: 15px;margin-bottom: 0px; }
    .navbar-default .navbar-toggle {border-color: #3aa5c8;}
    .navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus {background-color: #3aa5c8;}
    .navbar-default .navbar-toggle .icon-bar {background-color: #fff;}
</style>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle = "collapse"  data-target = "#target-menu">
            <span class="sr-only">GSA</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    </div>
    <div class="collapse navbar-collapse" id = "target-menu" style="background-color:#3296c8;">
        <ul class="nav navbar-nav">
            <li><a class="menu-a" href="https://ngdc.cncb.ac.cn/gsa" style="font-size: 14px;">Home</a></li>
            <li><a class="menu-a" href="https://ngdc.cncb.ac.cn/gsub/submit/gsa/list" style="font-size: 14px;">Submit</a> </li>
            <li><a class="menu-a" href="https://ngdc.cncb.ac.cn/gsa/browse/" style="font-size: 14px;">Browse</a></li>
            <li><a class="menu-a" href="https://ngdc.cncb.ac.cn/search?dbId=gsa" style="font-size: 14px;">Search</a></li>
            <li><a class="menu-a" href="https://ngdc.cncb.ac.cn/gsa/statistics" style="font-size: 14px;">Statistics</a></li>
            <%--<li><a class="menu-a" href="standards">Standards</a></li>--%>
            <%--<li><a class="menu-a" href="documents">Support</a></li>--%>
            <li class="dropdown">
                <a class="menu-a" data-toggle="dropdown" style="font-size: 14px;">
                    Support<i class="dropdown icon"></i>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="https://ngdc.cncb.ac.cn/gsa/standards" style="font-size: 14px;">Standards</a></li>
                    <li><a href="https://ngdc.cncb.ac.cn/gsa/documents" style="font-size: 14px;">Documentation</a></li>
                    <li><a href="https://ngdc.cncb.ac.cn/gsa/tutorial" style="font-size: 14px;">Tutorial</a></li>
                    <li><a href="https://ngdc.cncb.ac.cn/gsa/faq" style="font-size: 14px;">FAQ</a></li>
                </ul>
            </li>
            <%--<s:if test="%{#session.curUser.getCasUserId()!=null}">--%>
            <%--<li><a class="menu-a" href="grants">Grant Search</a></li>--%>
            <%--</s:if>--%>
            <shiro:hasRole name="Grant">
                <li><a class="menu-a" href="grants">Grant Search</a></li>
            </shiro:hasRole>
            <input type="hidden" value="<%=uid%>" id="uid"/>
        </ul>
        <ul class="nav navbar-nav pull-right">
            <shiro:authenticated>
                <li class="dropdown">
                    <a class="login-a pull-right"  data-toggle="dropdown" style="background:url(img/cra/reg002.png) left center no-repeat;text-decoration:none;cursor:auto;font-size: 14px;">
                        Welcome, <s:property value="#session.curUser.firstName" /><span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                            <%--<li><a href="https://ngdc.cncb.ac.cn/sso/userProfile.action?uid=<s:property value='#session.curUser.casUserId' />&service=https://ngdc.cncb.ac.cn/gsa/logout" target="_blank">User Profile</a></li>--%>
                        <li><a href="https://ngdc.cncb.ac.cn/account/user-profile?service=https://ngdc.cncb.ac.cn/gsa/logout" target="_blank" style="font-size: 14px;">User Profile</a></li>
                        <li><a href="https://ngdc.cncb.ac.cn/account/reset?service=https://ngdc.cncb.ac.cn/gsa/logout" style="font-size: 14px;">Reset Password</a></li>
                        <li><a href="logout">Logout</a></li>
                        <li>
                    </ul>
                </li>
                <%--                <li class="pull-right">
                                    <a class="login-a pull-right" href="logout"
                                       style="background:url(img/cra/reg003.png) left center no-repeat;">Logout
                                    </a>
                                </li>
                                <li class="pull-right">
                                    <a class="login-a pull-right" href="/gsa/inc/reset_password_sso.jsp"  title="Reset password"
                                       style="background:url(img/cra/reg002.png) left center no-repeat;">
                                        Reset password
                                    </a></li>
                                <li class="pull-right">
                                    <a class="login-a pull-right"
                                       style="text-decoration:none;cursor:auto;">
                                        Welcome, <s:property value="#session.curUser.firstName" />
                                    </a></li>--%>
            </shiro:authenticated>
            <shiro:notAuthenticated>
                <li class="pull-right">
                        <%--<a class="login-a pull-right" href="https://ngdc.cncb.ac.cn/account/register?service=http://localhost:8080/gsa/account/casregister"--%>
                        <%--style="background:url(img/cra/reg003.png) left cenr no-repeat;">Register</a>--%>
                    <a class="login-a pull-right" href="https://ngdc.cncb.ac.cn/account/register?service=https://ngdc.cncb.ac.cn/gsa/account/casregister"
                       style="background:url(img/cra/reg003.png) left center no-repeat;font-size: 14px;v">Register</a>
                </li>
                <li class="pull-right">
                    <a class="login-a pull-right" href="http://192.168.164.84:9131/sso/login?service=http://localhost:8080/gsa/taxonomyAnalysis/login"
                       style="background:url(img/cra/reg002.png) left center no-repeat;font-size: 14px;">Login</a>
                        <%--<a class="login-a pull-right" href="https://ngdc.cncb.ac.cn/sso/login?service=https://ngdc.cncb.ac.cn/gsa/login"--%>
                        <%--style="background:url(img/cra/reg002.png) left center no-repeat;">Login</a>--%>
                </li>
            </shiro:notAuthenticated>
        </ul>
    </div>
</nav>
