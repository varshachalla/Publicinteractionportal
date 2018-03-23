package com.pip.department;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pip.logcomplain.Issues;

public class DepartmentService {

private static List<Issues> issues = new ArrayList<Issues>();
	
	public List<Issues> retrieveInbox(String dept_type, Connection conn) {
		issues.clear();
		try {
			 
			if (conn != null && !conn.isClosed()) {
				int dept_id=0;
				ResultSet rs = null;
				ResultSet rs1 = null;
				Statement stmt = conn.createStatement();
				Statement stmt1 = conn.createStatement();
				String sql="select * from department where department=" + "'" + dept_type + "'";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				if(rs!=null && rs.next())
				{
					dept_id=rs.getInt("dept_id");
				}
				String sql1 = "select * from issue where issue_id in (select issue_id from tracking where dept_id= " + "'" + dept_id + "') order by issue_date desc";
				System.out.println(sql);
				rs1 = stmt1.executeQuery(sql1);

				if (rs1 != null) {
					
					while (rs1.next()) {
						Issues issue=new Issues();
						issue.setIssue_id(rs1.getInt("issue_id"));
						issue.setIssue_name(rs1.getString("issue_name"));
						issue.setIssue_desc(rs1.getString("issue_desc"));
						issue.setIssue_date(rs1.getDate("issue_date"));
						issue.setIssue_image(rs1.getString("issue_image"));
						
						ResultSet rs2 = null;
						Statement stmt2 = conn.createStatement();
						String sql2="select * from status where status_id=(select status from tracking where issue_id=" + "'" + issue.getIssue_id() + "')";
						rs2 = stmt2.executeQuery(sql2);
						if(rs2!=null && rs2.next())
						{

							issue.setIssue_status_name(rs2.getString("status"));
							System.out.println(issue.getIssue_status_name());
						}
						if(issue.getIssue_status_name().equals("deleted"))
							continue;
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

	
	public void changeIssueStatus(int issue_id,String status,Connection conn)
	{
		
		try {
			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;
				int status_id=-1;
				Statement stmt = conn.createStatement();
				Statement stmt1 = conn.createStatement();
				String sql="select * from status where status=" + "'" + status + "'";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				if(rs!=null && rs.next())
				{
					status_id=rs.getInt("status_id");
				}
				String sql1 = "update tracking set status=" + "'" + status_id + "'" + "where issue_id = " + "'" + issue_id + "'";
				System.out.println(sql1);
				int result= stmt1.executeUpdate(sql1);
				
				}
					
			}
			
	    catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
