<%@ page language="java"
	import="java.util.*,com.accp800.dao.*,com.accp800.dao.impl.*,com.accp800.model.*"
	pageEncoding="UTF-8"%>
<html>
	<link href="image/css.css" rel="stylesheet" type="text/css">
	<link href="image/css/right.css" rel="stylesheet" type="text/css">
	<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	s margin-bottom: 0px;
}
</style>
	<script>
function openChat(){
	window.open("chat/index.jsp","","left=250   top=200   width=500   height=400");
}
</script>
	<head>
		<title>商品展示</title>
	</head>
	<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
		<%@include file="head.jsp"%>
		<table height="28" cellspacing="3" cellpadding="0" width="776"
			align="center" background="zzjz/btmunu.gif" border="0">
			<tr valign="bottom">
				<td>
					&nbsp;&nbsp;
					<a class="nav" href="index.jsp">首页</a><font class="nav">
						&gt; </font><a class="nav" href="showProductList.jsp">商品展示</a>
				</td>
			</tr>
		</table>
		<table height="1" cellspacing="0" cellpadding="0" width="776"
			align="center" bgcolor="#cccccc" border="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" width="776" align="center"
			border="0">
				<tr>
					<td valign="top" width="195" background="zzjz/ny3.gif"
						bgcolor="#ffffff" height="186">
						<%@include file="left.jsp"%>
					</td>
					<td valign="top" width="3" bgcolor="#e8e8e8"></td>
					<td valign="top" bgcolor="#ffffff" height="300">
						<table cellspacing="0" cellpadding="4" width="100%" align="center"
							border="0">
								<tr>
									<td valign="top" width="100%">
										<table cellspacing="2" cellpadding="0" width="558"
											bgcolor="#ffffff" border="0" height="165">
											<tbody>
												<% 
												int currentPage=1;
												try{
													currentPage=Integer.parseInt(request.getParameter("page"));
												}catch(Exception e){
													currentPage=1;
												}
												IProductDao productdao=new ProductDao();
												int pagesize=2;
												int count=productdao.totalProducts();
												int maxPage=count%pagesize==0?count/pagesize:count/pagesize+1;
												maxPage=maxPage==0?1:maxPage;
												List<Product> products=productdao.findProductByPage(pagesize,currentPage);
												for(Product p:products){
											%>
												<tr valign="top">
													<td valign="top" width="106" height="93">
														<a
															href="detailProduct.jsp?productId=<%=p.getProductId() %>"><font
															color="#000000"><img
																	style="BORDER-LEFT-COLOR: #000000; BORDER-BOTTOM-COLOR: #000000; BORDER-TOP-COLOR: #000000; BORDER-RIGHT-COLOR: #000000"
																	height="65" width="90" hspace="0" src="image/<%=p.getPicture() %>"
																	border="0"> </font> </a>
													</td>
													<td height="93">
														<table cellspacing="1" cellpadding="4" width="100%"
															bgcolor="#cccccc" border="0">
															<tbody>
																<tr valign="top" align="right" bgcolor="#ffffff">
																	<td height="30">
																		<table height="28" cellspacing="1" cellpadding="4"
																			width="100%" bgcolor="#cccccc" border="0">
																			<tbody>
																				<tr bgcolor="#99ccff">
																					<td valign="middle" width="80" bgcolor="#f0f0f0">
																						产品名称
																					</td>
																					<td width="120" bgcolor="#ffffff">
																						<a
																							href="detailProduct.jsp?productId=<%=p.getProductId() %>"><font
																							color="#000000"><%=p.getName() %></font> </a>
																					</td>
																					<td valign="middle" width="80" bgcolor="#f0f0f0">
																						产品品牌
																					</td>
																					<td bgcolor="#ffffff">
																						<font color="#ff0033"><%=p.getBrand() %></font>
																					</td>
																				</tr>
																				<tr style="DISPLAY: block" bgcolor="#99ccff">
																					<td valign="middle" width="80" bgcolor="#f0f0f0">
																						产品型号
																					</td>
																					<td bgcolor="#ffffff">
																						<%=p.getModel() %>
																					</td>
																					<td valign="middle" width="80" bgcolor="#f0f0f0">
																						产品价格
																					</td>
																					<td bgcolor="#ffffff">
																						<font color="#ff0033"><%=p.getPrice() %></font>元
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<%} %>
											</tbody>
										</table>
									</td>
								</tr>

								<tr valign="bottom" align="right">
									<td colspan="3" width="100%">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="showProductList.jsp?page=<%=currentPage-1<1?1:currentPage-1 %>">上一页</a>|
										<a href="showProductList.jsp?page=<%=currentPage+1>maxPage?maxPage:currentPage+1 %>">下一页</a>
									</td>
								</tr>
						</table>
					</td>
				</tr>
		</table>
		<%@include file="bottom.jsp"%>
	</body>
</html>
