<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>   
<title>sendMessage</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	<link href="image/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function checkSend(){		
	if(document.send.msg.value==""){
		alert("内容不能为空哦！");
		return false;
	}else{
		document.send.message.value=document.send.msg.value;
		document.send.msg.value="";
		return true;
	}		 
}
</script>
 </head>
  
 <body>
 <form action="message.jsp" method="post" name="send" onSubmit="return checkSend()" target="message">
 <input type="hidden" name="message" value="" />
 	<p align="center">
  		请输入发送信息：
   		<input type="text" name="msg" size="30" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   		<input type="submit" value="发送" />
  	</p>
</form>
</body>
</html>
