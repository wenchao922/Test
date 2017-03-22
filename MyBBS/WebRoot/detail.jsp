<%@ page language="java"  pageEncoding="GBK"%>
<%@ page import="java.util.*,
				com.st275.common.*,
				com.st275.topic.dao.*,
				com.st275.reply.dao.*,
				com.st275.reply.entity.*,
				com.st275.topic.entity.*"
%>
<%
//得到主题编号
int topicId = request.getParameter("topicId") == null? -1:Integer.parseInt(request.getParameter("topicId"));
//创建主题的实体类
Topic topic = new Topic();
topic.setTopicId(String.valueOf(topicId));
//创建回复的实体类
Reply reply = new Reply();
reply.setTopicId(String.valueOf(topicId));

TopicDAO topicDAO = new TopicDAO();
ReplyDAO replyDAO = new ReplyDAO();

ArrayList topicList = topicDAO.query(topic);
ArrayList replyList = replyDAO.query(reply, 1);
%>
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>看贴</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
</HEAD>

<BODY>
<%@ include file="common/top.jsp" %>
<!--      主体        -->
<DIV><br/>
	<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
	<B><a href="list.jsp">灌水乐园</a></B>
</DIV>
	<br/>
	<!--      回复、新帖        -->
	<DIV>
		<A href="post.jsp"><IMG src="image/reply.gif"  border="0" id="td_post"></A> 
		<A href="post.jsp"><IMG src="image/post.gif"   border="0" id="td_post"></A>
	</DIV>
	<!--         翻 页         -->
	<DIV>
		<a href="detail.jsp">上一页</a>|
		<a href="detail.jsp">下一页</a>
	</DIV>
	<!--      本页主题的标题        -->
	<DIV>
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR>
				<TH class="h">本页主题: 灌水</TH>
			</TR>
			<TR class="tr2">
				<TD>&nbsp;</TD>
			</TR>
		</TABLE>
	</DIV>
	
	<!--      主题        -->
	<%
	if(topicList.size() == 0){
		out.print("没有查找到主题");
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
					注册:<%=tmpTopic.getRegTime() %><BR/>
				</TH>
				<TH>
					<H4><%=tmpTopic.getTitle() %></H4>
					<DIV><%=tmpTopic.getContent() %></DIV>
					<DIV class="tipad gray">
						发表：[<%=tmpTopic.getPublishTime() %>] &nbsp;
						最后修改:[<%=tmpTopic.getModifyTime() %>]
					</DIV>
				</TH>
			</TR>
		</TABLE>
	</DIV>
	
	<!--      回复        -->
	<%for(int i = 0; i < replyList.size(); i++) {
			Reply tmpReply = (Reply)replyList.get(i); 
	%>	
	<DIV class="t">
		<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr1">
				<TH style="WIDTH: 20%">
					<B><%=tmpReply.getUName() %></B><BR/><BR/>
					<img src="image/head/<%=tmpReply.getHead() %>"/><BR/>
					注册:<%=tmpReply.getRegTime() %><BR/>
				</TH>
				<TH>
					<H4><%=tmpReply.getTitle() %></H4>
					<DIV><%=tmpReply.getContent() %></DIV>
					<DIV class="tipad gray">
						发表：[<%=tmpReply.getPublishTime()%>] &nbsp;
						最后修改:[<%=tmpReply.getModifyTime() %>]
						<A href="javascript:doDelete(<%=tmpReply.getReplyId() %>,<%=tmpReply.getTopicId() %>)">[删除]</A>
						<A href="update.jsp?replyId=<%=tmpReply.getReplyId() %>&topicId=<%=tmpReply.getTopicId() %>">[修改]</A>
					</DIV>
				</TH>
			</TR>
		</TABLE>
	</DIV>
	<%} %>
	
</DIV>

<!--      声明        -->
<BR>
<%@ include file="common/bottom.jsp" %>
</BODY>
</HTML>
<script type="text/javascript">
<!--
function doDelete(replyId, topicId){
	if(confirm("你确定要删除这条回复信息?")) {
		location.href = "manage/dodeletereply.jsp?replyId="+replyId+"&topicId="+topicId;
	}
}
//-->
</script>
