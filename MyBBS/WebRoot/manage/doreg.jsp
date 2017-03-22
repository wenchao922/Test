<%@ page language="java" import="java.util.*,com.st275.user.reg.*,com.st275.user.entity.*" pageEncoding="GBK"%>
<%
//获取上个页面提交请求的表单信息
String uName = request.getParameter("uName");
String uPass = request.getParameter("uPass");
String gender = request.getParameter("gender");
String head = request.getParameter("head");
boolean flag = false;
//创建实体类
User user = new User();
user.setUName(uName);
user.setUPass(uPass);
user.setGender(gender);
user.setHead(head);
//创建数据库访问类对象
RegisterDAO dao = new RegisterDAO();
//操作完毕后即将跳转的页面
String forward = "";	
if(dao.isExistAccount(uName)){	
	//如果账户名存在
	forward = "../error/error.jsp?msg=注册的用户名已经被人使用";
} else {
	flag = dao.insert(user);//插入新帐号到数据库
	if(flag) {
		//如果注册成功!
		forward = "../success/regsuccess.jsp";
	} else {
		forward = "../error/error.jsp?msg=非常抱歉!注册时发生错误,注册失败,请与管理员联系!";
	}
}
request.getRequestDispatcher(forward).forward(request,response);//执行页面跳转
%>