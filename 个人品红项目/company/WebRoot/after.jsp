<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<script type="text/javascript">
function openChat(){
	window.open("chat/index.jsp","","left=250   top=200   width=500   height=400");
}
</script>
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
							&gt; </font><a class="nav" href="showNewsList.jsp">站内新闻</a>
					</td>
				</tr>
			</tbody>
		</table>
		<table height="1" cellspacing="0" cellpadding="0" width="776"
			align="center" bgcolor="#cccccc" border="0">
			<tbody>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>
		<!--    右侧显示区域   开始 -->

		<table width="799" border="0" align="center" cellpadding="0"
			cellspacing="0" class="n">
			<tr>
				<td align="center" valign="top" background="image/cg5.jpg" bgcolor="#f4f4f4">
					<%@include file="left.jsp" %>
				</td>
				<td width="608" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr align="center" height="50">
										<td valign="middle" colspan="2" background="image/cg2.jpg">
											<span class="g03" style="font-weight: bold">
												态度决定一切，沟通解决一切</span>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="370" align="right" valign="top">
								<table width="100%" border="0" cellspacing="32" cellpadding="0">
									<tr>
										<td align="left" valign="top">
											<p class="d061">
												凡在本公司购买的商品，保证七天内无条件退、换商品；如有质量问题保证在一个月内换货，三个月内免费维修
											</p>
											<p class="d061">
												保修期内的维修服务：

												此类商品所承诺的免费服务期内,您所购货物出现故障时,可拨打售后服务免费热线电话进行报修.我们将会在下一工作日或您指定的日期(法定节假日除外)提供免费服务.如损坏零件不属于保修范围之内,仅收取零件的成本费用,并进行更换.

												6.2保修期外的维修服务:

												对您购买的,但已处于保修期外的商品,我们将按保修期外维修服务标准向您提供服务,对于保修期外的维修,您需要承担的费用,包括维修所更换的零配件成本,维修费用;如果您需要上门服务,不定期需承担工程师现场维修的上门服务费.
												。
											</p>
											<p class="d061">
												&nbsp;&nbsp;&nbsp;&nbsp;
												<br />
												&nbsp;&nbsp;&nbsp;&nbsp;
											</p>
										</td>
									</tr>
								</table>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
		<%@include file="bottom.jsp" %>
	</body>
</html>


