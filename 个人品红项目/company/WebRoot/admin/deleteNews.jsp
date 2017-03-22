<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*" pageEncoding="UTF-8"%>
<%
	String[] newsId=request.getParameterValues("delete");
	
	INewsDao newsdao=new NewsDao();
	int count=0;
	try{
		for(int i=0;i<newsId.length;i++){
			if(newsdao.deleteNewsById(Integer.parseInt(newsId[i]))){
				count++;
			}	
		}
	}catch(Exception e){
%>
<script>alert("出现错误！");location="manageNews.jsp";</script>
<%
	}
	if(count>0){
%>
<script>alert("删除成功！");location="manageNews.jsp";</script>
<%}%>