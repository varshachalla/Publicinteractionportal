package com.pip.registration;

import java.io.InputStream;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RegistrationService {

	public boolean isUserRegistered(String user,String password, String email, int dept_id,String dept_auth_id, String area, Connection conn) {
		boolean usernameExists=true;
		try {

			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null,rs1=null;

				Statement stmt = conn.createStatement();
				String sql = "select * from registration where username='" + user + "'";
			//	String sql1 = "select * from registration where email='" + email + "'";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				//rs1= stmt.executeQuery(sql1);
				if(rs.next()) {
					System.out.println("aaa");
				  usernameExists = true;
				}
				
				else
				{
					
					System.out.println("sss");
					String insertSql = "insert into registration (username,pword,type,dept_id,area,dept_auth_id,email) values('" + user + "','" + password + "','" +"department"+"','"+ dept_id+ "','"+ area +"','"+ dept_auth_id + "','"+ email + "');";
					System.out.println(insertSql);
					stmt.executeUpdate(insertSql);
					usernameExists=false;
					return usernameExists;
				}

			}
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usernameExists;
		
	}

}
