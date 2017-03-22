<%@ page language="java" import="com.accp800.model.*,com.accp800.dao.*,com.accp800.dao.impl.*" pageEncoding="UTF-8"%>
<%
	String username=request.getParameter("userName");
	String pwd=request.getParameter("password");
	
	User u =new User(username,pwd,1);
	IUserDao userdao=new UserDao();
	try{
		if(userdao.addUser(u)){
%>
<script type="text/javascript">
<!--
alert("添加成功");
location="showUserList.jsp";
//-->
</script>
<%		
		}
	}catch(Exception e){
%>
<script type="text/javascript">
<!--
alert("添加失败，可能是因为用户名已经存在！");
location="showUserList.jsp";
//-->
</script>
<%	}%>
