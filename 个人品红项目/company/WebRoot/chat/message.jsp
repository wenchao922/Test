<%@ page language="java" import="java.util.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>message</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="refresh" content="3">
<link href="image/css.css" rel="stylesheet" type="text/css" />
</head>
<body onload="scroll(0,9999)">
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">

	<%
		request.setCharacterEncoding("utf-8");
		User user = (User)session.getAttribute("user");
		List<String> messages= (List<String>)application.getAttribute("messages");
		if(messages==null || messages.size()==0){
			messages=new ArrayList<String>();
			application.setAttribute("messages",messages);
		}
		
		String msg=request.getParameter("message");
		
		if(msg!=null && msg!=""){
			messages.add("<img src='../image/iboy.gif' />&nbsp;<font color='blue'> "+ user.getUName() + "&nbsp;<b>说 ：</b></font><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+msg);
		}
		
		for(String s:messages){	
	 %>
	<tr align="left">
		<%=s %>
	</tr>
	<%} %>
</table>
</body>
</html>
