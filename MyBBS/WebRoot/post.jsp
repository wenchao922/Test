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
%>
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>��������</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
function check(){
	if(document.postForm.title.value=="") {
		alert("���ⲻ��Ϊ��");
		return false;
	}
	if(document.postForm.content.value=="") {
		alert("���ݲ���Ϊ��");
		return false;
	}
	if(document.postForm.content.value.length>1000) {
		alert("���Ȳ��ܴ���1000");
		return false;
	}
}
</script>
</HEAD>

<BODY>
<%@ include file="common/top.jsp" %>


<!--      ����        -->
<DIV><BR/>
	<!--      ����        -->
	<DIV>
		&gt;&gt;<B><a href="index.jsp">��̳��ҳ</a></B>&gt;&gt;
		<B><a href="list.jsp">C#����</a></B>
	</DIV><BR/>
	<DIV>
		<FORM name="postForm" onsubmit="return check()" action="manage/dopost.jsp" method="POST"> 
			<INPUT type="hidden" name="boardId" value="<%=boardId %>"/>
			<INPUT type="hidden" name="topicId" value=""/>
			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" align="center">
				    <TR>
					    <TD class="h" colSpan="3"><B>��������</B></TD>
				    </TR>
	
				    <TR class="tr3">
					    <TH width="20%"><B>����</B></TH>
					    <TH><INPUT class="input" style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60" name="title"></TH>
				    </TR>
	
				    <TR class="tr3">
					    <TH vAlign="top">
					      <DIV><B>����</B></DIV>
					    </TH>
					    <TH colSpan="2">
					        <DIV>	
						        <span><textarea style="WIDTH: 500px;" name="content" rows="20" cols="90" tabIndex="2" ></textarea></span>
						    </DIV>
					      (���ܴ���:<FONT color="blue">1000</FONT>��)
					    </TH>
					</TR>
				</TABLE>
			</DIV>		
	
			<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<INPUT class="btn" tabIndex="3" type="submit" value="�� ��"> 
				<INPUT class="btn" tabIndex="4" type="reset"  value="�� ��">
			</DIV>
		</FORM>	
	</DIV>
</DIV>
<!--      ����        -->
<BR/>
<%@ include file="common/bottom.jsp" %>

</BODY>
</HTML>
