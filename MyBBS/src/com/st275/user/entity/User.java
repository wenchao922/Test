package com.st275.user.entity;

public class User {
	
	private String uId;
	
	private String uName;
	
	private String uPass;
	
	private String head;
	
	private String regTime;
	
	private String gender;

	public String getUId() {
		return uId;
	}

	public void setUId(String id) {
		uId = id;
	}

	public String getUName() {
		return uName;
	}

	public void setUName(String name) {
		uName = name;
	}

	public String getUPass() {
		return uPass;
	}

	public void setUPass(String pass) {
		uPass = pass;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
