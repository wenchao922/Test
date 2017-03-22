<%@ page language="java" import="java.util.*,com.accp800.dao.impl.*,com.accp800.dao.*" pageEncoding="UTF-8"%>
<%
	String[] product=request.getParameterValues("delete");
	
	IProductDao productdao=new ProductDao();
	
	try{
		for(int i=0;i<product.length;i++){
			if(productdao.deleteProductById(Integer.parseInt(product[i]))){
%>
<script>
alert("删除成功！");
location="manageProduct.jsp";
</script>
<%			
			}
		}
	}catch(Exception e){
		e.printStackTrace();
%>
<script>
alert("出现错误！");
location="manageProduct.jsp";
</script>
<%}%>

