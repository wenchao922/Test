package com.st275.user.reg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.st275.common.BaseDAO;
import com.st275.user.entity.User;

public class RegisterDAO extends BaseDAO {
	
	/**
	 * 判定所注册的账号名在数据库中是否存在
	 * @param uName		待判定的账号名
	 * @return			true表示账号名存在,不能再被用于注册.
	 */
	public boolean isExistAccount(String uName){
		boolean flag = false;		//验证结果的标示值(true表示验证通过)
		String sql = "SELECT * FROM TBL_USER WHERE uName = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uName);
			rs = pstmt.executeQuery();	//执行sql, 得到查询结果
			
			if(rs.next()){
				flag = true;	//用户名存在, flag设置为true
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return flag;		
	}
	
	
	public boolean insert(User user){
		boolean flag = false;		//验证结果的标示值(true表示验证通过)
		String sql = "INSERT INTO TBL_USER VALUES(?,?,?,getDate(),?)";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUName());
			pstmt.setString(2, user.getUPass());
			pstmt.setString(3, user.getHead());
			pstmt.setInt(4, Integer.parseInt(user.getGender()));

			int i = pstmt.executeUpdate();	//执行sql, 将用户的账号插入到数据库中
			
			if(i > 0){
				flag = true;	//添加新帐号成功
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, null);
		}
		
		return flag;		
	}
	
}
