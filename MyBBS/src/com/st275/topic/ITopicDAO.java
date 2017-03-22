package com.st275.topic;

import java.util.ArrayList;

import com.st275.topic.entity.Topic;

public interface ITopicDAO {
	
	public boolean insert(Topic topic);
	
	public boolean update(Topic topic);
	
	public boolean delete(Topic topic);
	
	public ArrayList query(Topic topic);
	
}
