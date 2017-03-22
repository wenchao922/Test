package com.accp800.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.accp800.dao.INewsDao;
import com.accp800.model.News;

public class NewsDao extends BasicDao<News> implements INewsDao,
		RowMapper<News> {

	public boolean addNews(News news) throws SQLException {
		return executeUpdate("insert into News values(?,?,?)", news.getTitle(),
				news.getContent(), news.getWriterDate()) == 1;
	}

	public boolean deleteNewsById(int newsId) throws SQLException {
		return executeUpdate("delete news where newsID=?", newsId) == 1;
	}

	public List<News> findNews() throws SQLException {
		return find("select * from news order by writerDate desc", this);
	}

	public News findNewsById(int newsId) throws SQLException {
		return (find("select * from news where newsID=?", this, newsId)).get(0);
	}

	public boolean updateNewsById(News n) throws SQLException {
		return executeUpdate(
				"update news set title=?,content=?,writerDate=? where newsID=?",
				n.getTitle(), n.getContent(), n.getWriterDate(), n.getNewsId()) == 1;
	}

	public News mapRow(ResultSet rs) throws SQLException {
		return new News(rs.getInt("newsID"), rs.getString("title"), rs
				.getString("content"), rs.getTimestamp("writerDate"));
	}

	public List<News> findNewsByPage(int page) throws SQLException {
		return find("select top " + PAGE_SIZE + " * from news where newsID not in (select top " +(PAGE_SIZE*(page-1))+" newsID from news order by writerDate desc) order by writerDate desc", this);
	}

	public int totalNews() throws SQLException {
		return countRows("select count(*) from news");
	}
}
