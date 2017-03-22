package com.st275.user.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import com.st275.common.BaseDAO;

public class UserDAO extends BaseDAO{
	
	/**
	 * 对用户输入的账号和密码进行验证, 查看在数据库中是否存在
	 * @param userName	用户输入的账号名
	 * @param pwd		用户输入的密码
	 * @return			返回验证结果, 如果为true表示验证通过, false表示验证失败
	 */
	public boolean validateUser(String userName, String pwd){
		boolean flag = false;		//验证结果的标示值(true表示验证通过)
		String sql = "SELECT COUNT(*) FROM TBL_USER WHERE uName = ? AND uPass = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();	//执行sql, 得到查询结果
			
			if(rs.next()) {
				int i = rs.getInt(1);
				if(i > 0) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return flag;
	}
	
}
