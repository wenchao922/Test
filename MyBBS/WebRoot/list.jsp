<%@ page language="java"  pageEncoding="GBK"%>
<%@ page import="java.util.*,
				com.st275.common.*,
				com.st275.topic.dao.*,
				com.st275.board.entity.*,
				com.st275.topic.entity.*"
%>
<%
//得到版块编号
String strBoardId = request.getParameter("boardId");
//如果版块编号获取为空,置为-1,表示没有得到版块编号
if(strBoardId == null) {
	strBoardId = "-1";
}
int boardId = Integer.parseInt(strBoardId);

//得到当前的页码
int currentPage = request.getParameter("currentPage")==null?1:Integer.parseInt(request.getParameter("currentPage"));
//如果当前页面小于最小页, 置为1
if(currentPage < 1) {
	currentPage = 1;
}

TopicDAO dao = new TopicDAO();

//得到总页数
int pageCount = dao.getPageCountByBoardId(boardId);
if(currentPage > pageCount) {
	currentPage = pageCount;
}
%>
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>帖子列表</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
</HEAD>

<BODY onload="initPageControl()">
<%@ include file="common/top.jsp" %>

<form action="#" method="post" name="myForm">
<input type="hidden" name="currentPage" value="<%=currentPage %>">
<input type="hidden" name="boardId" value="<%=strBoardId %>">

<!--      主体        -->
<DIV>
<!--      导航        -->
<br/>
<DIV>
	&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
	<B><a href="list.jsp">灌水乐园</a></B>
</DIV>
<br/>
<!--      新帖        -->
	<DIV>
		<A href="post.jsp?boardId=<%=boardId %>"><IMG src="image/post.gif" name="td_post" border="0" id="td_post"></A>
	</DIV>
<!--         翻 页         -->
	<DIV>
	<%if(currentPage != 1){ %>
		<a id="back" href="javascript:jumpTo(-1)">上一页</a>
	<%} else {%>
		首页
	<%} %>
		|
	<%if(currentPage < pageCount){ %>
		<a id="forward" href="javascript:jumpTo(1)">下一页</a>
	<%} else {%>
		尾页
	<%} %>	
	</DIV>

	<DIV class="t">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">		
			<TR>
				<TH class="h" style="WIDTH: 100%" colSpan="4"><SPAN>&nbsp;</SPAN></TH>
			</TR>
<!--       表 头           -->
			<TR class="tr2">
				<TD>&nbsp;</TD>
				<TD style="WIDTH: 80%" align="center">文章</TD>
				<TD style="WIDTH: 10%" align="center">作者</TD>
				<TD style="WIDTH: 10%" align="center">回复</TD>
			</TR>
<!--         主 题 列 表        -->
		<%
		ArrayList topicList = dao.getTopicListByBoardId(boardId, currentPage);
		for(int i = 0; i < topicList.size(); i++) {
			Topic topic = (Topic)topicList.get(i);
			int replyCount = dao.getReplyAmtByTopicId(Integer.parseInt(topic.getTopicId()));
		 %>			
			<TR class="tr3">
				<TD><IMG src="image/topic.gif" border="0"></TD>
				<TD style="FONT-SIZE: 15px">
					<A href="detail.jsp?topicId=<%=topic.getTopicId() %>"><%=topic.getTitle() %></A>
				</TD>
				<TD align="center"><%=topic.getUName() %></TD>
				<TD align="center"><%=replyCount %></TD>
			</TR>
		<%} %>			

			
		</TABLE>
	</DIV>
<!--            翻 页          -->
	<DIV>
	<%if(currentPage != 1){ %>
		<a id="back" href="javascript:jumpTo(-1)">上一页</a>
	<%} else {%>
		首页
	<%} %>
		|
	<%if(currentPage < pageCount){ %>
		<a id="forward" href="javascript:jumpTo(1)">下一页</a>
	<%} else {%>
		尾页
	<%} %>	
	</DIV>
</DIV>
<!--             声 明          -->
<BR/>
<%@ include file="common/bottom.jsp" %>
</form>
</BODY>
</HTML>
<script type="text/javascript">
function initPageControl(){
	if(parseInt(document.myForm.currentPage.value) == 1) {
		document.getElementById("back").disabled = true;
	}
}

function jumpTo(forwardPage) {
	var curPage = parseInt(document.myForm.currentPage.value);
	document.myForm.currentPage.value = curPage + forwardPage;
	document.myForm.submit();
}
</script>
