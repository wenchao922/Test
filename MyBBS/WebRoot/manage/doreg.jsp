<%@ page language="java" import="java.util.*,com.st275.user.reg.*,com.st275.user.entity.*" pageEncoding="GBK"%>
<%
//��ȡ�ϸ�ҳ���ύ����ı���Ϣ
String uName = request.getParameter("uName");
String uPass = request.getParameter("uPass");
String gender = request.getParameter("gender");
String head = request.getParameter("head");
boolean flag = false;
//����ʵ����
User user = new User();
user.setUName(uName);
user.setUPass(uPass);
user.setGender(gender);
user.setHead(head);
//�������ݿ���������
RegisterDAO dao = new RegisterDAO();
//������Ϻ󼴽���ת��ҳ��
String forward = "";	
if(dao.isExistAccount(uName)){	
	//����˻�������
	forward = "../error/error.jsp?msg=ע����û����Ѿ�����ʹ��";
} else {
	flag = dao.insert(user);//�������ʺŵ����ݿ�
	if(flag) {
		//���ע��ɹ�!
		forward = "../success/regsuccess.jsp";
	} else {
		forward = "../error/error.jsp?msg=�ǳ���Ǹ!ע��ʱ��������,ע��ʧ��,�������Ա��ϵ!";
	}
}
request.getRequestDispatcher(forward).forward(request,response);//ִ��ҳ����ת
%>