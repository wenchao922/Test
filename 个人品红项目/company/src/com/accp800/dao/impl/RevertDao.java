package com.accp800.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.accp800.dao.IRevertDao;
import com.accp800.model.Message;
import com.accp800.model.Revert;

public class RevertDao extends BasicDao<Revert> implements RowMapper<Revert>,
		IRevertDao {
	public boolean addRevert(Revert r) throws SQLException {
		return executeUpdate("insert into revert values(?,?,?,?)", r.getMessage()
				.getMessageId(), r.getContent(), r.getWriter(), r
				.getWriteDate()) == 1;
	}

	public boolean deleteRevert(int revertId) throws SQLException {
		return executeUpdate("delete revert where revertID=?", revertId) == 1;
	}

	public List<Revert> findRevert() throws SQLException {
		return find("select * from revert", this);
	}

	public Revert findRevertById(int revertId) throws SQLException {
		return (find("select * from revert where revertID=?", this, revertId))
				.get(0);
	}

	public boolean updateRevertById(Revert r) throws SQLException {
		return executeUpdate(
				"update revert set messageId=?,content=?,writer=?,writeDate where revertID=?",
				this, r.getMessage().getMessageId(), r.getContent(), r
						.getWriter(), r.getWriteDate(), r.getRevertId()) == 1;
	}

	public Revert mapRow(ResultSet rs) throws SQLException {
		return new Revert(rs.getInt("revertID"), new Message(rs
				.getInt("messageId")), rs.getString("content"), rs
				.getString("writer"), rs.getTimestamp("writeDate"));
	}
	
	public List<Revert> getRevertsByMessageId(int messageId)
			throws SQLException {
		String sql="select * from Revert where messageId=?";
		return find(sql,this,messageId);
	}

	public List<Revert> findRevertsByPage(int messageId,int page) throws SQLException {
		String sql="select top " +PAGE_SIZE+" * from Revert where revertID not in (select top " +(PAGE_SIZE*(page-1)) +" revertID from Revert where messageId=? order by writeDate desc) and messageId=? order by writeDate desc";
		return find(sql,this,messageId,messageId);
	}
}
