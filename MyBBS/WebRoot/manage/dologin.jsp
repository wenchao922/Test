<%@ page language="java" import="java.util.*,com.st275.user.login.*" pageEncoding="GBK"%>
<%
String uName = request.getParameter("uName");
String uPass = request.getParameter("uPass");
UserDAO dao = new UserDAO();

boolean flag = dao.validateUser(uName, uPass);
//操作完毕后即将跳转的页面
String forward = "";	
if(flag) {	//如果验证通过
	forward = "../index.jsp";
	session.setAttribute("uName", uName);
} else {
	forward = "../error/error.jsp?msg=登录失败, 你输入的用户名和密码不存在!";
}
request.getRequestDispatcher(forward).forward(request,response);//执行页面跳转
%>