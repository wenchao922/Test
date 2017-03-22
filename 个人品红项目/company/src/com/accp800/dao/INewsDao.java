package com.accp800.dao;

import java.sql.SQLException;
import java.util.List;

import com.accp800.model.News;

public interface INewsDao {
	int PAGE_SIZE=7;
	public boolean addNews(News news)throws SQLException;
	public boolean updateNewsById(News n)throws SQLException;
	public boolean deleteNewsById(int newsId)throws SQLException;
	public News findNewsById(int newsId)throws SQLException;
	public List<News> findNews()throws SQLException;
	public List<News> findNewsByPage(int page)throws SQLException;
	public int totalNews()throws SQLException;
}