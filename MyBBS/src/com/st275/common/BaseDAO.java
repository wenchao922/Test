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
	//���ݿ����ӵ�����
	public final static String DB_DRIVER = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
	//���ݿ�������ַ���
	public final static String CON_URL = "jdbc:sqlserver://localhost:1433;DataBaseName=bbs";
	//���ݿ�������û���
	public final static String USER_NAME = "sa";
	//���ݿ����������
	public final static String USER_PWD = "1111";
	
	private Logger log = Logger.getLogger(BaseDAO.class.getName());
	
	public Connection getConnection(){
		Connection con = null;
		
		try {
			Class.forName(DB_DRIVER);
			con = DriverManager.getConnection(CON_URL, USER_NAME, USER_PWD);
			log.debug("�������ݿ����ӳɹ�");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			log.error("���ݿ���������ʧ��");
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("���ݿ����Ӷ��󴴽�ʧ��!");
		}
		
		return con;
	}
	
	/**
	 * �ͷ���Դ
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
			log.error("�ͷ����ݿ���Դ����!");
		}
	}
	
	/**
	 * ִ��һ��SQL, ������ִ�еĽ��
	 * @param sql	����ִ�е�SQL���
	 * @return		true��ʾ�����ɹ�,�������ʧ��
	 */
	public boolean executeSQL(String sql) {
		boolean flag = false;
		
		Connection con = null;
		Statement stmt = null;
		
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			stmt = con.createStatement();

			int i = stmt.executeUpdate(sql);	//ִ��sql, �õ�SQLִ����Ӱ�������
			
			if(i > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("�����ݿ�����޸�ʱ,��������!");
		} finally {
			this.close(con, stmt, null);
		}
		
		return flag;
	}
	
	/**
	 * ����ҳ��Ҫʵ�ַ���������һ��ArrayList[Hashtable[i]]
	 * ÿ�м�¼��Al[i]��Ҳ����һ��hash��hash��ŵ���һ�м�¼�������У�����������ֵ����
	 * ע��Hashtable���ϸ����ִ�Сд��
	 * @param [sql]:ִ�в�ѯ��Sql��䣬�磺select.......
	 * @throws SQLException 
	 * @return ���ô˷������ص�ǰҳ�ļ�¼�б� ��Al
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
			log.error("��ȡ�б����ݳ���!");
		} finally {
			this.close(con, stmt, rs);
		}

		return al;

	}	
}
