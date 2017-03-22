<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("utf-8");
	String writer=request.getParameter("name");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	Timestamp now=new Timestamp(System.currentTimeMillis());
	
	Message m=new Message(title,content,writer,now,0);
	IMessageDao messagedao=new MessageDao();
	if(messagedao.addMessage(m)){
%>
<script>alert("留言成功！");location="messageBoard.jsp"</script>

<%}%>