<%@ page language="java" pageEncoding="GBK" import="java.util.*,com.st275.common.*"%>
<%
String path = request.getContextPath();
session.setAttribute("uName", null);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>ע��</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="<%=path%>/style/style.css"/>
</HEAD>

<BODY>
<DIV>
	<IMG src="<%=path%>/image/logo.gif">
</DIV>


<BR/>
<!--      ����        -->
<DIV>
	&gt;&gt;<B><a href="<%=path%>/index.jsp">��̳��ҳ</a></B>
</DIV><BR/>
<!--      ������Ϣ        -->
<DIV class="t" align="center">
	<BR/>
	<font color="red">ע���ɹ�, ��ӭ���ٱ�վ!</font>
	<BR/><BR/>
	<input type="button" value="�� ��" onclick="location='<%=path%>/login.jsp'; " class="btn"/>
	<BR/><BR/>
</DIV>
<!--      ����        -->
<BR/>
<CENTER class="gray">2007 Beijing Aptech Beida Jade Bird
Information Technology Co.,Ltd ��Ȩ����</CENTER>
</BODY>
</HTML>
