<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Taxonomy Analysis - CNCB-NGDC</title>
    <jsp:include page="/inc/css_js.jsp"/>
  </head>
  <body>
    <jsp:include page="/inc/header_taxonomy.jsp"/>
    <script type="text/javascript">
      $(document).ready(function () {
        window.location.href="https://ngdc.cncb.ac.cn/gsa/";
        //setInterval("redirect();",100);
      });
    
      function redirect()
      {
        window.location.href="https://ngdc.cncb.ac.cn/gsa/";
      } 
    </script>
  </body>
</html>
