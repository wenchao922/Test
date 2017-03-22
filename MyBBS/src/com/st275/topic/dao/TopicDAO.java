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
	 * 通过版块编号查询得到我们论坛的帖子列表
	 * @return	返回查询帖子列表
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
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();	//执行sql, 得到查询结果
			
			while(rs.next()) {
				Topic topic = new Topic();
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
	 * 通过版块编号以及当前的页码查询得到我们论坛的帖子列表
	 * @param boardId		版块编号
	 * @param currentPage	当前显示的页面号
	 * @return				返回查询帖子列表
	 */
	public ArrayList getTopicListByBoardId(int boardId, int currentPage) {
		ArrayList list = new ArrayList();
		
		//分页的SQL
		String sql = " SELECT TOP " + Constant.COUNT_PER_PAGE + " TBL_TOPIC.*, TBL_USER.uName FROM TBL_TOPIC" 
				   + " LEFT OUTER JOIN TBL_USER"
				   + " ON TBL_TOPIC.uId = TBL_USER.uId" 
				   + " WHERE boardId = " + boardId 
				   + " AND topicId not in(SELECT TOP " + Constant.COUNT_PER_PAGE * (currentPage-1) + " topicId FROM TBL_TOPIC WHERE boardId = " + boardId + ")";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);	//执行sql, 得到查询结果
			
			while(rs.next()) {
				Topic topic = new Topic();
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
	 * 根据版块ID,得到该版块ID下的总页数
	 * @param boardId
	 * @return
	 */
	public int getPageCountByBoardId(int boardId) {
		int pageCount = 0;	//总页数
		
		//分页的SQL
		String sql = "SELECT CEILING(CONVERT(FLOAT, COUNT(*)) / "+Constant.COUNT_PER_PAGE+") FROM TBL_TOPIC WHERE boardId = "+boardId;		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);	//执行sql, 得到查询结果
			
			if(rs.next()) {
				pageCount = rs.getInt(1);	//得到总页数
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
	 * 通过帖子的编号,查询出该帖子下的回复总数
	 * @param topicId	版块编号
	 * @return	返回帖子回复数目
	 */
	public int getReplyAmtByTopicId(int topicId) {
		
		int replayCount = 0;
		String sql = "SELECT COUNT(*) FROM dbo.TBL_REPLY WHERE topicId = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, topicId);
			rs = pstmt.executeQuery();	//执行sql, 得到查询结果
			
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
		boolean flag = false;	//操作标识
		String sql = "INSERT INTO TBL_TOPIC VALUES(?,?,getdate(),getdate(),?,?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, topic.getTitle());
			pstmt.setString(2, topic.getContent());
			pstmt.setInt(3, Integer.parseInt(topic.getUId()));
			pstmt.setInt(4, Integer.parseInt(topic.getBoardId()));
			int i = pstmt.executeUpdate();	//执行sql, 得到查询结果
			
			if(i > 0) {
				flag = true;	// 插入成功,标示符设置为true
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
			//调用父类getConnection方法,获得数据库连接对象
			con = this.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(topic.getTopicId()));
			rs = pstmt.executeQuery();	//执行sql, 得到查询结果
			SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
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
