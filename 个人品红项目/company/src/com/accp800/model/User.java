package com.accp800.model;

public class User {
	// userID,userName,password,status
	private int userId;
	private String uName;
	private String pwd;
	private int status;

	public User() {
	}

	public User(String name, String pwd, int status) {
		uName = name;
		this.pwd = pwd;
		this.status = status;
	}

	public User(int userId, String name, String pwd, int status) {
		this.userId = userId;
		uName = name;
		this.pwd = pwd;
		this.status = status;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUName() {
		return uName;
	}

	public void setUName(String name) {
		uName = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
