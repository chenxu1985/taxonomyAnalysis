<%
	String path = request.getContextPath();
	String serverName=request.getServerName();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	out.print(path);
	out.println("---");
	out.print(serverName);
	out.print("---");
	out.print(basePath);
	basePath="http://localhost:8080/bioproject";
	//basePath=path;
%>
<base href="<%=basePath%>" />