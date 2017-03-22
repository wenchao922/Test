<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<html>
	<script type="text/javascript">
function openChat(){
	window.open("chat/index.jsp","","left=250   top=200   width=500   height=400");
}
</script>
	<link href="image/css/right.css" rel="stylesheet" type="text/css" />
	<link href="image/css.css" rel="stylesheet" type="text/css" />
	<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
	<%@include file="head.jsp" %>
		<table height="28" cellspacing="3" cellpadding="0" width="776"
			align="center" background="zjej/btmunu.gif" border="0">
			<tbody>
				<tr valign="bottom">
					<td>
						&nbsp;&nbsp;
						<a class="nav" href="index.jsp">首页</a><font class="nav">
							&gt; </font><a class="nav" href="showProductList.jsp">商品展示</a><font
							class="nav"> &gt; </font>商品信息
					</td>
				</tr>
			</tbody>
		</table>
		<%
			int productId=Integer.parseInt(request.getParameter("productId"));
			IProductDao productdao=new ProductDao();
			Product p=productdao.findProductById(productId);
		 %>
		<table height="1" cellspacing="0" cellpadding="0" width="776"
			align="center" bgcolor="#cccccc" border="0">
			<tbody>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>
		<table cellspacing="0" cellpadding="0" width="776" align="center"
			border="0">
			<tbody>
				<tr>
					<td valign="top" width="195" background="zjej/ny3.gif"
						bgcolor="#ffffff" height="186">
						<%@include file="left.jsp" %>
					</td>
					<td valign="top" width="3" bgcolor="#e8e8e8"></td>
					<td valign="top" bgcolor="#ffffff" height="300">
						<table cellspacing="0" cellpadding="0" width="100%" align="center"
							border="0">
							<tbody>
								<tr valign="top">
									<td>
										<table cellspacing="5" cellpadding="3" width="100%"
											bgcolor="#ffffff" border="0">
											<tbody>
												<tr>
													<td valign="top" align="middle" width="150" height="100">
														<font color="#000000"><img
																style="BORDER-LEFT-COLOR: #000000; BORDER-BOTTOM-COLOR: #000000; BORDER-TOP-COLOR: #000000; BORDER-RIGHT-COLOR: #000000"
																height="83" hspace="0" src="image/<%=p.getPicture() %>"
																width="86" align="default" border="0" />
														</font>
													</td>
													<td height="100" valign="top">
														<table height="100%" cellspacing="3" cellpadding="0"
															width="100%" border="0">
															<tbody>
																<tr valign="top">
																	<td>
																		<table cellspacing="1" cellpadding="3" width="100%"
																			bgcolor="#cccccc" border="0">
																			<tbody>
																				<tr valign="top" bgcolor="#ffffff">
																					<td align="middle" width="90" bgcolor="#f0f0f0">
																						产品编号
																					</td>
																					<td style="PADDING-LEFT: 10px">
																						<%=p.getSerialNumber() %>
																					</td>
																				</tr>
																				<tr valign="top" bgcolor="#ffffff">
																					<td align="middle" width="90" bgcolor="#f0f0f0">
																						产品名称
																					</td>
																					<td style="PADDING-LEFT: 10px">
																						<%=p.getName() %>
																					</td>
																				</tr>
																				<tr valign="top" bgcolor="#ffffff">
																					<td align="middle" width="90" bgcolor="#f0f0f0">
																						产品品牌
																					</td>
																					<td style="PADDING-LEFT: 10px">
																						<%=p.getBrand() %>
																					</td>
																				</tr>
																				<tr valign="top" bgcolor="#ffffff">
																					<td align="middle" width="90" bgcolor="#f0f0f0">
																						产品型号
																					</td>
																					<td style="PADDING-LEFT: 10px">
																						<%=p.getModel() %>
																					</td>
																				</tr>
																				<tr valign="top" bgcolor="#ffffff">
																					<td align="middle" width="90" bgcolor="#f0f0f0">
																						产品价格
																					</td>
																					<td style="PADDING-LEFT: 10px">
																						<%=p.getPrice() %>
																					</td>
																				</tr>
																				<tr valign="top" bgcolor="#ffffff">
																					<td align="middle" width="90" bgcolor="#f0f0f0">
																						产品介绍
																					</td>
																					<td style="PADDING-LEFT: 10px">
																						<%=p.getDescription() %>
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
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<link href="image/css.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
		<%@include file="bottom.jsp" %>
	</body>
</html>


