package com.accp800.dao;

import java.sql.SQLException;
import java.util.List;

import com.accp800.model.Product;

public interface IProductDao {
	public boolean addProduct(Product p)throws SQLException;
	public boolean updateProductById(Product p)throws SQLException;
	public boolean deleteProductById(int productId)throws SQLException;
	public Product findProductById(int productId)throws SQLException;
	public List<Product> findProduct()throws SQLException;
	public List<Product> findProductByPage(int pagesize,int page)throws SQLException;
	public int totalProducts()throws SQLException; 
}
