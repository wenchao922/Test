package com.st275.topic.dao;

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
import com.st275.topic.ITopicDAO;
import com.st275.topic.entity.Topic;

public class TopicDAO extends BaseDAO implements ITopicDAO {
	
	/**
	 * ͨ������Ų�ѯ�õ�������̳�������б�
	 * @return	���ز�ѯ�����б�
	 */
	public ArrayList getTopicListByBoardId(int boardId) {
		ArrayList list = new ArrayList();
		String sql = " SELECT TBL_TOPIC.*, TBL_USER.uName  FROM TBL_TOPIC" 
				   + " LEFT OUTER JOIN TBL_USER"
				   + " ON TBL_TOPIC.uId = TBL_USER.uId" 
				   + " WHERE boardId = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();	//ִ��sql, �õ���ѯ���
			
			while(rs.next()) {
				Topic topic = new Topic();
				topic.setBoardId(rs.getString("boardId"));
				topic.setContent(rs.getString("content"));
				Date publishDate = rs.getDate("publishTime");
				SimpleDateFormat format = new SimpleDateFormat("yyyy��MM��dd��");
				topic.setModifyTime(rs.getString("modifyTime"));
				topic.setPublishTime(format.format(publishDate));
				topic.setTitle(rs.getString("title"));
				topic.setTopicId(rs.getString("topicId"));
				topic.setUId(rs.getString("uId"));
				topic.setUName(rs.getString("uName"));
				list.add(topic);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return list;
	}
	
	/**
	 * ͨ��������Լ���ǰ��ҳ���ѯ�õ�������̳�������б�
	 * @param boardId		�����
	 * @param currentPage	��ǰ��ʾ��ҳ���
	 * @return				���ز�ѯ�����б�
	 */
	public ArrayList getTopicListByBoardId(int boardId, int currentPage) {
		ArrayList list = new ArrayList();
		
		//��ҳ��SQL
		String sql = " SELECT TOP " + Constant.COUNT_PER_PAGE + " TBL_TOPIC.*, TBL_USER.uName FROM TBL_TOPIC" 
				   + " LEFT OUTER JOIN TBL_USER"
				   + " ON TBL_TOPIC.uId = TBL_USER.uId" 
				   + " WHERE boardId = " + boardId 
				   + " AND topicId not in(SELECT TOP " + Constant.COUNT_PER_PAGE * (currentPage-1) + " topicId FROM TBL_TOPIC WHERE boardId = " + boardId + ")";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);	//ִ��sql, �õ���ѯ���
			
			while(rs.next()) {
				Topic topic = new Topic();
				topic.setBoardId(rs.getString("boardId"));
				topic.setContent(rs.getString("content"));
				Date publishDate = rs.getDate("publishTime");
				SimpleDateFormat format = new SimpleDateFormat("yyyy��MM��dd��");
				topic.setModifyTime(rs.getString("modifyTime"));
				topic.setPublishTime(format.format(publishDate));
				topic.setTitle(rs.getString("title"));
				topic.setTopicId(rs.getString("topicId"));
				topic.setUId(rs.getString("uId"));
				topic.setUName(rs.getString("uName"));
				list.add(topic);
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
	 * ���ݰ��ID,�õ��ð��ID�µ���ҳ��
	 * @param boardId
	 * @return
	 */
	public int getPageCountByBoardId(int boardId) {
		int pageCount = 0;	//��ҳ��
		
		//��ҳ��SQL
		String sql = "SELECT CEILING(CONVERT(FLOAT, COUNT(*)) / "+Constant.COUNT_PER_PAGE+") FROM TBL_TOPIC WHERE boardId = "+boardId;		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);	//ִ��sql, �õ���ѯ���
			
			if(rs.next()) {
				pageCount = rs.getInt(1);	//�õ���ҳ��
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, stmt, rs);
		}
		
		return pageCount;
	}	
	
	/**
	 * ͨ�����ӵı��,��ѯ���������µĻظ�����
	 * @param topicId	�����
	 * @return	�������ӻظ���Ŀ
	 */
	public int getReplyAmtByTopicId(int topicId) {
		
		int replayCount = 0;
		String sql = "SELECT COUNT(*) FROM dbo.TBL_REPLY WHERE topicId = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, topicId);
			rs = pstmt.executeQuery();	//ִ��sql, �õ���ѯ���
			
			if(rs.next()) {
				replayCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return replayCount;
	}

	public boolean delete(Topic topic) {
		// TODO Auto-generated method stub
		return false;
	}

	/**
	 * 
	 */
	public boolean insert(Topic topic) {
		boolean flag = false;	//������ʶ
		String sql = "INSERT INTO TBL_TOPIC VALUES(?,?,getdate(),getdate(),?,?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, topic.getTitle());
			pstmt.setString(2, topic.getContent());
			pstmt.setInt(3, Integer.parseInt(topic.getUId()));
			pstmt.setInt(4, Integer.parseInt(topic.getBoardId()));
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

	public ArrayList query(Topic topic) {
		ArrayList list = new ArrayList();
		
		String sql = " SELECT TBL_TOPIC.*, TBL_USER.uName,TBL_USER.head,TBL_USER.regTime FROM TBL_TOPIC" 
				   + " LEFT OUTER JOIN TBL_USER"
				   + " ON TBL_TOPIC.uId = TBL_USER.uId" 
				   + " WHERE topicId = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(topic.getTopicId()));
			rs = pstmt.executeQuery();	//ִ��sql, �õ���ѯ���
			SimpleDateFormat format = new SimpleDateFormat("yyyy��MM��dd��");
			if(rs.next()) {
				Topic tmpTopic = new Topic();
				tmpTopic.setBoardId(rs.getString("boardId"));
				tmpTopic.setContent(rs.getString("content"));
				Date publishDate = rs.getDate("publishTime");
				
				tmpTopic.setModifyTime(rs.getString("modifyTime"));
				tmpTopic.setPublishTime(format.format(publishDate));
				tmpTopic.setTitle(rs.getString("title"));
				tmpTopic.setTopicId(rs.getString("topicId"));
				tmpTopic.setUId(rs.getString("uId"));
				tmpTopic.setUName(rs.getString("uName"));
				tmpTopic.setHead(rs.getString("head"));
				tmpTopic.setRegTime(format.format(rs.getDate("regTime")));
				list.add(tmpTopic);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return list;
	}

	public boolean update(Topic topic) {
		// TODO Auto-generated method stub
		return false;
	}	
	
}
