<%@ page language="java" import="com.accp800.dao.impl.*,com.accp800.dao.*" pageEncoding="UTF-8"%>
<%
	String[] users=request.getParameterValues("delete");
	IUserDao userdao=new UserDao();
	int count=0;
	try{
		for(int i=0;i<users.length;i++){
			if(userdao.deleteUser(Integer.parseInt(users[i]))){	
				count++;
			}
		}	
	}catch(Exception e){
	e.printStackTrace();
%>
<script type="text/javascript">
<!--
alert("出现错误！");
//-->
</script>
<%	
	}
	if(count>0){
 %>
 <script type="text/javascript">
<!--
alert(count + "个用户被删除！");
//-->
</script>
<%}%>
<script>
location="showUserList.jsp";
</script>
