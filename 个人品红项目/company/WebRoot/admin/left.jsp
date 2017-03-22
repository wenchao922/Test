<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>控制面板</title>
<style type="text/css">
.menutitle {
	cursor: pointer;
	margin-bottom: 0px; background-image =url('images/menu_1.gif');
	color: #FFFFFF;
	width: 158px;
	text-align: center;
	font-weight: bold;
	background-color: #698CC3;
	padding-left: 0px;
	padding-right: 0px;
	padding-top: 2px;
	padding-bottom: 2px
}

}
.submenu {
	margin-bottom: 0em;
}

.cn {
	FONT-SIZE: 9pt;
	COLOR: #006599;
	FONT-FAMILY: 宋体
}
</style>

<script language="javascript" type="text/javascript">
if (document.getElementById){ 
document.write('<style type="text/css">\n')
document.write('.submenu{display: none;}\n')
document.write('</style>\n')
}

function SwitchMenu(obj){
	if(document.getElementById){
	var el = document.getElementById(obj);
	var ar = document.getElementById("masterdiv").getElementsByTagName("span"); 
		if(el.style.display != "block"){ 
			for (var i=0; i<ar.length; i++){
				if (ar[i].className=="submenu") 
				ar[i].style.display = "none";
			}
			el.style.display = "block";
		}else{
			el.style.display = "none";
		}
	}
}

function killErrors() {
return true;
}

window.onerror = killErrors;
</script>
		<link href="../image/css/style_admin.css" rel="stylesheet" type="text/css">
		<base target="main">
	</head>

	<body topmargin="0" leftmargin="2" rightmargin="2" bottommargin="2"
		style="background-color: #698CC3">
		<div id="masterdiv">
			<table border="0" width="158" id="table1" cellpadding="4"
				style="border-collapse: collapse">
				<tr>
					<td>
						<font color="#FFFFFF"><b>系统后台管理面板</b>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<p align="center">
							<font color="#FFFFFF">[<a target="_parent"
								href="adminOut.jsp"><font color="#FFFFFF">安全退出</font>
							</a>] [<a target="_parent" href="../index.jsp"><font color="#FFFFFF">返回首页</font>
							</a>]</font>
						</p>
					</td>
				</tr>
			</table>
			<div class="menutitle" onclick="SwitchMenu('sub1')">
				.系统管理
				<table width="158" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td height="3"></td>
					</tr>
					<tr>
						<td bgcolor="#ffffff" height="1"></td>
					</tr>
				</table>
			</div>
			<span class="submenu" id="sub1">
				<table cellspacing="1" cellpadding="4" width="158" class="tableborder">
					<tr class="altbg1">
						<td height="25" width="100%" align="center" bgcolor="#D6E0EF">
							&nbsp;&nbsp;
							<img border="0" src="../image/icon_arrow_r.gif" width="13"
								height="13">
							<a class="menu" target="main" href="addManager.jsp">添加管理员</a>
						</td>
					</tr>
					<tr class="altbg1">
						<td height="25" width="100%" align="center"  bgcolor="#D6E0EF">
							&nbsp;&nbsp;
							<img border="0" src="../image/icon_arrow_r.gif" width="13"
								height="13">
							<a class="menu" target="main" href="showUserList.jsp">用户管理&nbsp;&nbsp;</a>
						</td>
					</tr>
				</table> </span>

			<div class="menutitle" onclick="SwitchMenu('sub8')">
				.新闻管理
				<table width="158" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td height="3"></td>
					</tr>
					<tr>
						<td bgcolor="#ffffff" height="1"></td>
					</tr>
				</table>
			</div>
			<span class="submenu" id="sub8">
				<table cellspacing="0" cellpadding="0" width="158" background="images/menu_2.gif" border="0">
					<tr>
						<td height="25" width="100%" align="center" bgcolor="#D6E0EF">
							<img border="0" src="../image/icon_arrow_r.gif" width="13"
								height="13">
							<a class="menu" target="main" href="addNews.jsp">添加新闻</a>
						</td>
					</tr>
					<tr>
						<td height="25" width="100%" align="center" bgcolor="#D6E0EF">
							<img border="0" src="../image/icon_arrow_r.gif" width="13"
								height="13">
							<a class="menu" target="main" href="manageNews.jsp">管理新闻</a>
						</td>
					</tr>
				</table> </span>

			<div class="menutitle" onclick="SwitchMenu('sub3')">
				.商品管理
				<table width="158" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td height="3"></td>
					</tr>
					<tr>
						<td bgcolor="#ffffff" height="1"></td>
					</tr>
				</table>
			</div>
			<span class="submenu" id="sub3">
				<table cellspacing="0" cellpadding="0" width="158" background="images/menu_2.gif" border="0">
					<tr>
						<td height="25" width="100%" align="center" bgcolor="#D6E0EF">
							<img border="0" src="../image/icon_arrow_r.gif" width="13"
								height="13">
							<a class="menu" target="main" href="addProduct.jsp">添加商品</a>
						</td>
					</tr>
					<tr>
						<td height="25" width="100%" align="center" bgcolor="#D6E0EF">
							<img border="0" src="../image/icon_arrow_r.gif" width="13"
								height="13">
							<a class="menu" target="main" href="manageProduct.jsp">管理商品</a>
						</td>
					</tr>
				</table> </span>
		</div>
	</body>
</html>

