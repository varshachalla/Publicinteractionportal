package com.pip.login;

import java.sql.Date;

public class Admin {

	private int id;
	private String username;
	private String pword;
	private String type;
	private String dept_name;
	private String area;
	private String dept_id;
	private Date created_time;
	private byte[] dept_image;
	
	public int getId() {
		return id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPword() {
		return pword;
	}
	public void setPword(String pword) {
		this.pword = pword;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public byte[] getDept_image() {
		return dept_image;
	}
	public void setDept_image(byte[] dept_image) {
		this.dept_image = dept_image;
	}
	
	
}
