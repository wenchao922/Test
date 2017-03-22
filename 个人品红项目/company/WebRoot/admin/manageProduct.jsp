<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.model.*,com.accp800.dao.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理人员-管理</title>
	<link href="../image/css/style_admin.css" rel="stylesheet" type="text/css">
</head>
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
<body>
<form action="deleteProduct.jsp" name="form1"  method="post">
<table cellspacing="1" cellpadding="4" width="100%" class="tableborder" id="table3">
	<tr>
		<td colspan="15" class="header">  
			商品管理  
		</td>
	</tr>
	<tr>
		<td align="center" class="altbg1">
			<input type="checkbox" id="selectAll"></input>全选&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="javascript:check()">删除</a>
		</td>
		<td align="center" class="altbg1">
			<b>商品编号</b>
		</td>
		<td align="center" class="altbg1">
			<b>商品名称</b>
		</td>
		<td align="center" class="altbg1">
			<b>商品商标</b>
		</td>
		<td align="center" class="altbg1">
			<b>商品型号</b>
		</td>
		<td align="center" class="altbg1">
			<b>商品价格</b>
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
			int pagesize=10;
			IProductDao productDao=new ProductDao();
			int total=productDao.totalProducts();
			int maxPage=total%pagesize==0?total/pagesize:total/pagesize+1;
			List<Product> products=productDao.findProductByPage(pagesize,currentPage);
			for(Product p:products){
		 %>	
	<tr>
		<td class="altbg2" rowspan="2" align="center">
			<input type="checkbox" name="delete" value="<%=p.getProductId() %>"></input>
		</td>
		<td rowspan="2" align="center" class="altbg2">
			<%=p.getSerialNumber() %>
		</td>
		<td class="altbg2" rowspan="2" align="center">
			<%=p.getName() %>
		</td>
		<td class="altbg2" rowspan="2" align="center">
			<%=p.getBrand() %>
		</td>
		<td class="altbg2" rowspan="2" align="center">
			<%=p.getModel() %>
		</td>
		<td class="altbg2" rowspan="2" align="center">
			<%=p.getPrice() %>
		</td>
		<td class="altbg2" rowspan="2" align="center">
			<a href="updateProduct.jsp?productId=<%=p.getProductId() %>">修改</a>
		</td>				
	</tr>
	<tr></tr>
	<%} %>	
	<tr>
		
	</tr>
	<tr>
		<td align="right">
			<a href="manageProduct.jsp?page=<%=currentPage-1<1?1:currentPage-1 %>">上一页</a>
			<a href="manageProduct.jsp?page=<%=currentPage+1>maxPage?maxPage:currentPage+1 %>">下一页</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>