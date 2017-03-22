package com.st275.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;

public class BaseDAO {
	//数据库连接的驱动
	public final static String DB_DRIVER = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
	//数据库的连接字符串
	public final static String CON_URL = "jdbc:sqlserver://localhost:1433;DataBaseName=bbs";
	//数据库的连接用户名
	public final static String USER_NAME = "sa";
	//数据库的连接密码
	public final static String USER_PWD = "1111";
	
	private Logger log = Logger.getLogger(BaseDAO.class.getName());
	
	public Connection getConnection(){
		Connection con = null;
		
		try {
			Class.forName(DB_DRIVER);
			con = DriverManager.getConnection(CON_URL, USER_NAME, USER_PWD);
			log.debug("创建数据库连接成功");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			log.error("数据库驱动加载失败");
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("数据库连接对象创建失败!");
		}
		
		return con;
	}
	
	/**
	 * 释放资源
	 * @param con
	 * @param stmt
	 * @param rs
	 */
	public void close(Connection con, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(con != null && !con.isClosed()) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("释放数据库资源出错!");
		}
	}
	
	/**
	 * 执行一条SQL, 并返回执行的结果
	 * @param sql	将被执行的SQL语句
	 * @return		true表示操作成功,否则操作失败
	 */
	public boolean executeSQL(String sql) {
		boolean flag = false;
		
		Connection con = null;
		Statement stmt = null;
		
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			stmt = con.createStatement();

			int i = stmt.executeUpdate(sql);	//执行sql, 得到SQL执行所影响的行数
			
			if(i > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("对数据库进行修改时,发生错误!");
		} finally {
			this.close(con, stmt, null);
		}
		
		return flag;
	}
	
	/**
	 * 不分页主要实现方法，返回一个ArrayList[Hashtable[i]]
	 * 每行记录是Al[i]，也就是一个hash，hash存放的是一行记录的所有列（包括列名和值），
	 * 注意Hashtable是严格区分大小写的
	 * @param [sql]:执行查询的Sql语句，如：select.......
	 * @throws SQLException 
	 * @return 调用此方法返回当前页的记录列表 的Al
	 */
	public ArrayList getAlHtList(String sql) throws SQLException {

		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		ArrayList al = new ArrayList();

		try {
			con = this.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			
			int cols = rsmd.getColumnCount();
			
			while (rs.next()) {
				HashMap hash = new HashMap();
				for (int i = 1; i <= cols; i++) {
					String field = rsmd.getColumnName(i);
					String value = rs.getString(i);
					if (value == null || value == "" || value.equals("")
							|| value == "null" || value.equals("null")||
						value == " ");
					hash.put(field, value);
				}
				al.add(hash);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error("读取列表数据出错!");
		} finally {
			this.close(con, stmt, rs);
		}

		return al;

	}	
}
