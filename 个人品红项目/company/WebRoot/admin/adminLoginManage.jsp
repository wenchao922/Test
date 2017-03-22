<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<%
	String userName=request.getParameter("userName");
	String password=request.getParameter("password");
	IUserDao userdao=new UserDao();
	User u=null;
	try{
		u=userdao.adminLogin(userName,password);
		response.sendRedirect("index.jsp");
	}catch(Exception e){
%>
<script>alert("您没有权限登陆后台管理！");location="../login.jsp";</script>
<%
	}
%>

