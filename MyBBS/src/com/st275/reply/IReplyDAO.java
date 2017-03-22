package com.st275.reply;

import java.util.ArrayList;

import com.st275.reply.entity.Reply;

public interface IReplyDAO {

	public boolean insert(Reply reply);
	
	public boolean update(Reply reply);
	
	public boolean delete(Reply reply);
	
	public ArrayList query(Reply reply);
	
}
