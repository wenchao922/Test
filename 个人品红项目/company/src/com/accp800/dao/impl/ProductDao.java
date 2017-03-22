package com.accp800.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.accp800.dao.IProductDao;
import com.accp800.model.Product;

public class ProductDao extends BasicDao<Product> implements
		RowMapper<Product>, IProductDao {

	public boolean addProduct(Product p) throws SQLException {
		return executeUpdate("insert into product values(?,?,?,?,?,?,?)", p
				.getSerialNumber(), p.getName(), p.getBrand(), p.getModel(), p
				.getPrice(), p.getPicture(), p.getDescription()) == 1;
	}

	public boolean deleteProductById(int productId) throws SQLException {
		return executeUpdate("delete product where productId=?", productId) == 1;
	}

	public List<Product> findProduct() throws SQLException {
		return find("select * from product",this);
	}

	public Product findProductById(int productId) throws SQLException {
		return (find("select * from product where productID=?",this,productId)).get(0);
	}

	public boolean updateProductById(Product p) throws SQLException {
		return executeUpdate(
				"update product set serialNumber=?,name=?,brand=?,model=?,price=?,picture=?,description=? where productID=?",
				p.getSerialNumber(), p.getName(), p.getBrand(), p.getModel(), p
						.getPrice(),p.getPicture(),p.getDescription(),p.getProductId()) == 1;
	}

	public Product mapRow(ResultSet rs) throws SQLException {
		return new Product(rs.getInt("productID"),
				rs.getString("serialNumber"), rs.getString("name"), rs
						.getString("brand"), rs.getString("model"), rs
						.getDouble("price"), rs.getString("picture"), rs
						.getString("description"));
	}

	public List<Product> findProductByPage(int pagesize,int page) throws SQLException {
		String sql="select top " + pagesize + " * from product where productId not in (select top " + (pagesize*(page-1)) + "  productId from product)";
		return find(sql,this);
	}

	public int totalProducts() throws SQLException {
		return countRows("select count(*) from product");
	}

}
