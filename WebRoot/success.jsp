<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>SUCCESS - BioProject - CNCB-NGDC</title>
    <jsp:include page="/inc/css_js.jsp"/>
  </head>
  <body>
    <jsp:include page="/inc/header.jsp"/>
    <div class="container">	
		<div class="alert alert-success" role="alert" style="height:150px">
    		<h3><%=request.getAttribute("message")%></h3>	 
    		<s:set var="url" value="%{'/submit/' + #submissionPart + '/list'}"></s:set>
			If you are not automatically redirected to it in <span id="time">5</span> seconds, please <a href='/submit/<%=request.getAttribute("submissionPart")%>/list'>click here</a>!		   
		</div>
  	</div>
	<script  type="text/javascript">
		function delayURL(url) {
		    var delay = document.getElementById("time").innerHTML;
		    if (delay > 0) {
		        delay--;
		        document.getElementById("time").innerHTML = delay
		    } else {
		        window.top.location.href = url
		    }
		    setTimeout("delayURL('" + url + "')", 1000)
		}
		var part = '<%=request.getAttribute("submissionPart")%>';
		var url = "/submit/" + part + "/list";
		delayURL(url);		
	</script>  	
  </body>
</html>
