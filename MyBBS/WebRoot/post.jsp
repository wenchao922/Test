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
%>
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>发布帖子</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
function check(){
	if(document.postForm.title.value=="") {
		alert("标题不能为空");
		return false;
	}
	if(document.postForm.content.value=="") {
		alert("内容不能为空");
		return false;
	}
	if(document.postForm.content.value.length>1000) {
		alert("长度不能大于1000");
		return false;
	}
}
</script>
</HEAD>

<BODY>
<%@ include file="common/top.jsp" %>


<!--      主体        -->
<DIV><BR/>
	<!--      导航        -->
	<DIV>
		&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
		<B><a href="list.jsp">C#语言</a></B>
	</DIV><BR/>
	<DIV>
		<FORM name="postForm" onsubmit="return check()" action="manage/dopost.jsp" method="POST"> 
			<INPUT type="hidden" name="boardId" value="<%=boardId %>"/>
			<INPUT type="hidden" name="topicId" value=""/>
			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" align="center">
				    <TR>
					    <TD class="h" colSpan="3"><B>发表帖子</B></TD>
				    </TR>
	
				    <TR class="tr3">
					    <TH width="20%"><B>标题</B></TH>
					    <TH><INPUT class="input" style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60" name="title"></TH>
				    </TR>
	
				    <TR class="tr3">
					    <TH vAlign="top">
					      <DIV><B>内容</B></DIV>
					    </TH>
					    <TH colSpan="2">
					        <DIV>	
						        <span><textarea style="WIDTH: 500px;" name="content" rows="20" cols="90" tabIndex="2" ></textarea></span>
						    </DIV>
					      (不能大于:<FONT color="blue">1000</FONT>字)
					    </TH>
					</TR>
				</TABLE>
			</DIV>		
	
			<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<INPUT class="btn" tabIndex="3" type="submit" value="提 交"> 
				<INPUT class="btn" tabIndex="4" type="reset"  value="重 置">
			</DIV>
		</FORM>	
	</DIV>
</DIV>
<!--      声明        -->
<BR/>
<%@ include file="common/bottom.jsp" %>

</BODY>
</HTML>
