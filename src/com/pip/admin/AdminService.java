package com.pip.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pip.logcomplain.Issues;

public class AdminService {

	private static List<Issues> issues = new ArrayList<Issues>();
	
	public List<Issues> retrieveInbox(Connection conn) {
		issues.clear();
		try {
			 
			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;
				Statement stmt = conn.createStatement();
				String sql = "select * from issue order by issue_date desc";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);

				if (rs != null) {
					
					while (rs.next()) {
						ResultSet rs1 = null;
						Statement stmt1 = conn.createStatement();
						Issues issue=new Issues();
						issue.setIssue_id(rs.getInt("issue_id"));
						String sql1 = "select * from tracking where issue_id=" + "'" + issue.getIssue_id() + "'";
						System.out.println(sql1);
						rs1 = stmt1.executeQuery(sql1);
						if(rs1!=null && rs1.next() )
						{
							issue.setIssue_status(rs1.getInt("status"));
							ResultSet rs2 = null;
							Statement stmt2 = conn.createStatement();
							String sql2 = "select * from department where dept_id=" + "'" + rs1.getInt("dept_id") + "'";
							System.out.println(sql2);
							rs2 = stmt2.executeQuery(sql2);
							if(rs2!=null && rs2.next() )
							{
								issue.setDept_name(rs2.getString("department"));
							}
						}
						else
						{
							issue.setIssue_status(-1);
						}
						issue.setIssue_name(rs.getString("issue_name"));
						issue.setIssue_desc(rs.getString("issue_desc"));
						issue.setIssue_date(rs.getDate("issue_date"));
						issue.setIssue_image(rs.getString("issue_image"));
						issues.add(issue);
			        }  
					
				}
					
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(issues.size());
		return issues;
		
	}
	
	
	public List<String> retrieveDepartments(Connection conn) {
		List<String> departments = new ArrayList<String>();
		try {
			 
			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;

				Statement stmt = conn.createStatement();
				String sql = "select department from department";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);

				if (rs != null) {
					
					while (rs.next()) {
						departments.add(rs.getString("department"));
			        }  
					
				}
					
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return departments;
		
	}
	
	
	/*public Issues openIssue(int issue_id,Connection conn) {
		
		Issues issue=new Issues();
		
		try {
			 
			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;

				Statement stmt = conn.createStatement();
				String sql = "select * from issue where issue_id=" + "'" + issue_id + "'";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);

				if (rs != null && rs.next()) {
					
					
						
						issue.setIssue_id(rs.getInt("issue_id"));
						issue.setIssue_name(rs.getString("issue_name"));
						issue.setDept_name(rs.getString("dept_name"));
						issue.setIssue_desc(rs.getString("issue_desc"));
						issue.setIssue_date(rs.getDate("issue_date"));
						issue.setIssue_status(rs.getString("issue_status"));
						issue.setIssue_image(rs.getString("issue_image"));
						
			        }  
					
				}
					
			}
			
	    catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(issues.size());
		return issue;
		
	}*/
	
	public void forwardIssue(int issue_id,String dept_type,Connection conn)
	{
		
		try {
			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;
				int dept_id=0;
				Statement stmt = conn.createStatement();
				Statement stmt1 = conn.createStatement();
				String sql="select * from department where department=" + "'" + dept_type + "'";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				if(rs!=null && rs.next())
				{
					dept_id=rs.getInt("dept_id");
					System.out.println(dept_id);
				}
				String sql1 = "insert into tracking (issue_id,dept_id,status) values('" + issue_id + "','" + dept_id + "','" +"1"+"');";
				System.out.println(sql1);
				int result= stmt1.executeUpdate(sql1);
				}
					
			}
			
	    catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
