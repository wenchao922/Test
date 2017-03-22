<%@ page language="java"  pageEncoding="GBK"%>
<%@ page import="java.util.*,
				com.st275.common.*,
				com.st275.topic.dao.*,
				com.st275.board.entity.*,
				com.st275.topic.entity.*"
%>
<%
//�õ������
String strBoardId = request.getParameter("boardId");
//�������Ż�ȡΪ��,��Ϊ-1,��ʾû�еõ������
if(strBoardId == null) {
	strBoardId = "-1";
}
int boardId = Integer.parseInt(strBoardId);

//�õ���ǰ��ҳ��
int currentPage = request.getParameter("currentPage")==null?1:Integer.parseInt(request.getParameter("currentPage"));
//�����ǰҳ��С����Сҳ, ��Ϊ1
if(currentPage < 1) {
	currentPage = 1;
}

TopicDAO dao = new TopicDAO();

//�õ���ҳ��
int pageCount = dao.getPageCountByBoardId(boardId);
if(currentPage > pageCount) {
	currentPage = pageCount;
}
%>
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>�����б�</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
</HEAD>

<BODY onload="initPageControl()">
<%@ include file="common/top.jsp" %>

<form action="#" method="post" name="myForm">
<input type="hidden" name="currentPage" value="<%=currentPage %>">
<input type="hidden" name="boardId" value="<%=strBoardId %>">

<!--      ����        -->
<DIV>
<!--      ����        -->
<br/>
<DIV>
	&gt;&gt;<B><a href="index.jsp">��̳��ҳ</a></B>&gt;&gt;
	<B><a href="list.jsp">��ˮ��԰</a></B>
</DIV>
<br/>
<!--      ����        -->
	<DIV>
		<A href="post.jsp?boardId=<%=boardId %>"><IMG src="image/post.gif" name="td_post" border="0" id="td_post"></A>
	</DIV>
<!--         �� ҳ         -->
	<DIV>
	<%if(currentPage != 1){ %>
		<a id="back" href="javascript:jumpTo(-1)">��һҳ</a>
	<%} else {%>
		��ҳ
	<%} %>
		|
	<%if(currentPage < pageCount){ %>
		<a id="forward" href="javascript:jumpTo(1)">��һҳ</a>
	<%} else {%>
		βҳ
	<%} %>	
	</DIV>

	<DIV class="t">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">		
			<TR>
				<TH class="h" style="WIDTH: 100%" colSpan="4"><SPAN>&nbsp;</SPAN></TH>
			</TR>
<!--       �� ͷ           -->
			<TR class="tr2">
				<TD>&nbsp;</TD>
				<TD style="WIDTH: 80%" align="center">����</TD>
				<TD style="WIDTH: 10%" align="center">����</TD>
				<TD style="WIDTH: 10%" align="center">�ظ�</TD>
			</TR>
<!--         �� �� �� ��        -->
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
<!--            �� ҳ          -->
	<DIV>
	<%if(currentPage != 1){ %>
		<a id="back" href="javascript:jumpTo(-1)">��һҳ</a>
	<%} else {%>
		��ҳ
	<%} %>
		|
	<%if(currentPage < pageCount){ %>
		<a id="forward" href="javascript:jumpTo(1)">��һҳ</a>
	<%} else {%>
		βҳ
	<%} %>	
	</DIV>
</DIV>
<!--             �� ��          -->
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
