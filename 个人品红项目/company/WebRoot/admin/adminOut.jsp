<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminOut.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="Refresh" content="5;url=index.jsp">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  	<%
  		session.removeAttribute("user");
  	 %>
  <body onload="countTime()">
    用户已经退出, <span id="time">5</span>秒后自动进入首页,或<a href="index.jsp">点击这里</a>直接进入首页
    <script>
    	var time = 5;
    	function countTime() {
			document.getElementById("time").innerText = time;
			time--;
			if(time >= 0) {
				setTimeout("countTime()", 1000);
			}
        }
    </script>
  </body>
</html>
