<%@ page language="java"  pageEncoding="GBK"%>
<%@ page import="java.util.*,
				com.st275.common.*,
				com.st275.index.*,
				com.st275.board.entity.*,
				com.st275.topic.entity.*"
%>
<%
String path = request.getContextPath(); 
IndexDAO dao = new IndexDAO();
%>
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>首页</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="<%=path %>/style/style.css" />

</HEAD>

<BODY>

<%@ include file="common/top.jsp" %>

<!--      主体        -->
<DIV class="t">
	<TABLE cellSpacing="0" cellPadding="0" width="100%">
		<TR class="tr2" align="center">
			<TD colSpan="2">论坛</TD>
			<TD style="WIDTH: 10%;">主题</TD>
			<TD style="WIDTH: 30%">最后发表</TD>
		</TR>
	<!--       主版块       -->
		<%
		ArrayList boardList = dao.getBoardListByParentId(0);
		for(int i = 0; i < boardList.size(); i++) {
			Board board = (Board)boardList.get(i);
		 %>
		<TR class="tr3">
			<TD colspan="4"><%=board.getBoardName() %></TD>
		</TR>
		
	<!--       子版块     	  -->
		<%
			ArrayList subBoardList = dao.getBoardListByParentId(Integer.parseInt(board.getBoardId()));
			for(int j = 0; j < subBoardList.size(); j++) {
				Board subBoard = (Board)subBoardList.get(j);
				int topicCount = dao.getTopicAmtByBoardId(Integer.parseInt(subBoard.getBoardId()));
				Topic latestTopic = dao.getLastedTopicByBoardId(Integer.parseInt(subBoard.getBoardId()));
		 %>
		<TR class="tr3">
			<TD width="5%">&nbsp;</TD>
			<TH align="left">
				<IMG src="<%=path %>/image/board.gif">
				<A href="<%=path %>/list.jsp?boardId=<%=subBoard.getBoardId() %>"><%=subBoard.getBoardName() %></A>
			</TH>
			<TD align="center"><%=topicCount %></TD>
			<TH>
				<SPAN>
					<A href="detail.jsp"><%=latestTopic.getTitle() %> </A>
				</SPAN>
				<BR/>
				<SPAN><%=latestTopic.getUName() %></SPAN>
				<SPAN class="gray">[ <%=latestTopic.getPublishTime() %> ]</SPAN>
			</TH>
		</TR>
		<%
			}
		} 
		%>
	</TABLE>
</DIV>

<BR/>
<%@ include file="common/bottom.jsp" %>
</BODY>
</HTML>