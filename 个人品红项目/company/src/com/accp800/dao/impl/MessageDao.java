package com.accp800.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.accp800.dao.IMessageDao;
import com.accp800.model.Message;
import com.accp800.model.Revert;

public class MessageDao extends BasicDao<Message> implements IMessageDao, RowMapper<Message> {

	public boolean addMessage(Message m) throws SQLException {
		return executeUpdate("insert into Message values(?,?,?,?,?)",m.getTitle(),m.getContent(),m.getWriter(),m.getWriteDate(),m.getCount())==1;
	}

	public boolean deleteMessageById(int messageId) throws SQLException {
		return executeUpdate("delete Message where messageID=?",messageId)==1;
	}

	public Message findMessageById(int messageId) throws SQLException {
		List<Message> m=find("select * from Message where messageID=?",this,messageId);
		return m.get(0);
	}

	public List<Message> getMessages() throws SQLException {
		return find("select * from Message",this);
	}

	public boolean updateMessageById(Message m) throws SQLException {
		return executeUpdate("update Message set title=?,content=?,writer=?,writeDate=?,count=? where messageID=?",m.getTitle(),m.getContent(),m.getWriter(),m.getWriteDate(),m.getCount(),m.getMessageId())==1;
	}
	
	public Message mapRow(ResultSet rs) throws SQLException {
		return new Message(rs.getInt("messageID"),rs.getString("title"),rs.getString("content"),rs.getString("writer"),rs.getTimestamp("writeDate"),rs.getInt("count"));
	}

	public int totalMessages() throws SQLException {
		return countRows("select count(*) from message");
	}

	public List<Message> getmessageByPage(int page) throws SQLException {
		String sql="select top "+PAGE_SIZE+" * from Message where messageID not in (select top " +(PAGE_SIZE*(page-1))+ " messageID from Message)";
		return find(sql,this);
	}
}
