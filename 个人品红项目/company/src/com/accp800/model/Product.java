package com.accp800.model;

public class Product {
	// productID,serialNumber,name,brand,model,price,picture,description
	private int productId;
	private String serialNumber;
	private String name;
	private String brand;
	private String model;
	private Double price;
	private String picture;
	private String description;

	public Product() {
	}

	public Product(String serialNumber, String name, String brand,
			String model, Double price, String picture, String description) {
		this.serialNumber = serialNumber;
		this.name = name;
		this.brand = brand;
		this.model = model;
		this.price = price;
		this.picture = picture;
		this.description = description;
	}

	public Product(int productId, String serialNumber, String name,
			String brand, String model, Double price, String picture,
			String description) {
		this.productId = productId;
		this.serialNumber = serialNumber;
		this.name = name;
		this.brand = brand;
		this.model = model;
		this.price = price;
		this.picture = picture;
		this.description = description;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
