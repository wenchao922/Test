<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String topPath = request.getContextPath();
String uName = "����"; 
if(session.getAttribute("uName") == null) {
	String forward = "/common/sessionout.jsp?msg=��Ĳ����Ѿ�����, �����µ�¼!";
	request.getRequestDispatcher(forward).forward(request,response);//ִ��ҳ����ת
	return;
} else {
	uName = session.getAttribute("uName").toString();
}
%>
<DIV>
	<br><IMG src="<%=topPath %>/image/logo.gif">
</DIV>

<!--      �û���Ϣ����¼��ע��        -->

	<DIV class="h">
		��ӭ��!<%=uName %>��<a href="<%=topPath %>/login.jsp">��¼</a>
		&nbsp;| &nbsp; <A href="<%=topPath %>/reg.jsp">ע��</A>
		&nbsp;| &nbsp; <A href="<%=topPath %>/manage/loginout.jsp">ע��</A> |
	</DIV>
