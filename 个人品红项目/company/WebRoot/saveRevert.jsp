<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("utf-8");
	int messageId=Integer.parseInt(request.getParameter("messageId"));
	String write=request.getParameter("writer");
	String content=request.getParameter("content");
	
	java.sql.Timestamp now=new Timestamp(System.currentTimeMillis());
	Revert r=new Revert(new Message(messageId),content,write,now);
	IRevertDao revertdao=new RevertDao();
	if(revertdao.addRevert(r)){
		IMessageDao messagedao=new MessageDao();
		Message m=messagedao.findMessageById(messageId);
		if(messagedao.updateMessageById(new Message(messageId,m.getTitle(),m.getContent(),m.getWriter(),m.getWriteDate(),m.getCount()+1))){	
%>
<script>alert("回复成功");location="revertMessage.jsp?messageId=<%=messageId%>" ;</script>
<%		
	}
}
%>	