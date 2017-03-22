<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<html>
	<script type="text/javascript">
function openChat(){
	window.open("chat/index.jsp","","left=250   top=200   width=500   height=400");
}
</script>
	<link href="image/css/right.css" rel="stylesheet" type="text/css" />
	<link href="image/css.css" rel="stylesheet" type="text/css" />
	<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
	<%@include file="head.jsp"  %>
		<table height="28" cellspacing="3" cellpadding="0" width="776" align="center" background="zjej/btmunu.gif" border="0">
			<tbody>
				<tr valign="bottom">
					<td>
						&nbsp;&nbsp;
						<a class="nav" href="index.jsp">首页</a><font class="nav">
							&gt; </font><a class="nav" href="showNewsList.jsp">站内新闻</a>
					</td>
				</tr>
			</tbody>
		</table>
		<table height="1" cellspacing="0" cellpadding="0" width="776" align="center" bgcolor="#cccccc" border="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<!--    右侧显示区域   开始 -->
		<%
			int newsId=Integer.parseInt(request.getParameter("newsID"));
			INewsDao newsdao=new NewsDao();
			News n=newsdao.findNewsById(newsId);
		 %>
		<table width="799" border="0" align="center" cellpadding="0"
			cellspacing="0" class="n">
			<tr>
				<td align="center" valign="top" background="image/cg5.jpg" bgcolor="#f4f4f4">
					<%@include file="left.jsp" %>
				</td>
				<td width="608" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr align="center" height="50">
										<td valign="middle" colspan="2" background="image/cg2.jpg">
											<span class="g03" style="font-weight: bold"> <%=n.getTitle() %></span>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="370" align="right" valign="top">
								<table width="100%" border="0" cellspacing="32" cellpadding="0">
									<tr>
										<td align="left" valign="top">
											<p class="d061">
												<%=n.getContent() %>
											</p>
											<p class="d061">
												&nbsp;&nbsp;&nbsp;&nbsp;
												<br />
												&nbsp;&nbsp;&nbsp;&nbsp;
											</p>
										</td>
									</tr>
								</table>
								<p>
									<img src="image/n10.jpg" width="165" height="72" />
								</p>
								<p>
									<%=n.getWriterDate() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</p>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
		<%@include file="bottom.jsp" %>
	</body>
</html>


