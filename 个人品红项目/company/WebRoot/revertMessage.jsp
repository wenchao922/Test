<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>回复留言</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta name="description" content="留言本">
	<link href="image/1/jd100.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
	function check(){
		if(document.form1.writer.value==""){
			alert("请输入姓名！");
			return false;
		}else if(document.form1.title.value==""){
			alert("请输入标题！");
			return false;
		}else if(document.form1.content.value==""){
			alert("请输入回复内容！");
			return false;
		}
	}
	</script>
</head>
<body background="image/img/1/bookbg.gif" leftmargin='0' topmargin='3' marginwidth='0' marginheight='0'>
	<div align='center'>
		<img src="image/1/welcome.jpg">
	</div>
	<!--   留言信息显示    开始 -->
	<%
		int messageId=Integer.parseInt(request.getParameter("messageId"));
		IMessageDao messagedao=new MessageDao();
		Message m=messagedao.findMessageById(messageId);	
	 %>
	<div align='center'>
    <table width='750' border='0' cellspacing='1' cellpadding='4' align='center'>
		<tr>
			<td height='20' colspan='2' class='unnamed2'>
				<marquee onmouseout="start();" onmouseover="stop();" scrollamount="3">
					<b><font color="#000099">欢迎您使用&nbsp;留言本&nbsp;</font> </b>
				</marquee>
			</td>
		</tr>
		<tr>
			<td height='20' class='unnamed1'>主题: <%=m.getTitle() %></td>
			<td height='20' class='unnamed1' align='right'></td>
		</tr>
	</table>
	
	<table width='750' border="0" align='center' cellpadding="0" cellspacing="0" bordercolor="#111111"
			style='BORDER-COLLAPSE: collapse'>
		<tbody>
			<tr>
				<Td align='left'>
					<table width='100px' height='20' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='11' background='image/1/titlemu_1.gif'></td>
								<td width='*' background='image/1/titlemu_2.gif'>
									<div align='center'>
										<a href='messageBoard.jsp' class="jdmenu"><b>留言</b></a>
									</div>
								</td>
							<td width='12' background='image/1/titlemu_3.gif'></td>
						</tr>
					</table>
				</Td>
			</tr>
			<tr>
				<td width='2%'>
					<img src='image/1/T_left.gif' border="0">
				</td>
				<td width='96%' background='image/1/Tt_bg.gif'></td>
				<td width='2%'>
					<img src='image/1/T_right.gif' border="0">
				</td>
			</tr>
		</tbody>
	</table>
	<table width='750' border="1" align="center" cellpadding="0" cellspacing="0" class='jd_tab' style='border-collapse: collapse'>
		<tr>
			<td height='150' valign='top' class='jd_tab'>
				<table width='100%' height='20' border='0' cellpadding='0' cellspacing='0'
						style='table-layout: fixed; word-break: break-all; word-wrap: break-word;'>
					<tr>
						<td style='word-break: break-all' class="jd_title">
							&nbsp; ※&nbsp;
							<b><%=m.getTitle() %></b>
						</td>
					</tr>
				</table>
				<table width='100%' border='0' cellpadding='3' style='table-layout: fixed; word-break: break-all; word-wrap: break-word;'>
					<tr>
						<td width='' style='word-break: break-all'>
							<div class="unnamed2">
								<%=m.getContent() %>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height='18' valign='bottom' class='jd_tab' style='font-size: 12px;'>
				<font color="#666666"><%=m.getWriter() %>写于&nbsp;<%=m.getWriteDate() %>&nbsp; &nbsp;</font>
			</td>
		</tr>
	</table>
	<table width='750' border="0" align='center' cellpadding="0" cellspacing="0" style='BORDER-COLLAPSE: collapse'>
		<tbody>
			<tr>
				<td>
					<img src='image/1/T_bottomleft.gif' border="0">
				</td>
				<td width='100%' background='image/1/T_bottombg.gif'></td>
				<td>
					<img src='image/1/T_bottomright.gif' border="0">
				</td>
			</tr>
		</tbody>
	</table>

	<table width='750' border='0' cellspacing='1' cellpadding='4' align='center'>
		<tr>
			<td width='' height='20' align='right' class='unnamed1'></td>
		</tr>
	</table>

	<!-- 留言显示  结束 -->
	<!-- 回复   开始 -->


	<table width='750' border="0" align='center' cellpadding="0" cellspacing="0">
		<tr>
			<td height="5" align="left" class='unnamed1'>
				回复内容：
			</td>
		</tr>
		<%
			IRevertDao revertdao=new RevertDao();
			int currentPage=1;
		
			List<Revert> revers=revertdao.findRevertsByPage(messageId,currentPage);
			int count=revers.size();
			int maxPage=count%IRevertDao.PAGE_SIZE==0?count/IRevertDao.PAGE_SIZE:count/IRevertDao.PAGE_SIZE+1;
			maxPage=maxPage<1?1:maxPage;
			for(Revert r:revers){
		 %>
		 <tr><td>
	 <table width='750' border="1" align="center" cellpadding="0" cellspacing="0" class='jd_tab' style='border-collapse: collapse'>
		<tr>
			<td height='150' valign='top' class='jd_tab'>
				<table width='100%' height='20' border='0' cellpadding='0' cellspacing='0'
						style='table-layout: fixed; word-break: break-all; word-wrap: break-word;'>
					<tr>
						<td style='word-break: break-all' class="jd_title">
							&nbsp; ※&nbsp;
							<b></b>
						</td>
					</tr>
				</table>
				<table width='100%' border='0' cellpadding='3' style='table-layout: fixed; word-break: break-all; word-wrap: break-word;'>
					<tr>
						<td width='' style='word-break: break-all'>
							<div class="unnamed2">
								<%=r.getContent()%>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height='18' valign='bottom' class='jd_tab' style='font-size: 12px;'>
				<font color="#666666"><%=r.getWriter() %>回复于&nbsp;<%=r.getWriteDate() %>&nbsp; &nbsp;</font>
			</td>
		</tr>
	</table>
	<%} %>
	</td></tr>
	
	 <tr align="center">
		<td>
			<a href="revertMessage.jsp?messageId=<%=messageId %>&page=<%=currentPage-1<1?1:currentPage-1 %>">上一页</a>
		 	<a href="revertMessage.jsp?messageId=<%=messageId %>&page=<%=currentPage+1>maxPage?maxPage:currentPage+1 %>">下一页</a>
		</td>
	 </tr>	 
	</table>

	<!-- 回复  结束    -->
	<table width='750' border='0' cellspacing='1' cellpadding='4' align='center'>
		<tr>
			<td width='' height='20' align='right' class='unnamed1'></td>
		</tr>
	</table>
	<table width='750' height="0" border="1" align="center" cellpadding="0" cellspacing="0" class='jd_tab'
		style='border-collapse: collapse'>
		<tbody>
			<tr>
				<td height="25" class="jd_titlemu">
					<div align='center'>
						<strong>快 速 回 复 </strong>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" valign='top'>
					<form name='form1' method='post' action='saveRevert.jsp' onsubmit='return check()'>
						<table width='100%' border='0' align='center' cellpadding='1'
							cellspacing='1' class='unnamed1'>
							<input type="hidden" name="messageId" value="<%=messageId %>" />
							<tr>
								<td width='86' align='right'>
									姓名：
								</td>
								<td width='577'>
									<input name='writer' type='text' class='input1' value=''
										size='20' maxlength="10">
									<font color='#FF0000'>*</font>
								</td>
							</tr>
							<tr>
								<td align='right' valign='top'>
									内容：
								</td>
								<td>
									<textarea name='content' cols='80' rows='6' class='input1'></textarea>
									<br>
									&nbsp;&nbsp;
									<input type='submit' name='Submit' value=' 提 交 '>
									&nbsp;
									<br>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>
