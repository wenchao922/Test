package com.st275.reply.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.st275.common.BaseDAO;
import com.st275.common.Constant;
import com.st275.reply.IReplyDAO;
import com.st275.reply.entity.Reply;

public class ReplyDAO extends BaseDAO implements IReplyDAO {

	/**
	 * ɾ���ظ���Ϣ
	 * @param Reply	����ظ�ʵ����
	 * @return ����true��ʾɾ���ɹ�,����false��ʾɾ��ʧ��
	 */
	public boolean delete(Reply reply) {
		boolean flag = false;	//������ʶ
		String sql = "DELETE TBL_REPLY WHERE replyId=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(reply.getReplyId()));
			int i = pstmt.executeUpdate();	//ִ��sql
			
			if(i > 0) {
				flag = true;	// ɾ���ɹ�,��ʾ������Ϊtrue
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, null);
		}
		
		return flag;
	}

	/**
	 * ����ظ���Ϣ
	 * @param Reply	����ظ�ʵ����
	 * @return ����true��ʾ����ɹ�,����false��ʾ����ʧ��
	 */
	public boolean insert(Reply reply) {
		boolean flag = false;	//������ʶ
		String sql = "INSERT INTO TBL_REPLY VALUES(?,?,getdate(),getdate(),?,?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reply.getTitle());
			pstmt.setString(2, reply.getContent());
			pstmt.setInt(3, Integer.parseInt(reply.getUId()));
			pstmt.setInt(4, Integer.parseInt(reply.getTopicId()));
			int i = pstmt.executeUpdate();	//ִ��sql, �õ���ѯ���
			
			if(i > 0) {
				flag = true;	// ����ɹ�,��ʾ������Ϊtrue
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, null);
		}
		
		return flag;
	}

	/**
	 * 
	 * @param reply
	 * @param currentPage
	 * @return
	 */
	public ArrayList query(Reply reply, int currentPage) {
		ArrayList list = new ArrayList();
		
		//��ҳ��SQL
		String sql = " SELECT TOP " + Constant.COUNT_PER_PAGE + " TBL_REPLY.*, TBL_USER.uName,TBL_USER.head,TBL_USER.regTime FROM TBL_REPLY" 
				   + " LEFT OUTER JOIN TBL_USER"
				   + " ON TBL_REPLY.uId = TBL_USER.uId" 
				   + " WHERE topicId = " + reply.getTopicId()
				   + " AND replyId not in(SELECT TOP " + Constant.COUNT_PER_PAGE * (currentPage-1) + " replyId FROM TBL_TOPIC WHERE topicId = " + reply.getTopicId() + ")";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// ���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql); // ִ��sql, �õ���ѯ���
			SimpleDateFormat format = new SimpleDateFormat("yyyy��MM��dd��");
			while (rs.next()) {
				Reply tmpReply = new Reply();
				tmpReply.setReplyId(rs.getString("replyId"));
				tmpReply.setContent(rs.getString("content"));
				Date publishDate = rs.getDate("publishTime");
				tmpReply.setModifyTime(rs.getString("modifyTime"));
				tmpReply.setPublishTime(format.format(publishDate));
				tmpReply.setTitle(rs.getString("title"));
				tmpReply.setTopicId(rs.getString("topicId"));
				tmpReply.setUId(rs.getString("uId"));
				tmpReply.setUName(rs.getString("uName"));
				tmpReply.setHead(rs.getString("head"));
				tmpReply.setRegTime(format.format(rs.getDate("regTime")));
				list.add(tmpReply);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, stmt, rs);
		}

		return list;
	}

	/**
	 * �޸Ļظ���Ϣ
	 * @param Reply	����ظ�ʵ����
	 * @return ����true��ʾ�޸ĳɹ�,����false��ʾ�޸�ʧ��
	 */
	public boolean update(Reply reply) {
		boolean flag = false;	//������ʶ
		String sql = "UPDATE TBL_TOPIC SET title=?,[content]=?,modifyTime=getdate(),uId=? WHERE replyId=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reply.getTitle());
			pstmt.setString(2, reply.getContent());
			pstmt.setInt(3, Integer.parseInt(reply.getUId()));
			pstmt.setInt(4, Integer.parseInt(reply.getReplyId()));
			int i = pstmt.executeUpdate();	//ִ��sql, �õ���ѯ���
			
			if(i > 0) {
				flag = true;	// �޸ĳɹ�,��ʾ������Ϊtrue
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, null);
		}
		
		return flag;
	}

	public ArrayList query(Reply reply) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
