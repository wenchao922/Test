<%@ page language="java" import="java.util.*,com.st275.user.login.*" pageEncoding="GBK"%>
<%
String uName = request.getParameter("uName");
String uPass = request.getParameter("uPass");
UserDAO dao = new UserDAO();

boolean flag = dao.validateUser(uName, uPass);
//������Ϻ󼴽���ת��ҳ��
String forward = "";	
if(flag) {	//�����֤ͨ��
	forward = "../index.jsp";
	session.setAttribute("uName", uName);
} else {
	forward = "../error/error.jsp?msg=��¼ʧ��, ��������û��������벻����!";
}
request.getRequestDispatcher(forward).forward(request,response);//ִ��ҳ����ת
%>