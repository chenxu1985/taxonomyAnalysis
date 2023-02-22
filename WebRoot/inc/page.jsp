<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="cn.ac.big.gsa.util.Page"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script language="javascript" type="text/javascript">
		function setPageSize(url) {
			var size = document.getElementById("listpage").value;
			var tail = "&pageSize=" + size;
			var tar = url + tail;
			window.location = tar;
		}
		function goPage(url) {
			var gono = document.getElementById("gono").value;
			var tail = "&pageNo=" + gono;
			var tar = url + tail;
			window.location = tar;
		}
		</script>
	</head>

	<body>
		<%
			String myUrl = (String) request.getAttribute("myUrl");
			Page myPage = (Page) request.getAttribute("myPage");
			
			int pageSize = myPage.getPageSize();
			int pageNo = myPage.getPageNo();
			int rowCount = myPage.getRowCount();
			int firstPageNo = myPage.getFirstPageNo();
			int lastPageNo = myPage.getLastPageNo();
			
			
			int nextPageNo = pageNo + 1;
			int prevPageNo = pageNo - 1;

			String nextUrl = myUrl + "&pageNo=" + nextPageNo + "&pageSize="
					+ pageSize + "&rowCount=" + rowCount+"&isFirstSearchFlag=0";
			String prevUrl = myUrl + "&pageNo=" + prevPageNo + "&pageSize="
					+ pageSize + "&rowCount=" + rowCount+"&isFirstSearchFlag=0";
			
			String lastPage =  myUrl + "&pageNo=" + lastPageNo + "&pageSize="
					+ pageSize + "&rowCount=" + rowCount+"&isFirstSearchFlag=0";
			String firstPage = myUrl + "&pageNo=" + firstPageNo + "&pageSize="
					+ pageSize + "&rowCount=" + rowCount+"&isFirstSearchFlag=0";

			String pageSizeLink = myUrl + "&pageNo=" + pageNo + "&rowCount="
					+ rowCount+"&isFirstSearchFlag=0";
			String goToPageLink = myUrl + "&pageSize=" + pageSize
					+ "&rowCount=" + rowCount+"&isFirstSearchFlag=0";
		%>
		<table width="90%">
			<tr>
				<td width="28%">
					Total Records
					  <s:property value="page.rowCount" />
					&nbsp;&nbsp;Items of &nbsp;
						<s:if test="page.rowCount>0">
							<s:property value="page.rowFrom" />
						</s:if>
						<s:else>0</s:else>
						&nbsp;
					&nbsp;-&nbsp;
					
					<s:property value="page.rowTo" />
					&nbsp;
					
					
					
			  </td>
				<td width="17%">
					DataNum&nbsp;
					<select name="pageSize" id="listpage"
						onchange="setPageSize('<%=pageSizeLink%>')" style="width:70px">
						<option value="10"
							<s:if test="page.pageSize==10">selected="selected"</s:if>>
							10
						</option>
						<option value="15"
							<s:if test="page.pageSize==15">selected="selected"</s:if>>
							15
						</option>
						<option value="20"
							<s:if test="page.pageSize==20">selected="selected"</s:if>>
							20
						</option>
						<option value="30"
							<s:if test="page.pageSize==30">selected="selected"</s:if>>
							30
						</option>
					</select>
					
			  </td>

				<td width="55%">
					Page 
					  <s:property value="page.pageNo" />/<s:property value="page.lastPageNo" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=firstPage%>" style="color:blue;">First</a>
					<s:if test="page.isHasPreviousPage==1">
						<a href="<%=prevUrl%>" style="color:blue;">Prev</a>
					</s:if>
					<s:else>
						<a disabled="disabled">Prev</a>
					</s:else>
					
					&nbsp;&nbsp;
					<s:if test="page.isHasNextPage==1">
						<a href="<%=nextUrl%>" style="color:blue;">Next</a>
					</s:if>
					<s:else>
						<a disabled="disabled" >Next</a>
					</s:else>
					<a href="<%=lastPage %>" style="color:blue;">Last</a>
					&nbsp;&nbsp;&nbsp;Skip To&nbsp;<input type="text" size="3" id="gono" name="gono" value="<s:property value='page.pageNo'/>"> <input type="button" value="GO" onClick="goPage('<%=goToPageLink%>')" style="margin-left:50px"/>
			  </td>
		</table>
	</body>
</html>
