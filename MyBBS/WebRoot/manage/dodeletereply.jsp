<%@ page language="java" import="java.util.*,com.st275.reply.entity.*,com.st275.reply.dao.*" pageEncoding="GBK"%>
<%
request.setCharacterEncoding("GBK");
//��ȡ�ϸ�ҳ���ύ����ı���Ϣ
String replyId = request.getParameter("replyId");

///////////////////////////////////////
String uId = "68";//Sessionѧ����������ʰ��
///////////////////////////////////////

boolean flag = false;
//����ʵ����
Reply reply = new Reply();
reply.setReplyId(replyId);

//�������ݿ���������
ReplyDAO dao = new ReplyDAO();
//������Ϻ󼴽���ת��ҳ��
String forward = "";	
if(dao.delete(reply)){
	forward = "../success/delreplysuccess.jsp";
} else {
	forward = "../error/error.jsp?msg=�ǳ���Ǹ!������ʱ��������,����ʧ��,�������Ա��ϵ!";
}
request.getRequestDispatcher(forward).forward(request,response);//ִ��ҳ����ת
%>