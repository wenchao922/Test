<%@ page language="java" import="java.util.*,com.accp800.dao.*,com.accp800.dao.impl.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理员-添加</title>
<link href="../image/css/style_admin.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function fun_check_form(){
	if(document.form1.serialNumber.value==""){
		alert("请输入商品编号（系列）信息信息。");
		return false;
	}else if(document.form1.name.value==""){
		alert("请输入商品名称。");
		return false;
	}else if(document.form1.brand.value==""){
		alert("请输入商品商标。");
		return false;
	}else if(document.form1.model.value==""){
		alert("请输入商品型号。");
		return false;
	}else if(document.form1.price.value==""){
		alert("请输入商品价格。");
		return false;
		if(!isNaN(document.form1.price.value)){
			alert("");
			return false;
		}
	}else{
		return true;
	}
}
			
 function  checkIsFloat(){  
    var  nc=event.keyCode;            
    if(nc < 48 || nc > 57 ){         
	    if(nc==46){  
	        var s=document.form1.price.value;  
	        for(var  i=0;i<s.length;i++){  
	           if(s.charAt(i)=='.'){  
	               event.keyCode=0;   
	               return;  
	           }  
	       }  
	   }else{  
	       event.keyCode=0;return;  
	   }
	}
}  
</script>
</head>
<body>
<form name="form1" action="doAddProduct.jsp" method="post" enctype="multipart/form-data"
	onSubmit="return fun_check_form()">
	<input type="hidden" value="update" name="type">
<table cellspacing="1" cellpadding="4" width="100%" class="tableborder" id="table3">
	<%
		IProductDao productDao=new ProductDao();
		int productId=Integer.parseInt(request.getParameter("productId"));
		Product p=productDao.findProductById(productId);
	 %>
	<input type="hidden" value="<%=productId %>" name="productId"/>
	<tr>
		<td colspan="12" class="header">添加商品信息</td>
	</tr>
	<tr>
		<td class="altbg1">商品编号（系列）：</td>
		<td class="altbg2" colspan="11"><input type="text"
			name="serialNumber" size="34" value="<%=p.getSerialNumber() %>"></td>
	</tr>
	<tr>
		<td class="altbg1">商品名称：</td>
		<td class="altbg2" colspan="11"><input type="text" name="name"
			size="34" value="<%=p.getName() %>"></td>
	</tr>
	<tr>
		<td class="altbg1">商品商标：</td>
		<td class="altbg2" colspan="11"><input type="text" name="brand"
			size="34" value="<%=p.getBrand() %>"></td>
	</tr>
	<tr>
		<td class="altbg1">商品型号：</td>
		<td class="altbg2" colspan="11"><input type="text" name="model"
			size="34" value="<%=p.getModel() %>"></td>
	</tr>
	<tr>
		<td class="altbg1">商品价格：</td>
		<td class="altbg2" colspan="11"><input type="text" name="price"
			size="34" value="<%=p.getPrice() %>" onkeypress="checkIsFloat();" /></td>
	</tr>
	<tr>
		<td class="altbg1">商品图片：</td>
		<td class="altbg2" colspan="11"><input type="file" name="picture"
			size="34"></td>
	</tr>
	<tr>
		<td class="altbg1">商品介绍：</td>
		<td class="altbg2" colspan="11"><textarea rows="5" cols="60"
			name="description"><%=p.getDescription() %></textarea></td>
	</tr>
	<tr>
		<td class="altbg1"></td>
		<td class="altbg2" colspan="11"><input type="submit" value="提交"
			name="B1" /> &nbsp; <input type="reset" value="重置" name="B2" /></td>
	</tr>
</table>
</form>
</body>
</html>
