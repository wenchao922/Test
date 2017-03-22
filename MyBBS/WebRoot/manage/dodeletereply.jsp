<%@ page language="java" import="java.util.*,com.st275.reply.entity.*,com.st275.reply.dao.*" pageEncoding="GBK"%>
<%
request.setCharacterEncoding("GBK");
//获取上个页面提交请求的表单信息
String replyId = request.getParameter("replyId");

///////////////////////////////////////
String uId = "68";//Session学完我再来收拾你
///////////////////////////////////////

boolean flag = false;
//创建实体类
Reply reply = new Reply();
reply.setReplyId(replyId);

//创建数据库访问类对象
ReplyDAO dao = new ReplyDAO();
//操作完毕后即将跳转的页面
String forward = "";	
if(dao.delete(reply)){
	forward = "../success/delreplysuccess.jsp";
} else {
	forward = "../error/error.jsp?msg=非常抱歉!回帖帖时发生错误,回帖失败,请与管理员联系!";
}
request.getRequestDispatcher(forward).forward(request,response);//执行页面跳转
%>