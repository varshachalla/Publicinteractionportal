package com.pip.logcomplain;

import java.sql.Date;

public class Issues {
	private int issue_id;
	private String dept_name;
	private String issue_name;
	private String issue_desc;
	private String issue_image;
	private int issue_status;
	private String issue_status_name;
	private Date issue_date;
	
	public int getIssue_id() {
		return issue_id;
	}
	public void setIssue_id(int issue_id) {
		this.issue_id = issue_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	
	public String getIssue_name() {
		return issue_name;
	}
	public void setIssue_name(String issue_name) {
		this.issue_name = issue_name;
	}
	public String getIssue_desc() {
		return issue_desc;
	}
	public void setIssue_desc(String issue_desc) {
		this.issue_desc = issue_desc;
	}
	public String getIssue_image() {
		return issue_image;
	}
	public void setIssue_image(String issue_image) {
		this.issue_image = issue_image;
	}
	
	public int getIssue_status() {
		return issue_status;
	}
	public void setIssue_status(int issue_status) {
		this.issue_status = issue_status;
	}
	public Date getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(Date issue_date) {
		this.issue_date = issue_date;
	}
	public String getIssue_status_name() {
		return issue_status_name;
	}
	public void setIssue_status_name(String issue_status_name) {
		this.issue_status_name = issue_status_name;
	}
	
	

}
