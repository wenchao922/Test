<%@ page language="java" pageEncoding="GBK" import="java.util.*,com.st275.common.*"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>登录</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="<%=path%>/style/style.css"/>
</HEAD>

<BODY>
<DIV>
	<IMG src="<%=path%>/image/logo.gif">
</DIV>


<BR/>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="<%=path%>/index.jsp">论坛首页</a></B>
</DIV><BR/>
<!--      错误信息        -->
<DIV class="t" align="center">
	<BR/>
	<font color="red">恭喜你!注册成功!</font>
	<BR/><BR/>
	<input type="button" value="返 回" onclick="location='<%=path%>/login.jsp'; " class="btn"/>
	<BR/><BR/>
</DIV>
<!--      声明        -->
<BR/>
<CENTER class="gray">2007 Beijing Aptech Beida Jade Bird
Information Technology Co.,Ltd 版权所有</CENTER>
</BODY>
</HTML>
