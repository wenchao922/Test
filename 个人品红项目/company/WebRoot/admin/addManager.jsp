<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>管理员-添加</title>
	<link href="../image/css/style_admin.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
	function check(){
		if(document.form1.userName.value==""){
			alert("请输入管理员名称");
			return false;
		}else if(document.form1.password.value==""){
			alert("请输入密码");
			return false;
		}else if(document.form1.confirmpassword.value!=document.form1.password.value){
			alert("两次密码不一致");
			return false;
		}
		return true;
	}
	</script>
</head>

<body>
	<form name="form1" action="doAddManager.jsp" method="post" onsubmit="return check()">
		<table cellspacing="1" cellpadding="4" width="100%" class="tableborder" id="table3">
			<tr>
				<td colspan="12" class="header">管理员-添加</td>
			</tr>
			<tr>
				<td class="altbg1">管理员名称：</td>
				<td class="altbg2" colspan="11">
					<input type="text" name="userName" size="34"></td>
			</tr>
			<tr>
				<td class="altbg1">密&nbsp; &nbsp;&nbsp;&nbsp;码：</td>
				<td class="altbg2" colspan="11">
					<input type="password" name="password" size="34"></td>
			</tr>
			<tr>
				<td class="altbg1">确认密码:</td>
				<td class="altbg2" colspan="11">
					<input name="confirmpassword" size="34" type="password"></td>
			</tr>
			<tr>
				<td class="altbg1"></td>
				<td class="altbg2" colspan="11">
					<input type="submit" value="提交" name="B1" onClick="return fun_check_form();">
						&nbsp;
					<input type="reset" value="重置" name="B2">
				</td>
			</tr>
			</table>
		</form>
	</body>
</html>