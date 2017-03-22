<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String topPath = request.getContextPath();
String uName = "匿名"; 
if(session.getAttribute("uName") == null) {
	String forward = "/common/sessionout.jsp?msg=你的操作已经过期, 请重新登录!";
	request.getRequestDispatcher(forward).forward(request,response);//执行页面跳转
	return;
} else {
	uName = session.getAttribute("uName").toString();
}
%>
<DIV>
	<br><IMG src="<%=topPath %>/image/logo.gif">
</DIV>

<!--      用户信息、登录、注册        -->

	<DIV class="h">
		欢迎您!<%=uName %>　<a href="<%=topPath %>/login.jsp">登录</a>
		&nbsp;| &nbsp; <A href="<%=topPath %>/reg.jsp">注册</A>
		&nbsp;| &nbsp; <A href="<%=topPath %>/manage/loginout.jsp">注销</A> |
	</DIV>
