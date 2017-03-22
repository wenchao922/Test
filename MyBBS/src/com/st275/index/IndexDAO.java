package com.st275.index;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.st275.board.entity.Board;
import com.st275.common.BaseDAO;
import com.st275.topic.entity.Topic;

public class IndexDAO extends BaseDAO {

	/**
	 * ͨ��������Ų�ѯ�õ�������̳�İ���б�
	 * @return	���ز�ѯ�б�
	 */
	public ArrayList getBoardListByParentId(int parentId) {
		ArrayList list = new ArrayList();
		String sql = "SELECT * FROM dbo.TBL_BOARD WHERE parentId = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, parentId);
			rs = pstmt.executeQuery();	//ִ��sql, �õ���ѯ���
			
			while(rs.next()) {
				Board board = new Board();
				board.setBoardId(rs.getString("boardId"));
				board.setBoardName(rs.getString("boardName"));
				board.setParentId(rs.getString("parentId"));
				list.add(board);
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
	 * ͨ�����ı��,��ѯ���ð�������������
	 * @param boardId	�����
	 * @return	����������Ŀ
	 */
	public int getTopicAmtByBoardId(int boardId) {
		int topicCount = 0;
		String sql = "SELECT COUNT(*) FROM dbo.TBL_TOPIC WHERE boardId = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();	//ִ��sql, �õ���ѯ���
			
			if(rs.next()) {
				topicCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return topicCount;
	}
	
	/**
	 * ͨ�����ı��,��ѯ���ð�������µ�������Ϣ
	 * @param boardId	�����
	 * @return	��������������Ϣ
	 */
	public Topic getLastedTopicByBoardId(int boardId) {
		Topic topic = new Topic();
		String sql = " SELECT TOP 1 TBL_TOPIC.*,TBL_USER.uName  FROM TBL_TOPIC"
				   + " LEFT OUTER JOIN TBL_USER"
				   + " ON TBL_TOPIC.uId = TBL_USER.uId"
				   + " WHERE boardId = ? ORDER BY publishTime DESC";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//���ø���getConnection����,������ݿ����Ӷ���
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();	//ִ��sql, �õ���ѯ���
			
			if(rs.next()) {
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
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return topic;
	}		
	
}
