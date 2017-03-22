package com.accp800.dao;

import java.sql.SQLException;
import java.util.List;

import com.accp800.model.Revert;

public interface IRevertDao {
	int PAGE_SIZE=10;
	public boolean addRevert(Revert revert)throws SQLException;
	public boolean updateRevertById(Revert r)throws SQLException;
	public boolean deleteRevert(int revertId)throws SQLException;
	public Revert findRevertById(int revertId)throws SQLException;
	public List<Revert> findRevert()throws SQLException;
	public List<Revert> getRevertsByMessageId(int messageId)throws SQLException;
	public List<Revert> findRevertsByPage(int messageId,int page)throws SQLException;
}
