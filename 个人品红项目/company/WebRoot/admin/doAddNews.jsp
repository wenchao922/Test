<%@ page language="java" import="java.util.*,java.sql.*,com.accp800.model.*,com.accp800.dao.impl.*,com.accp800.dao.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	Timestamp now=new Timestamp(System.currentTimeMillis());
	
	String type=request.getParameter("type");
	INewsDao newsdao=new NewsDao();
	
	if(type.equals("1")){//添加新闻
		News news=new News(title,content,now);
		try{
			if(newsdao.addNews(news)){
%>
	<script type="text/javascript">alert("添加成功！");</script>
<%		
			}
		}catch(Exception e){
%>
	<script type="text/javascript">alert("添加失败！");</script>
<%
		}
	}else{
		int newsId=Integer.parseInt(request.getParameter("newsId"));
		News n=new News(newsId,title,content,now);
		try{
			if(newsdao.updateNewsById(n)){
%>
	<script type="text/javascript">alert("修改成功!");</script>
<%	
			}
		}catch(Exception e){
%>
	<script type="text/javascript">alert("修改失败！");</script>
<%
		}
	}
%>
<script type="text/javascript">
location="manageNews.jsp";
</script>