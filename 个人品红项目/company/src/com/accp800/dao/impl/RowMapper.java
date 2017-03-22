package com.accp800.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface RowMapper<T> {
	
	/**
	 * 将结果集中的一行数据映射成为一个对象(实体类)
	 * @param rs 结果集
	 * @return 实体对象
	 * @throws SQLException
	 */
	public T mapRow(ResultSet rs) throws SQLException;
}
