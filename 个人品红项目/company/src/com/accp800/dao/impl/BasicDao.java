package com.accp800.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public abstract class BasicDao<T> {

	public Connection getConnection() throws SQLException {
		DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		return conn;
	}
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(ps != null) ps.close();
		if(conn != null) conn.close();
	}
	
	public int executeUpdate(String sql, Object... args) throws SQLException {
		try {
			getConnection();
			setParameters(sql, args);
			
			return ps.executeUpdate();
			
		} finally {
			close();
		}
		
	}

	private void setParameters(String sql, Object... args) throws SQLException {
		ps = conn.prepareStatement(sql);
		
		for(int i = 0; i < args.length; i++) {
			if(args[i] instanceof String) {
				ps.setString(i + 1, (String) args[i]);
			} else if(args[i] instanceof Integer) {
				ps.setInt(i + 1, (Integer) args[i]);
			} else if(args[i] instanceof Double) {
				ps.setDouble(i + 1, (Double) args[i]);
			} else if(args[i] instanceof Timestamp) {
				ps.setTimestamp(i + 1, (Timestamp) args[i]);
			} else {
				ps.setObject(i + 1, args[i]);
			}
		}
	}
	
	public ResultSet executeQuery(String sql, Object... args) throws SQLException {
		setParameters(sql, args);
		return rs = ps.executeQuery();
	}
	
	public List<T> find(String sql, RowMapper<T> rowMapper, Object... args) throws SQLException {
		ArrayList<T> list = new ArrayList<T>();
		try {
			getConnection();
			ResultSet rs = executeQuery(sql, args);
			while(rs.next()) {
				list.add(rowMapper.mapRow(rs));
			}
			
			return list;
		} finally {
			close();
		}
	}
	
	public int countRows(String sql, Object... args) throws SQLException {
		try {
			getConnection();
			ResultSet rs = executeQuery(sql, args);
			if(rs.next()) {
				return rs.getInt(1);
			}
			
			return 0;
		} finally {
			close();
		}
	}
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final String DATABASE_NAME = "company";
	public static final String USER = "sa";
	public static final String PASSWORD = "123";
	public static final String URL = "jdbc:sqlserver://localhost:1433;databasename=" + DATABASE_NAME;
}
