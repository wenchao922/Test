package com.st275.user.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import com.st275.common.BaseDAO;

public class UserDAO extends BaseDAO{
	
	/**
	 * ���û�������˺ź����������֤, �鿴�����ݿ����Ƿ����
	 * @param userName	�û�������˺���
	 * @param pwd		�û����������
	 * @return			������֤���, ���Ϊtrue��ʾ��֤ͨ��, false��ʾ��֤ʧ��
	 */
	public boolean validateUser(String userName, String pwd){
		boolean flag = false;		//��֤����ı�ʾֵ(true��ʾ��֤ͨ��)
		String sql = "SELECT COUNT(*) FROM TBL_USER WHERE uName = ? AND uPass = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();	//ִ��sql, �õ���ѯ���
			
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
