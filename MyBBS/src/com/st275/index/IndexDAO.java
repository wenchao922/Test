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
	 * 通过父级编号查询得到我们论坛的版块列表
	 * @return	返回查询列表
	 */
	public ArrayList getBoardListByParentId(int parentId) {
		ArrayList list = new ArrayList();
		String sql = "SELECT * FROM dbo.TBL_BOARD WHERE parentId = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, parentId);
			rs = pstmt.executeQuery();	//执行sql, 得到查询结果
			
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
	 * 通过版块的编号,查询出该版块下主题的总数
	 * @param boardId	版块编号
	 * @return	返回主题数目
	 */
	public int getTopicAmtByBoardId(int boardId) {
		int topicCount = 0;
		String sql = "SELECT COUNT(*) FROM dbo.TBL_TOPIC WHERE boardId = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();	//执行sql, 得到查询结果
			
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
	 * 通过版块的编号,查询出该版块下最新的主题信息
	 * @param boardId	版块编号
	 * @return	返回最新主题信息
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
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();	//执行sql, 得到查询结果
			
			if(rs.next()) {
				topic.setBoardId(rs.getString("boardId"));
				topic.setContent(rs.getString("content"));
				Date publishDate = rs.getDate("publishTime");
				SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
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
