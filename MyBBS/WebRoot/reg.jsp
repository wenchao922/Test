<%@ page language="java" import="java.util.*,com.st275.common.*" pageEncoding="GBK"%>
<HTML>
<HEAD>
<TITLE><%=Constant.BBS_TITLE %>ע��</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css"/>
<script language="javascript">
function check() {
 if(document.regForm.uName.value==""){
    alert("�û�������Ϊ��");
    return false;
 }
 if(document.regForm.uPass.value==""){
    alert("���벻��Ϊ��");
    return false;
 }
 if(document.regForm.uPass.value != document.regForm.uPass1.value){
    alert("2�����벻һ��");
    return false;
 }
}
</script>
</HEAD>
<BODY>
<%@ include file="common/top.jsp" %>


<BR/>
<!--      ����        -->
<DIV>
	&gt;&gt;<B><a href="index.jsp">��̳��ҳ</a></B>
</DIV>
<!--      �û�ע���        -->
<DIV  class="t" style="MARGIN-TOP: 15px" align="center">
	<FORM name="regForm" onSubmit="return check()" action="manage/doreg.jsp" method="post">
		<br/>��&nbsp;��&nbsp;�� &nbsp;
			<INPUT class="input" tabIndex="1" tryp="text" maxLength="20" size="35" name="uName">
		<br/>��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;
			<INPUT class="input" tabIndex="2" type="password" maxLength="20" size="40" name="uPass">
		<br/>�ظ����� &nbsp;
			<INPUT class="input" tabIndex="3" type="password" maxLength="20" size="40" name="uPass1">
		<br/>�Ա� &nbsp;
			Ů<input type="radio" name="gender" value="1">
			��<input type="radio" name="gender" value="2" checked="checked" />
		<br/>��ѡ��ͷ�� <br/>
		<img src="image/head/1.gif"/><input type="radio" name="head" value="1.gif" checked="checked">
		<img src="image/head/2.gif"/><input type="radio" name="head" value="2.gif">
		<img src="image/head/3.gif"/><input type="radio" name="head" value="3.gif">
		<img src="image/head/4.gif"/><input type="radio" name="head" value="4.gif">
		<img src="image/head/5.gif"/><input type="radio" name="head" value="5.gif">
		<BR/>
		<img src="image/head/6.gif"/><input type="radio" name="head" value="6.gif">
		<img src="image/head/7.gif"/><input type="radio" name="head" value="7.gif">
		<img src="image/head/8.gif"/><input type="radio" name="head" value="8.gif">
		<img src="image/head/9.gif"/><input type="radio" name="head" value="9.gif">
		<img src="image/head/10.gif"/><input type="radio" name="head" value="10.gif">
		<BR/>
		<img src="image/head/11.gif"/><input type="radio" name="head" value="11.gif">
		<img src="image/head/12.gif"/><input type="radio" name="head" value="12.gif">
		<img src="image/head/13.gif"/><input type="radio" name="head" value="13.gif">
		<img src="image/head/14.gif"/><input type="radio" name="head" value="14.gif">
		<img src="image/head/15.gif"/><input type="radio" name="head" value="15.gif">
		<br/>
			<INPUT class="btn" tabIndex="4" type="submit" value="ע ��">
	</FORM>
</DIV>
<!--      ����        -->
<BR>
<%@ include file="common/bottom.jsp" %>
</BODY>
</HTML>
