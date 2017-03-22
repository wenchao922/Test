package com.accp800.model;

import java.util.Date;

public class Message {
	// messageID,title,content,writer,writeDate,count

	private int messageId;
	private String title;
	private String content;
	private String writer;
	private Date writeDate;
	private long count;

	public Message() {
	}

	public Message(int messageId) {
		this.messageId = messageId;
	}

	public Message(String title, String content, String writer, Date writeDate,
			long count) {
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
		this.count = count;
	}

	public Message(int messageId, String title, String content, String writer,
			Date writeDate, long count) {
		this.messageId = messageId;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
		this.count = count;
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}
}
