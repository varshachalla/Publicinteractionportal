package com.pip.logcomplain;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LogComplaintService {
	void complain(String issue_name,String issue_desc,String issue_image,Connection conn)
	{
		try{
	    if (conn != null && !conn.isClosed()) {
		ResultSet rs = null;
		Statement stmt = conn.createStatement();

		
		String insertSql = "insert into issue(issue_name,issue_desc,issue_image) values('" + issue_name + "','" + issue_desc + "','" + issue_image + "');";
		stmt.executeUpdate(insertSql);
		}
	    else
		{
		System.out.println("error");
		}
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
