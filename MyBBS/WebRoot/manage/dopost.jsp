<%@ page language="java" import="java.util.*,com.st275.topic.entity.*,com.st275.topic.dao.*" pageEncoding="GBK"%>
<%
request.setCharacterEncoding("GBK");
//��ȡ�ϸ�ҳ���ύ����ı���Ϣ
String boardId = request.getParameter("boardId");
String title = request.getParameter("title");
String content = request.getParameter("content");

///////////////////////////////////////
String uId = "68";//Sessionѧ����������ʰ��
///////////////////////////////////////

boolean flag = false;
//����ʵ����
Topic topic = new Topic();
topic.setBoardId(boardId);
topic.setTitle(title);
topic.setContent(content);
topic.setUId(uId);
//�������ݿ���������
TopicDAO dao = new TopicDAO();
//������Ϻ󼴽���ת��ҳ��
String forward = "";	
if(dao.insert(topic)){	
	forward = "../success/postsuccess.jsp";
} else {
	forward = "../error/error.jsp?msg=�ǳ���Ǹ!����ʱ��������,����ʧ��,�������Ա��ϵ!";
}
request.getRequestDispatcher(forward).forward(request,response);//ִ��ҳ����ת
%>