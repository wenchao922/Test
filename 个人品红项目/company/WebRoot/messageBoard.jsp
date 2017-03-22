<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>留言本</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<meta name="description" content="留言本">
		<link href="image/1/jd100.css" rel="stylesheet" type="text/css">
	</head>
	<body background="image/img/1/bookbg.gif" leftmargin='0' topmargin='3'
		marginwidth='0' marginheight='0'>
		<div align='center'>
			<img src="image/1/welcome.jpg">
		</div>
		<div align='center'>
			<table width='750' border='0' cellspacing='1' cellpadding='4'
				align='center'>
				<tr>
					<td height='20' colspan='2' align='right' class='unnamed2'>
						<marquee onmouseout="start();" onmouseover="stop();"
							scrollamount="3">
							<b><font color="#000099">欢迎您使用&nbsp;留言本&nbsp;</font> </b>
						</marquee>
					</td>
				</tr>
			</table>	
			<form name='form' method='post' action='index.asp'
				onsubmit='submitonce(this)'>
				<table width='750' border="0" align='center' cellpadding="0"
					cellspacing="0" bordercolor="#111111"
					style='BORDER-COLLAPSE: collapse'>
					<tbody>
						<tr>
							<td>
								<table width='100px' height='20' border='0' cellpadding='0' cellspacing='0'>
									<tr>
										<td width='11' background='image/1/titlemu_1.gif'></td>
										<td width='*' background='image/1/titlemu_2.gif'>
											<div align='center'>
												<a href='newMessage.jsp' class="jdmenu"><b>新留言</b>
												</a>
											</div>
										</td>
										<td width='12' background='image/1/titlemu_3.gif'></td>
									</tr>
								</table>
							</td>
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
				<table width='750' height="51" border="1" align="center"
					cellpadding="3" cellspacing="0" class='jd_tab'
					style='border-collapse: collapse; word-wrap: break-word;'>
					<tbody>
						<tr class="jd_titlemu">
							<td width='5%' class='jd_tab'>
								<div align='center'>
									回复
								</div>
							</td>
							<td width='50%' class='jd_tab'>
								<div align='center'>
									标题
								</div>
							</td>
							<td width='20%' class='jd_tab'>
								<div align='center'>
									作者
								</div>
							</td>
							<td width='25%' class='jd_tab'>
								<div align='center'>
									时间
								</div>
							</td>
						</tr>
						<%
							int currentPage=1;
							try{
								currentPage=Integer.parseInt(request.getParameter("page"));
							}catch(Exception e){
								currentPage=1;
							}
							IMessageDao messagedao=new MessageDao();
							int total=messagedao.totalMessages();
							int maxPage=total%IMessageDao.PAGE_SIZE==0?total/IMessageDao.PAGE_SIZE:total/IMessageDao.PAGE_SIZE+1;
							maxPage=maxPage<1?1:maxPage;
							List<Message> messages=messagedao.getmessageByPage(currentPage);
						 	for(Message m:messages){
						 %>
						<tr class="unnamed1">
							<td width='6%' height='25' align="center" valign='top'
								class='jd_tab'>
								<%=m.getCount() %>
							</td>
							<td width='53%' height='25' align="left" valign='top'
								class='jd_tab'>
								<a href='revertMessage.jsp?messageId=<%=m.getMessageId() %>'> <img
										src='image/1/jd-to.gif' border='0'>&nbsp;<%=m.getTitle() %> </a>
							</td>
							<td width='20%' height='25' align="left" valign='top'
								class='jd_tab'>
								<font color="#666666"><%=m.getWriter() %> </font>
							</td>
							<td width='14%' height='25' align="left" valign='top'
								class='jd_tab'>
								<font color="#666666"><%=m.getWriteDate() %></font>
							</td>
						</tr>
						<%
							}
							
							if(total>IMessageDao.PAGE_SIZE){
						%>
						<tr>
							<td>
								<a href="messageBoard.jsp?page=<%=currentPage-1<1?1:currentPage-1 %>">上一页</a>
								<a href="messageBoard.jsp?page=<%=currentPage+1>maxPage?maxPage:currentPage+1 %>">下一页</a>
							</td>	
						</tr>
						<%		
							}
						 %>
					</tbody>
				</table>
				<table width='750' border="0" align='center' cellpadding="0"
					cellspacing="0" style='BORDER-COLLAPSE: collapse'>
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
				<table width='10' border="0" align='center' cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="5"></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>

