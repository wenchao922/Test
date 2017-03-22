package com.accp800.model;

import java.util.Date;

public class Revert {
	// revertID,messageID,content,writer,writeDate

	private int revertId;
	private Message message;
	private String content;
	private String writer;
	private Date writeDate;

	public Revert() {
	}

	public Revert(Message message, String content, String writer, Date writeDate) {
		this.message = message;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
	}

	public Revert(int revertId, Message message, String content, String writer,
			Date writeDate) {
		this.revertId = revertId;
		this.message = message;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
	}

	public int getRevertId() {
		return revertId;
	}

	public void setRevertId(int revertId) {
		this.revertId = revertId;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
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

}
