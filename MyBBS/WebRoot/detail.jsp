<%@ page language="java"  pageEncoding="GBK"%>
<%@ page import="java.util.*,
				com.st275.common.*,
				com.st275.topic.dao.*,
				com.st275.reply.dao.*,
				com.st275.reply.entity.*,
				com.st275.topic.entity.*"
%>
<%
//�õ�������
int topicId = request.getParameter("topicId") == null? -1:Integer.parseInt(request.getParameter("topicId"));
//���������ʵ����
Topic topic = new Topic();
topic.setTopicId(String.valueOf(topicId));
//�����ظ���ʵ����
Reply reply = new Reply();
reply.setTopicId(String.valueOf(topicId));

TopicDAO topicDAO = new TopicDAO();
ReplyDAO replyDAO = new ReplyDAO();

ArrayList topicList = topicDAO.query(topic);
ArrayList replyList = replyDAO.query(reply, 1);
%>
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>����</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
</HEAD>

<BODY>
<%@ include file="common/top.jsp" %>
<!--      ����        -->
<DIV><br/>
	<!--      ����        -->
<DIV>
	&gt;&gt;<B><a href="index.jsp">��̳��ҳ</a></B>&gt;&gt;
	<B><a href="list.jsp">��ˮ��԰</a></B>
</DIV>
	<br/>
	<!--      �ظ�������        -->
	<DIV>
		<A href="post.jsp"><IMG src="image/reply.gif"  border="0" id="td_post"></A> 
		<A href="post.jsp"><IMG src="image/post.gif"   border="0" id="td_post"></A>
	</DIV>
	<!--         �� ҳ         -->
	<DIV>
		<a href="detail.jsp">��һҳ</a>|
		<a href="detail.jsp">��һҳ</a>
	</DIV>
	<!--      ��ҳ����ı���        -->
	<DIV>
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR>
				<TH class="h">��ҳ����: ��ˮ</TH>
			</TR>
			<TR class="tr2">
				<TD>&nbsp;</TD>
			</TR>
		</TABLE>
	</DIV>
	
	<!--      ����        -->
	<%
	if(topicList.size() == 0){
		out.print("û�в��ҵ�����");
		return;
	}
	Topic tmpTopic = (Topic)topicList.get(0); 
	%>
	<DIV class="t">
		<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr1">
				<TH style="WIDTH: 20%">
					<B><%=tmpTopic.getUName() %></B><BR/>
					<img src="image/head/<%=tmpTopic.getHead() %>"/><BR/>
					ע��:<%=tmpTopic.getRegTime() %><BR/>
				</TH>
				<TH>
					<H4><%=tmpTopic.getTitle() %></H4>
					<DIV><%=tmpTopic.getContent() %></DIV>
					<DIV class="tipad gray">
						����[<%=tmpTopic.getPublishTime() %>] &nbsp;
						����޸�:[<%=tmpTopic.getModifyTime() %>]
					</DIV>
				</TH>
			</TR>
		</TABLE>
	</DIV>
	
	<!--      �ظ�        -->
	<%for(int i = 0; i < replyList.size(); i++) {
			Reply tmpReply = (Reply)replyList.get(i); 
	%>	
	<DIV class="t">
		<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr1">
				<TH style="WIDTH: 20%">
					<B><%=tmpReply.getUName() %></B><BR/><BR/>
					<img src="image/head/<%=tmpReply.getHead() %>"/><BR/>
					ע��:<%=tmpReply.getRegTime() %><BR/>
				</TH>
				<TH>
					<H4><%=tmpReply.getTitle() %></H4>
					<DIV><%=tmpReply.getContent() %></DIV>
					<DIV class="tipad gray">
						����[<%=tmpReply.getPublishTime()%>] &nbsp;
						����޸�:[<%=tmpReply.getModifyTime() %>]
						<A href="javascript:doDelete(<%=tmpReply.getReplyId() %>,<%=tmpReply.getTopicId() %>)">[ɾ��]</A>
						<A href="update.jsp?replyId=<%=tmpReply.getReplyId() %>&topicId=<%=tmpReply.getTopicId() %>">[�޸�]</A>
					</DIV>
				</TH>
			</TR>
		</TABLE>
	</DIV>
	<%} %>
	
</DIV>

<!--      ����        -->
<BR>
<%@ include file="common/bottom.jsp" %>
</BODY>
</HTML>
<script type="text/javascript">
<!--
function doDelete(replyId, topicId){
	if(confirm("��ȷ��Ҫɾ�������ظ���Ϣ?")) {
		location.href = "manage/dodeletereply.jsp?replyId="+replyId+"&topicId="+topicId;
	}
}
//-->
</script>
