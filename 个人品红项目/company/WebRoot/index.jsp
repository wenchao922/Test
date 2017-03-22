<%@ page language="java"
	import="java.util.*,com.accp800.dao.*,com.accp800.dao.impl.*,com.accp800.model.*"
	pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>品红公司</title>
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

<script type="text/javascript">
function openChat(){
	window.open("chat/index.jsp","","left=250   top=200   width=500   height=400");
}
</script>
</head>

<body>
	<%@include file="head.jsp" %>
	<table width="799" border="0px" align="center" cellpadding="0px" cellspacing="0px">
	<tr>
		<td valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="352">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td background="image/d02.jpg">
									<img src="image/d_r7_c1.jpg" width="101" height="35" />
								</td>
								<td align="right" background="image/d02.jpg">
									<img src="image/d_r7_c14.jpg" width="94" height="35" />
								</td>
							</tr>
		  <%
		  	INewsDao newsDao= new NewsDao();
		  	List<News> news=newsDao.findNewsByPage(1);
		  	for(News n:news){
		   %>
							<tr>
								<td height="26" colspan="2">&nbsp;&nbsp;
									<a href="detailNews.jsp?newsID=<%=n.getNewsId() %>" class="dong06"><%=n.getTitle() %>&nbsp;&nbsp;&nbsp;<font color="#ff0000">[<%=n.getWriterDate() %>]</font></a>
								</td>
							</tr>
							<tr>
								<td colspan="2"><img src="image/d03.jpg" width="352" height="1" /></td>
							</tr>
			<%} %>
							<tr>
								<td colspan="2" align="right">
									<a href="showNewsList.jsp"><img src="image/d_r11_c15.jpg" width="51" height="33" border="0" /></a>
								</td>
							</tr>

						</table>
					</td>
					<td align="right" valign="top">
						<table width="268" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<a href="showProductList.jsp"><img src="image/d_r11_5_r1_c1.jpg" width="268" height="63" border="0" /></a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="showProductList.jsp"><img src="image/d_r11_5_r3_c1.jpg" width="268" height="59" border="0" /></a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="showProductList.jsp"><img src="image/d_r11_5_r4_c1.jpg" width="268" height="61" border="0" /></a>
								</td>
							</tr>
							<tr>
							<td>
								<a href="showProductList.jsp"><img src="image/d_r11_5_r5_c1.jpg" width="268" height="64" border="0" /></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td background="image/d_r11_8.jpg">
					<img src="image/d_r13_c1.jpg" width="160" height="27" />
				</td>
				<td align="right" background="image/d_r11_8.jpg">
					<a href="showProductList.jsp"><img src="image/d_r13_c21.jpg" width="66" height="27" border="0" /></a>
				</td>
				</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		<%
			IProductDao productdao=new ProductDao();				
			List<Product> ps=productdao.findProductByPage(8,1);
			
			int i=1;
			for(Product p:ps){	
		 %>
			<td width="25%" align="center">
				<a href="detailProduct.jsp?productId=<%=p.getProductId() %>"><img src="image/<%=p.getPicture() %>" width="143" height="112" border="0" /></a>
			</td>
		<% 	
				if(i==ps.size()/2){
		%>
					</tr><tr>
		<%}i++; }%>
		</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="25%" background="image/d_r11_11_r1_c15.jpg">
						<img src="image/d_r11_11_r1_c1.jpg" width="185" height="27" />
					</td>
					<td width="25%" background="image/d_r11_11_r1_c15.jpg">
						&nbsp;
					</td>
					<td width="25%" background="image/d_r11_11_r1_c15.jpg">
						<img src="image/d_r11_11_r1_c21.jpg" width="160" height="27" />
					</td>
					<td width="25%" align="right" background="image/d_r11_11_r1_c15.jpg">
						<a href="#"><img src="image/d_r11_11_r1_c30.jpg" width="63" height="27" border="0" /></a>
					</td>
				</tr>
				<tr>
					<td width="50%" colspan="2" bgcolor="#FCFCFC">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="28" height="29">
									<img src="image/d_r11_12_r1_c1.jpg" width="28" height="32" />
								</td>
								<td width="100" align="center" class="d06" style="font-weight: bold">
									&nbsp;业务专线：
								</td>
								<td class="d06" style="font-weight: bold">
									010-88888888
								</td>
							</tr>
							<tr>
							<td width="28" height="29">
								<img src="image/d_r11_12_r1_c1.jpg" width="28" height="32" />
							</td>
							<td width="100" align="center" class="d06">
								&nbsp;
								<span style="font-weight: bold">售后服务：</span>
							</td>
							<td class="d06" style="font-weight: bold">
								010-66666666
							</td>
							</tr>
							<tr>
							<td width="28" height="29">
								<img src="image/d_r11_12_r1_c1.jpg" width="28" height="32" />
							</td>
							<td width="100" align="center" class="bold">
								&nbsp;
							<span class="d06" style="font-weight: bold">传&nbsp;&nbsp;&nbsp;&nbsp;真：</span>
							</td>
							<td class="d06" style="font-weight: bold">
								010-88888888
							</td>
						</tr>
					</table>
				</td>
				<td width="50%" colspan="3" bgcolor="#FCFCFC">
					<table width="287" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="97" height="47" align="center">
								<img src="image/f1.gif" width="90" height="33" />
							</td>
							<td width="97" height="47" align="center">
								<img src="image/f2.gif" width="88" height="33" />
							</td>
							<td width="97" height="47" align="center">
								<img src="image/f3.gif" width="90" height="33" />
							</td>
						</tr>
						<tr>
							<td width="97" height="47" align="center">
								<img src="image/tg-8.gif" width="90" height="33" />
							</td>
							<td width="97" height="47" align="center">
								<img src="image/d_r11_13_r1_c1.jpg" width="90" height="33" />
							</td>
							<td width="97" height="47" align="center">
								<img src="image/d_r11_13_r1_c7.jpg" width="88" height="33" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</td>
	<td width="175" valign="top" bgcolor="#FCFCFC">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td valign="top">
					<a href="showProductList.jsp"><img src="image/d_r11_6.jpg" width="175" height="42" border="0" /></a>
				</td>
			</tr>
			<tr>
				<td height="590">
				<!-- 指向链接图片url -->
					<div id="demo" style="overflow: hidden; height: 600; width: 180; background: #214984; color: #ffffff">
						<div id="demo1">
						<!-- 定义图片 -->
						<%
							 List<Product> products=productdao.findProduct();
							 for(Product p: products){
						 %>
						<img src="image/<%=p.getPicture() %>" width="100%" height="107" border="0" align="middle" />
						<%} %>
						</div>
						<div id="demo2"></div>
						</div>

<script>
var speed=30;
demo2.innerHTML=demo1.innerHTML;
demo.scrollTop=demo.scrollHeight;
function Marquee(){
if(demo1.offsetTop-demo.scrollTop>=0)
demo.scrollTop+=demo2.offsetHeight;
else{
demo.scrollTop--;
}
}
var MyMar=setInterval(Marquee,speed);
demo.onmouseover=function() {clearInterval(MyMar)}
demo.onmouseout=function() {MyMar=setInterval(Marquee,speed);}
</script>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%@ include file="bottom.jsp" %>
</body>
</html>
