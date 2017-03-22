<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="../image/css/right.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function check(){
	if(document.form1.userName.value==""){
		alert("用户名不能为空！");
		return false;
	}else if(document.form1.password.value==""){
		alert("密码不能为空！");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<H3 style="color: red" align="center">
<%
	String loginerror=(String)request.getAttribute("loginerror");
	if(loginerror!=null){
		out.print(loginerror);
	}
 %>
</h3>
<form action="registerManage.jsp?param=login" method="post" name="form1" onSubmit="return check()">
<table width="399" border="0" align="center" cellpadding="0"
	cellspacing="0" bordercolor="#EBEBEB">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr align="left">
		<td height="35" colspan="2" bgcolor="#EAF0FB" class="p16">
		<div align="center"><span class="d6">会 员 登 录 </span></div>
		</td>
	</tr>

	<tr>
		<td width="141" height="45" align="center" bgcolor="#EBEBEB"
			class="d5">您的帐号：</td>
		<td width="258" align="left" bgcolor="#EBEBEB"><input
			name="userName" type="text" /></td>
	</tr>
	<tr>

	</tr>
	<tr>
		<td height="45" align="center" bgcolor="#EBEBEB" class="d5">
		您的密码：</td>
		<td align="left" bordercolor="#EBEBEB" bgcolor="#EBEBEB"><input
			name="password" type="password" size="21" /></td>
	</tr>
	<tr align="left">
		<td height="35" colspan="2" align="right" bgcolor="#EAF0FB"
			class="p16">
		<div align="right"><span class="d6"><strong><a
			href="register.jsp" class="dong02">我要注册</a>&nbsp;</strong></span></div>
		</td>
	</tr>
	<tr>
		<td height="60" colspan="2" valign="bottom">
		<div align="center"><input name="submit" type="submit"
			class="d6" value="登  录" /> &nbsp;&nbsp;&nbsp;&nbsp; <input
			name="reset" type="reset" class="d6" value="重  置" /></div>
		</td>
	</tr>
	<tr>
	</tr>
</table>
</form>
</body>
</html>

