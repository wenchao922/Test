<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<script type="text/javascript">
function openChat(){
	window.open("chat/index.jsp","","left=250   top=200   width=500   height=400");
}
function checked(){
	if(document.form1.userName.value==""){
		alert("请输入用户名！");
		return false;
	}else if(document.form1.password.value=="")
	{
		alert ("请输入密码！");
		return false;
	}
	return true;
}
</script>
	<link href="image/css/right.css" rel="stylesheet" type="text/css" />
	<link href="image/css.css" rel="stylesheet" type="text/css" />
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
	<%@ include file="head.jsp" %>
		<table height="28" cellspacing="3" cellpadding="0" width="776"
			align="center" background="zjej/btmunu.gif" border="0">
			<tbody>
				<tr valign="bottom">
					<td>
						&nbsp;&nbsp;
						<a class="nav" href="index.asp">首页</a><font class="nav">
							&gt; </font><a class="nav" href="qyjz.asp">企业建站</a>
					</td>
				</tr>
			</tbody>
		</table>
		<table height="1" cellspacing="0" cellpadding="0" width="776"
			align="center" bgcolor="#cccccc" border="0">
			<tbody>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>
		<table cellspacing="0" cellpadding="0" width="776" align="center"
			border="0">
			<tbody>
				<tr>
					<td valign="top" width="195" background="zjej/ny3.gif" bgcolor="#ffffff" height="186">
						<%@include file="left.jsp" %>
					</td>
					<td valign="top" width="3" bgcolor="#e8e8e8"></td>
					<td valign="top" bgcolor="#ffffff" height="300">
						<form action="admin/adminLoginManage.jsp" method="post"
							name="form1" onsubmit="return checked()">
							<table width="399" border="0" align="center" cellpadding="0"
								cellspacing="0" bordercolor="#EBEBEB">
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr align="left">
									<td height="35" colspan="2" bgcolor="#EAF0FB" class="p16">
										<div align="center">
											<span class="d6"><strong>管 理 员 登 录 </strong>
											</span>
										</div>
									</td>
								</tr>

								<tr>
									<td width="141" height="45" align="center" bgcolor="#EBEBEB"
										class="d5">
										您的帐号：
									</td>
									<td width="258" align="left" bgcolor="#EBEBEB">
										<input name="userName" type="text" />
									</td>
								</tr>
								<tr>

								</tr>
								<tr>
									<td height="45" align="center" bgcolor="#EBEBEB" class="d5">
										您的密码：
									</td>
									<td align="left" bordercolor="#EBEBEB" bgcolor="#EBEBEB">
										<input name="password" type="password" size="21" />
									</td>
								</tr>
								<tr align="left">
									<td height="35" colspan="2" align="right" bgcolor="#EAF0FB"
										class="p16">
										<div align="right">
											<span class="d6"><strong>&nbsp;</strong>
											</span>
										</div>
									</td>
								</tr>
								<tr>
									<td height="60" colspan="2" valign="bottom">
										<div align="center">
											<input name="submit" type="submit" class="d6" value="登  录" />
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="reset" type="reset" class="d6" value="重  置" />
										</div>
									</td>
								</tr>
								<tr>

								</tr>
							</table>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		<%@include file="bottom.jsp" %>
	</body>
</html>


