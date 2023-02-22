<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page language="java" import="java.util.Date" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>NGDC - BioProject</title>
	<jsp:include page="/inc/css_js.jsp"/>
</head>
<body>
	<jsp:include page="/inc/header_project.jsp"/>
	<div class="container">
	<div class="panel panel-info">
		<div class="panel-body" >
		  <div class="header_content">
			  <iframe width="100%" height="450"  frameborder="no" border="0" marginwidth="0" marginheight="0" src="https://ngdc.cncb.ac.cn/account/reset-iframe?service=https://ngdc.cncb.ac.cn/bioproject/logout">
				</iframe>
		  </div>
		<div style="clear: both;"></div>			
		</div>
       
	</div>
		<jsp:include page="/inc/footer.jsp"/>
</div>
<script type="text/javascript">
</script>
</body>
</html>

