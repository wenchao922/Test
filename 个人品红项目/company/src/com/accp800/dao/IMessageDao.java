package com.accp800.dao;

import java.sql.SQLException;
import java.util.List;

import com.accp800.model.Message;
import com.accp800.model.Revert;

public interface IMessageDao {
	int PAGE_SIZE=15;	
	public List<Message> getMessages()throws SQLException;
	public Message findMessageById(int messageId)throws SQLException;
	public boolean addMessage(Message m)throws SQLException;
	public boolean updateMessageById(Message m)throws SQLException;
	public boolean deleteMessageById(int messageId)throws SQLException;
	public int totalMessages()throws SQLException;
	public List<Message> getmessageByPage(int page)throws SQLException;
}
