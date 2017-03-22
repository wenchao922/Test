<%@ page language="java" import="java.util.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>message</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="refresh" content="3">
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body onload="scroll(0,9999)">
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#EBEBEB">
	
	<%
		request.setCharacterEncoding("utf-8");
		List<User> users=(List<User>)application.getAttribute("listUser");
		for(User user:users){
	 %>
	<tr align="left">
		<td height="20"class="p16"><img src="../image/iboy.gif" />&nbsp;<%=user.getUName() %></td>
	</tr>
	<%} %>	
</table>
</body>
</html>


