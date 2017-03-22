<%@ page language="java" import="java.util.*,com.st275.topic.entity.*,com.st275.topic.dao.*" pageEncoding="GBK"%>
<%
request.setCharacterEncoding("GBK");
//获取上个页面提交请求的表单信息
String boardId = request.getParameter("boardId");
String title = request.getParameter("title");
String content = request.getParameter("content");

///////////////////////////////////////
String uId = "68";//Session学完我再来收拾你
///////////////////////////////////////

boolean flag = false;
//创建实体类
Topic topic = new Topic();
topic.setBoardId(boardId);
topic.setTitle(title);
topic.setContent(content);
topic.setUId(uId);
//创建数据库访问类对象
TopicDAO dao = new TopicDAO();
//操作完毕后即将跳转的页面
String forward = "";	
if(dao.insert(topic)){	
	forward = "../success/postsuccess.jsp";
} else {
	forward = "../error/error.jsp?msg=非常抱歉!发帖时发生错误,发帖失败,请与管理员联系!";
}
request.getRequestDispatcher(forward).forward(request,response);//执行页面跳转
%>