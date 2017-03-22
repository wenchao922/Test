<%@ page language="java" import="java.util.*,com.jspsmart.upload.*,com.accp800.dao.impl.*,com.accp800.dao.*,com.accp800.model.*" pageEncoding="UTF-8"%>
<%
	SmartUpload smart=new SmartUpload();
	smart.initialize(pageContext);
	smart.setAllowedFilesList("jpg,gif");
	smart.setTotalMaxFileSize(1024*1024*500);
	smart.upload();
	
	int i = smart.save("/image");
	File file =smart.getFiles().getFile(0);
	String picture=file.getFileName();
	String type=smart.getRequest().getParameter("type");
	String serialNumber=smart.getRequest().getParameter("serialNumber");
	String name=smart.getRequest().getParameter("name");
	String brand=smart.getRequest().getParameter("brand");
	String model=smart.getRequest().getParameter("model");
	Double price=Double.parseDouble(smart.getRequest().getParameter("price"));
	String description=smart.getRequest().getParameter("description");
	
	IProductDao productdao=new ProductDao();
	if(type.equals("add")){
		Product p=new Product(serialNumber,name,brand,model,price,picture,description);
		if(productdao.addProduct(p)){
%>
	<script type="text/javascript">
<!--
alert("添加成功");
location="manageProduct.jsp";
//-->
</script>
<%	 	}
	}else{
		int productId=Integer.parseInt(smart.getRequest().getParameter("productId"));
		Product p=new Product(productId,serialNumber,name,brand,model,price,picture,description);
		if(productdao.updateProductById(p)){
%>
	<script type="text/javascript">
<!--
alert("修改成功");
location="manageProduct.jsp";
//-->
</script>
<%}} %>

