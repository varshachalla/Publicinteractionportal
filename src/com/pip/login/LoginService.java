package com.pip.login;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class LoginService {

	public boolean isAdmin(String name, String password, Admin admin,Connection conn) {
		try {

			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;

				Statement stmt = conn.createStatement();
				String sql = "select * from registration where username='" + name + "' and pword='" + password + "' and type='admin'" ;
				System.out.println(sql);
				rs = stmt.executeQuery(sql);

				if (rs != null && rs.next()) {
					admin.setId(rs.getInt("id"));
					return true;

				}

			}

		} catch (SQLException e) {
			// log(e.getMessage(), e);
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean isDeptHead(String name, String password, Admin admin,Connection conn) {
		try {

			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;

				Statement stmt = conn.createStatement();
				String sql = "select * from registration where username='" + name + "' and pword='" + password + "' and type='department'" ;
				System.out.println(sql);
				rs = stmt.executeQuery(sql);

				if (rs != null && rs.next()) {
					admin.setId(rs.getInt("id"));
					System.out.println("true");
					return true;

				}

			}

		} catch (SQLException e) {
			// log(e.getMessage(), e);
			e.printStackTrace();
		}
		System.out.println("false");
		return false;
	}
	
	public String getDeptName(String name, String password, Admin admin,Connection conn) {
		String dept_name="";
		int dept_id;
		try {

			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;

				Statement stmt = conn.createStatement();
				String sql = "select dept_id from registration where username='" + name + "' and pword='" + password + "' and type='department'" ;
				System.out.println(sql);
				rs = stmt.executeQuery(sql);

				if (rs != null && rs.next()) {
					dept_id=rs.getInt("dept_id");
					Statement stmt1 = conn.createStatement();
					ResultSet rs1 = null;
					String sql1 = "select * from department where dept_id='" + dept_id + "'" ;
					rs1 = stmt1.executeQuery(sql1);
					if (rs1 != null && rs1.next()) {
						dept_name= rs1.getString("department");
					}
					return dept_name;

				}

			}

		} catch (SQLException e) {
			// log(e.getMessage(), e);
			e.printStackTrace();
		}
		return null;
	}

}
