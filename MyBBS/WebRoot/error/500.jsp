<%@ page language="java" pageEncoding="GBK" import="java.util.*,com.st275.common.*"%>
<%
request.setCharacterEncoding("GBK");//如果不加入此行, 得到的msg信息将会是乱码
String path = request.getContextPath();	//得到当前页面的上下文路径, 不清楚的话, debug或者把值打印出来看看就明白了
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>系统异常</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="<%=path%>/style/style.css"/>
</HEAD>

<BODY>

<BR/>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="<%=path%>/index.jsp">首页</a></B>
</DIV><BR/>
<!--      错误信息        -->
<DIV class="t" align="center">
	<BR/>
	<font color="red">很抱歉, 系统发生内部错误, 请及时与管理员联系!</font>
	<BR/><BR/>
	<input type="button" value="返 回" onclick="window.history.back();" class="btn"/>
	<BR/><BR/>
</DIV>
<!--      声明        -->
<BR/>
<CENTER class="gray">2007 Beijing Aptech Beida Jade Bird
Information Technology Co.,Ltd 版权所有</CENTER>
</BODY>
</HTML>
