<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script >
function check()
	{
		var title = document.fm.title;
		var content = document.fm.content;
		var name = document.fm.name;
		//判断是否输入为空
		if(title.value =="")
		{
			alert("请输入新闻标题");
			title.select();
			return false;
		}
		
		if(content.value=="")
		{
			alert("请输入新闻内容");
			content.select();
			return false;
		}
		if(name.value=="")
		{
			alert("请输入新闻内容");
			name.select();
			return false;
		}
		
		return true;
	}
</script>

<style>
	.table{
	border-color="#98CAD8";
	border-style="solid";
	border-width="1px"
	}
</style>
  </head>
  
  
  <body background="image/bookbg.gif">
   <center>
 
   	<table>
   		<tr>
   			<td><img src="image/welcome.jpg"></td>
   		</tr>
   		<tr>
   			<td><marquee>欢迎使用&nbsp;留言本</marquee></td>
   		</tr> 
   		<tr>
   			<td><img src="image/post.gif"></td>
   		</tr>
   		<tr>
   			<td>
   			  <form action="addNewWord.jsp" name="fm" method="post" onsubmit="return check();">
   					<table class="table" border="0" cellpadding="0" cellspacing="0" width="750">
   					<tr height="35">
   						<td colspan="2" align="center" background="image/title.gif"><b style="font-size:14px;">新留言</b></td>
   					</tr>
   					<tr>
   						<td align="center">姓名：</td>
   						<td><input type="text" name="name"></td>
   					</tr>
   					<tr>
   						<td align="center">标题：</td>
   						<td><input type="text" name="title"></td>
   					</tr>
   					<tr>
   						<td align="center">内容：</td>
   						<td><textarea name="content" rows="4" cols="40"></textarea></td>
   					</tr>
   					<tr>
   						<td></td><td><input type="submit" value="提交"></td>
   					</tr>
   				</table>	</form>	
   			</td>
   		</tr>
   		</table>
   	
   </center>
  </body>
</html>