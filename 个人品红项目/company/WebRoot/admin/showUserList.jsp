<%@ page language="java" import="java.util.*,com.accp800.model.*,com.accp800.dao.impl.*,com.accp800.dao.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>管理人员-管理</title>
	<link href="../image/css/style_admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function selectAll(){
	var boxs=document.getElementsByName("delete");
	for(i=0;i<boxs.length;i++){
		boxs[i].checked=document.getElementById("allbox").checked;
	}
}

function check(){
	var boxs=document.getElementsByName("delete");
	bool=false;
	for(i=0;i<boxs.length;i++){
		if(boxs[i].checked){
			bool=true;
		}
	}
	if(bool==false){
		alert("您没有选择任何用户！");
		return false;
	}
	if(!(window.confirm("确定删除选中的用户吗？"))){
		return false;
	}
	document.form1.submit();
}
</script>
</head>

<body>
<form  name="form1" action="delManager.jsp" method="post">
	<table cellspacing="1" cellpadding="4" width="100%" class="tableborder" id="table3">
			<tr>
				<td colspan="15" class="header">
					用户管理
				</td>
			</tr>
			<tr>
				<td align="center" class="altbg1"  width="100px">
					<input type="checkBox" id="allbox"  onclick="selectAll()"></input>全选&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="javascript:check()">删除</a>
				</td>
				<td align="center" class="altbg1">
					<b>用户名</b>
				</td>
				<td align="center" class="altbg1">
					<b>身份代码</b>
				</td>
			</tr>
			<% 
				IUserDao userdao=new UserDao();
				List<User> users=userdao.findUser();
				for(User u:users){
			%>
			<tr>
				<td rowspan="2" align="center" class="altbg2">
					<input type="checkBox" name="delete" value="<%=u.getUserId() %>"></input>
				</td>
				<td class="altbg2" rowspan="2" align="center">
					<%=u.getUName() %>
				</td>
				<td class="altbg2" rowspan="2" align="center">
					<%=u.getStatus() %>
				</td>
			</tr>
			<tr>
			</tr>
			<%} %>
	</table>
</form>
</body>
</html>