<%@ page language="java" import="java.util.*,com.accp800.dao.*,com.accp800.dao.impl.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String param=request.getParameter("param");
	String username=request.getParameter("userName");
	String upwd=request.getParameter("password");
	
	IUserDao userdao=new UserDao();
	User user=null;
	List<User> users=(List<User>)application.getAttribute("listUser");
	if(param.equals("login")){//登陆
		try{
			user=userdao.login(username,upwd);
			session.setAttribute("user",user);
			response.sendRedirect("main.jsp");
			
			if(users==null){
				users=new ArrayList<User>();
			}
			boolean bool=true;
			for(User u:users){
				if(u.getUName().equals(user.getUName())){
					bool=false;
				}
			}
			if(bool){
				users.add(user);
			}
			application.setAttribute("listUser",users);
		}catch(Exception e){
			request.setAttribute("loginerror","用户名或密码不正确");
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
	}else{//注册
		user=new User(username,upwd,0);
		try{
			if(userdao.addUser(user)){
%>
	<script>
		alert("注册成功！");
		window.location="index.jsp";
	</script>
<%
			}
		}catch(Exception e){
			request.setAttribute("registerError","注册失败！用户名不可用");
			request.getRequestDispatcher("register.jsp").forward(request,response);
		}
	}
 %>

