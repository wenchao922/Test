package com.accp800.model;

import java.util.Date;

public class News {
	// newsID,title,content,writerDate

	private int newsId;
	private String title;
	private String content;
	private Date writerDate;

	public News() {
	}

	public News(String title, String content, Date writerDate) {
		this.title = title;
		this.content = content;
		this.writerDate = writerDate;
	}

	public News(int newsId, String title, String content, Date writerDate) {
		this.newsId = newsId;
		this.title = title;
		this.content = content;
		this.writerDate = writerDate;
	}

	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriterDate() {
		return writerDate;
	}

	public void setWriterDate(Date writerDate) {
		this.writerDate = writerDate;
	}
}
