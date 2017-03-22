package com.st275.user.reg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.st275.common.BaseDAO;
import com.st275.user.entity.User;

public class RegisterDAO extends BaseDAO {
	
	/**
	 * �ж���ע����˺��������ݿ����Ƿ����
	 * @param uName		���ж����˺���
	 * @return			true��ʾ�˺�������,�����ٱ�����ע��.
	 */
	public boolean isExistAccount(String uName){
		boolean flag = false;		//��֤����ı�ʾֵ(true��ʾ��֤ͨ��)
		String sql = "SELECT * FROM TBL_USER WHERE uName = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uName);
			rs = pstmt.executeQuery();	//ִ��sql, �õ���ѯ���
			
			if(rs.next()){
				flag = true;	//�û�������, flag����Ϊtrue
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return flag;		
	}
	
	
	public boolean insert(User user){
		boolean flag = false;		//��֤����ı�ʾֵ(true��ʾ��֤ͨ��)
		String sql = "INSERT INTO TBL_USER VALUES(?,?,?,getDate(),?)";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUName());
			pstmt.setString(2, user.getUPass());
			pstmt.setString(3, user.getHead());
			pstmt.setInt(4, Integer.parseInt(user.getGender()));

			int i = pstmt.executeUpdate();	//ִ��sql, ���û����˺Ų��뵽���ݿ���
			
			if(i > 0){
				flag = true;	//������ʺųɹ�
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, null);
		}
		
		return flag;		
	}
	
}
