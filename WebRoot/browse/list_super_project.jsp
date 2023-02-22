<%@ page language="java" import="cn.ac.big.gsa.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>GSA-Genome Sequence Archive</title>
<!-- base.css | 元素还原基础样式 -->
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<!-- main.css | 页面主体样式 -->
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css" href="/css/tabletree/core.css">
<link rel="stylesheet" type="text/css" href="/css/tabletree/GridTree.css">
<!-- js -->
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/mm_menu.js"></script>
<script type="text/javascript" src="/js/tabletree/hashMap.js"></script>
<script type="text/javascript" src="/js/tabletree/GridTree.All.js"></script>
<script type="text/javascript" src="/js/tabletree/myTree3.js"></script>





</head>
<body>

<!-- header -->
<script type="text/javascript" language="javascript">mmLoadMenus();</script>
<jsp:include page="/inc/header.jsp"></jsp:include>
 
<div id="content">
  <div id="bread">You now at:  BioProject > Umbrella Projects</div>
  <div class="my_content">
  <table width="1200" class="pickme" id="super_table" caption="Top Grossing Movies">
</table>
  </div>
</div>
<!--<script type="text/javascript">
	$(document).ready(function () { //这个就是传说的ready  
		$(".resultable tr").mouseover(function () {
			//如果鼠标移到class为t1的表格的tr上时，执行函数  
			$(this).addClass("over");
		}).mouseout(function () {
			//给这行添加class值为over，并且当鼠标一出该行时执行函数  
			$(this).removeClass("over");
		}) //移除该行的class  
			$(".resultable tr:even").addClass("even");
			//给class为t1的表格的偶数行添加class值为alt
		});
</script>-->
</body>
</html>