<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Page myPage = (Page) request.getAttribute("page");
	String myUrl = (String) request.getAttribute("myUrl");

	String defaultLink = "";
	String firstLink = "";
	String previousLink = "";
	String nextLink = "";
	String lastLink = "";
	String ps = "";

	if (myPage != null && myPage.getRowCount() > 0) {
		if (myUrl.indexOf("?") == -1) {
			myUrl = myUrl + "?";
		} else {
			myUrl = myUrl + "&";
		}
		ps = String.valueOf(myPage.getPageSize());
		ParameterHandler ph = new ParameterHandler(request);

		int totalCount = myPage.getRowCount();
		//ph.add("totalCount", String.valueOf(totalCount));
		ph.add("pageSize", String.valueOf(myPage.getPageSize()));

		defaultLink = myUrl + ph.toString();
		//out.println(defaultLink);
		ph.add("pageNo", String.valueOf(myPage.getFirstPageNo()));
		firstLink = myUrl + ph.toString();
		//out.println(firstLink);
		ph.add("pageNo", String.valueOf(myPage.getPreviousPageNo()));

		previousLink = myUrl + ph.toString();
		//out.println(previousLink);
		ph.add("pageNo", String.valueOf(myPage.getNextPageNo()));

		nextLink = myUrl + ph.toString();
		//out.println(nextLink);
		ph.add("pageNo", String.valueOf(myPage.getLastPageNo()));
		lastLink = myUrl + ph.toString();
		//out.println(lastLink);
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>GSA-Genome Sequence Archive</title>
<link rel="stylesheet" type="text/css" href="/css/action.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<!-- js -->
<script type="text/javascript" src="/js/jquery.min.js" ></script>
<script type="text/javascript"  src="/js/sdmenu.js"></script>
<script type="text/javascript" src="/js/mm_menu.js" ></script>

</head>
<body>
<script language="JavaScript1.2">mmLoadMenus();</script>
<div class="nav_links">
  <div class="nav_links1">
    <div class="nav_links1_1"><a href="/index.jsp" >Home</a></div>
    <s:if test="#session.userAuthor.sysManager == '1'">
    <div class="nav_links1_2">|</div>
	<div class="nav_links1_1"><a href="/sys/getUserList.action">System Manager</a></div>
	</s:if>
    <div class="nav_links1_2">|</div>
    <div class="nav_links1_1"><a href="/browse/list_summary.jsp" name="link5" id="link5" onmouseover="MM_showMenu(window.mm_menu_0531100855_0,-18,30,null,'link5')" onmouseout="MM_startTimeout();">Overview</a></div>
    <div class="nav_links1_2">|</div>
    <div class="nav_links1_1"><a href="/submit/project/general!newProject.action" name="link1" id="link1" onmouseover="MM_showMenu(window.mm_menu_0531100840_0,-28,30,null,'link1')" onmouseout="MM_startTimeout();">BioProject</a></div>
    <div class="nav_links1_2">|</div>
    <div class="nav_links1_1"><a href="/submit/sample/sampleGeneral!newSample.action" name="link2" id="link2" onmouseover="MM_showMenu(window.mm_menu_0531100850_0,-26,30,null,'link2')" onmouseout="MM_startTimeout();" >BioSample</a></div>
    <div class="nav_links1_2">|</div>
    <div class="nav_links1_1"><a href="/submit/expt/myExperiments.action" name="link3" id="link3" onmouseover="MM_showMenu(window.mm_menu_0531100851_0,-42,30,null,'link3')" onmouseout="MM_startTimeout();" >Experiment</a></div>
    <div class="nav_links1_2">|</div>
    <div class="nav_links1_1"><a href="/download.jsp" name="link4" id="link4" onmouseover="MM_showMenu(window.mm_menu_0531100854_0,-25,30,null,'link4')" onmouseout="MM_startTimeout();" >Downloads</a></div>
    <div class="nav_links1_2">|</div>
    <div class="nav_links1_1"><a href="#">Document</a></div>
    <s:if test="#session.userAuthor!=null">
    <div class="nav_log"><a href="/login/logout.action">log out</a></div>
    <div class="nav_links1_4">|</div>
    <div class="nav_login"><span class="icon"></span>logged in as <span style="margin-left:5px;color:#fff;"><s:if test="#session.userAuthor.sysManager == '1'">Admin</s:if><s:else><s:property value="#session.userAuthor.userName" /></s:else></span></div>
    </s:if>
	<s:elseif test="#attr.curURL!='/member/register.jsp'">
    <div class="nav_reg"><a href="/member/register.jsp">register</a></div>
    <div class="nav_links1_4">|</div>
    <div class="nav_login"><a href="/member/login.jsp">log in</a></div>	
	</s:elseif>    
  </div>
</div>
<!-- header | end -->
<!-- search-->
<div class="ind_search">
  <div class="ind_search1">
    <div class="ind_logo"><img src="/img/in_logo.png" /></div>
    <s:form action="adsearch-input.action">
    <div class="search"><input name="term" type="text" onKeyDown="if (event.keyCode==13) {}" onBlur="if(this.value=='')value='Search here';" onFocus="if(this.value=='Search here')value='';" style="width:490px; height:37px; background-color:#e6e6e6; border:none; font-size:14px; line-height:21px; color:#333; padding-left: 10px; line-height:37px; color: #605f5f;" /><button style="cursor:hand" title="Search">Search</button></div>
    <div class="search2">Key words related to advanced project search.</div>
  </div>
</div>
<!-- search-end -->

<!-- projects-->
<div class="content">
  <div class="title">You now at: Results</div>
  <div class="action_left">
    <div id="my_menu" class="sdmenu">
      <div>
		<span>Species</span>
		<s:radio list="#{'':''}" name="taxonName" style="display:none"/>
		<a href="#"><s:radio id="species-1" list="#{'human':'human'}" name="taxonName" /></a>
		<a href="#"><s:radio id="species-2" list="#{'mouse':'mouse'}" name="taxonName" /></a>
		<a href="#"><s:radio id="species-3" list="#{'rat':'rat'}" name="taxonName" /></a>
        <a href="#"><s:radio id="species-4" list="#{'zebrafish':'zebrafish'}" name="taxonName" /></a>
	</div>
	<div>
		<span>Type</span>
		<s:radio list="#{'':''}" name="dataTypeName" style="display:none"/>
		<a href="#"><s:radio id="type-1" list="#{'genome':'Whole-genome sequencing'}" name="dataTypeName" /></a>
		<a href="#"><s:radio id="type-2" list="#{'RNA':'RNA-seq'}" name="dataTypeName" /></a>
		<a href="#"><s:radio id="type-3" list="#{'chip':'CHiP-seq'}" name="dataTypeName" /></a>
  </div>
	<div>
		<span>Platform</span>
		<s:radio list="#{'':''}" name="methodologyName" style="display:none"/>
		<a href="#"><s:radio id="platform-1" list="#{'sequencing':'Illumina HiSeq2500'}" name="methodologyName" /></a>
		<a href="#"><s:radio id="platform-2" list="#{'array':'Illumina HiSeq2000'}" name="methodologyName" /></a>
		<a href="#"><s:radio id="platform-3" list="#{'solid':'SOLiD'}" name="methodologyName" /></a>
  </div>
	<div>
		<span>Disease/Phenotype/Trait</span>
		<li><input name="relevance" type="text" onKeyDown="if (event.keyCode==13) {}" onBlur="if(this.value=='')value='Search here...';" onFocus="if(this.value=='Search here...')value='';" value="Search here..." style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;"/></li>
		<a href="#" style="font-size:13px;">Please input your query disease/phenotype/trait. eg. lung cancer, breast cancer or leukemia.</a>
  </div>
	<div>
		<span>Tissue/cell line</span>
		<li><input name="materialName" type="text" style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;"/></li>
		<a href="#" style="font-size:13px;">Please input your query tissue/cell line. eg. K562 or HSC.</a>
  </div>
	<div>
		<span>Special topics</span>
		<s:radio list="#{'':''}" name="title" style="display:none"/>
		<a href="#"><s:radio list="#{'stem':'stem cell'}" id="hotspot-1" name="title" /></a>
		<a href="#"><s:radio list="#{'brain':'brain'}" id="hotspot-2" name="title" /></a>
		<a href="#"><s:radio list="#{'lung':'lung'}" id="hotspot-3" name="title" /></a>
	</div>
    <div>
		<span>Publication date</span>
		<a href="#">After <select name="time1" style="width:65px; height:24px; font-size:13px; color:#333; line-height:20px; margin-right:5px;">
												<option value="1999-01-01">1999</option>
												<option value="2000-01-01">2000</option>
												<option value="2001-01-01">2001</option>
												<option value="2002-01-01">2002</option>
												<option value="2003-01-01">2003</option>
												<option value="2004-01-01">2004</option>
												<option value="2005-01-01">2005</option>
												<option value="2006-01-01">2006</option>
												<option value="2007-01-01">2007</option>
												<option value="2008-01-01">2008</option>
												<option value="2009-01-01">2009</option>
												<option value="2010-01-01">2010</option>
												<option value="2011-01-01">2011</option>
												<option value="2012-01-01">2012</option>
												<option value="2013-01-01">2013</option>
												<option value="2014-01-01">2014</option>
		</select> Before <select name="time2" style="width:65px; height:24px; font-size:13px; color:#333; line-height:20px">
												<option value="2017-12-31">2017</option>
												<option value="2016-12-31">2016</option>
												<option value="2015-12-31">2015</option>
												<option value="2014-12-31">2014</option>
												<option value="2013-12-31">2013</option>
												<option value="2012-12-31">2012</option>
												<option value="2011-12-31">2011</option>
												<option value="2010-12-31">2010</option>
												<option value="2009-12-31">2009</option>
												<option value="2008-12-31">2008</option>
												<option value="2007-12-31">2007</option>
												<option value="2006-12-31">2006</option>
												<option value="2005-12-31">2005</option>
												<option value="2004-12-31">2004</option>
												<option value="2003-12-31">2003</option>
												<option value="2002-12-31">2002</option>
												<option value="2001-12-31">2001</option>
												<option value="2000-12-31">2000</option>
		</select></a>
	</div>
    <div>
		<span>Author</span>
		<li><input name="biomaterialProvider" type="text" style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;"/></li>
		<a href="#" style="font-size:13px;">Help information here.</a>
	</div>
    <div>
		<span>Institution</span>
		<li><input name="organization" type="text" style="height:20px; width:210px; border:1px solid #35a5e5; margin-left:20px; margin-top:8px;"/></li>
		<a href="#" style="font-size:13px;">Help information here.</a>
	</div>
   </div>
    <div class="action_left1"><button class="button" >Reset</button><button class="button">Update</button></div>
    </s:form>
  </div>
 </div>
 
 <script type="text/javascript">
var myMenu;
window.onload = function(){
	myMenu = new SDMenu("my_menu");
	myMenu.init();
	var firstSubmenu = myMenu.submenus[0];
	myMenu.expandMenu(firstSubmenu);
};
</script>

  <div class="action_right">
    <div class="action_right1">Results for Searching Keywords</div>
     <table width="890"class="pickme"	id="striped2"caption="Top Grossing Movies">
  <thead>
    <tr>
	  <th width="103" >Accession</th>
	  <th width="518">Title</th>
	  <th width="158">Relevance</th>
	  <th width="103">Release Time</th>
    </tr>
  </thead>
  <tbody>
		<s:iterator value="listProjects">
     	<tr>
		<td><a href="/browse/project/detail.action?accession=<s:property value='accession'/>&prjId=<s:property value='prjId'/>&access=1"><s:property value="accession"/></a></td>
		<td><s:property value="title"/></td>
		<td><s:property value="relevance"/></td> 	
		<td><s:property value="releaseTime"/></td>   	
     	</tr>
		</s:iterator>
  </tbody>
  </table>
	<div class="action_right1">
		<span>&nbsp;Total Records:&nbsp;<s:property value="#request.page.rowCount" />&nbsp;
			Terms of <s:if test="%{#request.page.rowFrom==0}">1</s:if>
			<s:else>
			<s:property value="#request.page.rowFrom" />
			</s:else>-<s:property value="#request.page.rowTo" />
		</span>
		<span style="padding-left: 10px;">Page size&nbsp;
			<select name="pageSize" id="listpage" onchange="setPageSize(this,'<%=defaultLink%>')">
			<option value="20" <s:if test="page.pageSize==20"> selected="selected"</s:if>>
				20
			</option>
			<option value="30" <s:if test="page.pageSize==30"> selected="selected"</s:if>>
				30
			</option>
			<option value="40" <s:if test="page.pageSize==40"> selected="selected"</s:if>>
				40
			</option>
			<option value="50" <s:if test="page.pageSize==50"> selected="selected"</s:if>>
				50
			</option>
			</select>
		</span>

		<span style="padding-left: 10px;"> Page<s:property value="page.pageNo"/>/<s:property value="page.lastPageNo" /></span>
			<span style="padding-left: 10px;"><a style="color: #0066FF; text-decoration: none;" href="<%=firstLink%>"> << First </a><s:if test="page.isHasPreviousPage==1">
				<a style="color: #0066FF; text-decoration: none;" href="<%=previousLink%>"> < Previous </a>
				</s:if> <s:if test="page.isHasNextPage==1">
				<a style="color: #0066FF; text-decoration: none;" href="<%=nextLink%>"> Next > </a>
				</s:if> <a style="color: #0066FF; text-decoration: none;" href="<%=lastLink%>"> Last >> </a></span>
			<span style="padding-left: 10px;">Skip To
				<input size="5" type="text" id="gono" name="gono" value="<s:property value='page.pageNo' />" />
				<input type="button" value="GO" onclick="goPage('<%=defaultLink%>', '<s:property value="page.pageNo"/>')" />
		</span>
	</div>
</div>
<script language="JavaScript">

	//function init()
	//{
	//	getcurtime();
		//window.setInterval('getcurtime()',1000);//1s
	//}
	
	//function getcurtime()
		//{
			//var time = document.getElementById("today");
			//var date = new Date();
			//time.innerText="鐜板湪鏄�+date.toLocaleString();
		//}
	function goPage(url, pno) {
		var no = document.getElementById("gono");
		var tar = "";
		if (url.indexOf("pageNo") > 0) {
			var head = url.substring(0, url.indexOf("pageNo"));
			var tail = url.substring(url.indexOf("pageNo") + 7 + pno.length,
					url.length);
			tar = head + 'pageNo=' + no.value + tail;
		} else {
			tar = url + '&pageNo=' + no.value;
		}
		window.location = tar;
	}
	function setPageSize(sel, url) {
		var size = document.getElementById("listpage").value;
		var head = url.substring(0, url.indexOf("pageSize"));
		var tail = url.substring(url.indexOf("pageSize") + 11, url.length);
		var tar = head + 'pageSize=' + size + tail;
		window.location = tar;
	}			

</script>
</body>
</html>