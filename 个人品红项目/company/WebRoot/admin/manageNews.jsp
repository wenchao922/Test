<%@ page language="java" import="java.util.*,java.sql.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>管理人员-管理</title>
	<link href="../image/css/style_admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function selectAll(){
	var boxs=document.getElementsByName("delete");
	for(i=0;i<boxs.length;i++){
		boxs[i].checked=document.getElementById("allbox").checked;
	}
}
function check(){
	var boxs=document.getElementsByName("delete");
	bool=false;
	for(i=0;i<boxs.length;i++){
		if(boxs[i].checked){
			bool=true;
		}
	}
	if(bool==false){
		alert("您没有选择任何用户！");
		return false;
	}
	if(!(window.confirm("确定删除选中的用户吗？"))){
		return false;
	}
	document.form1.submit();
}
</script>
</head>
<body>
<form   name="form1" action="deleteNews.jsp" method="post">
	<table cellspacing="1" cellpadding="4" width="100%" class="tableborder" id="table3">
		<tr>
			<td colspan="15" class="header">
				新闻管理
			</td>
		</tr>
		<tr>
			<td  align="center" class="altbg1"  width="100px">
				<input type="checkBox" id="allbox"  onclick="selectAll()"></input>全选&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="javascript:check()">删除</a>
			</td>
			<td align="center" class="altbg1">
				<b>新闻标题</b>
			</td>
			<td align="center" class="altbg1">
				<b>新闻发布时间</b>
			</td>
			<td align="center" class="altbg1">
				<b>修改</b>
			</td>
		</tr>
			
			<%
				int currentPage=1;
				try{
					currentPage=Integer.parseInt(request.getParameter("page"));
				}catch(Exception e){
					currentPage=1;
				}
				INewsDao newsDao=new NewsDao();
				int count=newsDao.totalNews();
				int maxPage=count%INewsDao.PAGE_SIZE==0?count/INewsDao.PAGE_SIZE:count/INewsDao.PAGE_SIZE+1;
				List<News> news=newsDao.findNewsByPage(currentPage);
				for(News n:news){
			 %>
		<tr>
			<td rowspan="2" align="center" class="altbg2">
				<input type="checkBox" name="delete" value="<%=n.getNewsId() %>"></input>
			</td>
			<td rowspan="2" align="center" class="altbg2">
				<%=n.getTitle() %>
			</td>
			<td class="altbg2" rowspan="2" align="center">
				<%=n.getWriterDate()%>
			</td>
			<td class="altbg2" rowspan="2" align="center">
				<a href="updateNews.jsp?newsId=<%=n.getNewsId() %>">修改</a>
			</td>
		</tr>
		<tr></tr>
		<%} %>
		<tr>
			<td align="right">
				<a href="manageNews.jsp?page=<%=currentPage-1<1?1:currentPage-1 %>">上一页</a>&nbsp;&nbsp;|&nbsp;
				<a href="manageNews.jsp?page=<%=currentPage+1>maxPage?maxPage:currentPage+1 %>">下一页</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>