<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<html>
<link href="image/css.css" rel="stylesheet" type="text/css">
<link href="image/css/right.css" rel="stylesheet" type="text/css">
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
</script>
	
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
	<%@ include file="head.jsp" %>
		<table height="28" cellspacing="3" cellpadding="0" width="776"
			align="center" background="zjej/btmunu.gif" border="0">
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
		<table cellspacing="0" cellpadding="0" width="776" align="center"
			border="0">
			<tbody>
				<tr>
					<td valign="top" width="195" background="zzjz/ny3.gif"
						bgcolor="#ffffff" height="186">
						<%@include file="left.jsp" %>
					</td>
					<td valign="top" width="3" bgcolor="#e8e8e8"></td>
					<td valign="top" bgcolor="#ffffff" height="300">
						<table cellspacing="0" cellpadding="4" width="100%" align="center"
							border="0">
							<tbody>
								<th colspan="3" align="left">
									&nbsp;&nbsp;&nbsp;新闻列表
								</th>
								<%
									int currentPage=1;
									try{
										currentPage=Integer.parseInt(request.getParameter("page"));
									}catch(Exception e){
										currentPage=1;
									}
									
									INewsDao newsdao=new NewsDao();
									List<News> news=newsdao.findNewsByPage(currentPage);
									int totalPage=newsdao.totalNews();
									int maxPage=totalPage%INewsDao.PAGE_SIZE==0?totalPage/INewsDao.PAGE_SIZE:totalPage/INewsDao.PAGE_SIZE+1;
									maxPage=maxPage==0?1:maxPage;
									int i=1;
									for(News n:news){
								 %>
								<tr valign="top" align="left" bgcolor="#ffffff">
									<td height="30" width="5%">&nbsp;</td>
									<td height="30" width="10%">
										<%= i%>
									</td>
									<td width="85%">
										<a href="detailNews.jsp?newsID=<%=n.getNewsId() %>"><%=n.getTitle() %>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="red">[<%=n.getWriterDate() %>]</font>
										</a>
									</td>
								</tr>
								<%i++;} %>
								<tr valign="bottom" align="right">
									<td colspan="3" width="100%">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="showNewsList.jsp?page=<%=currentPage-1<1?1:currentPage-1 %>">上一页</a>|
										<a href="showNewsList.jsp?page=<%=currentPage+1>maxPage?maxPage:currentPage+1 %>">下一页</a>
									</td>
								</tr>

							</tbody>

						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<%@include file="bottom.jsp" %>
	</body>
</html>