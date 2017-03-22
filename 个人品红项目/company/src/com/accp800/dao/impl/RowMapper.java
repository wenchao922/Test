package com.accp800.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface RowMapper<T> {
	
	/**
	 * ��������е�һ������ӳ���Ϊһ������(ʵ����)
	 * @param rs �����
	 * @return ʵ�����
	 * @throws SQLException
	 */
	public T mapRow(ResultSet rs) throws SQLException;
}
