package com.accp800.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.accp800.dao.IUserDao;
import com.accp800.model.User;

public class UserDao extends BasicDao<User> implements RowMapper<User>, IUserDao {

	public boolean addUser(User user) throws SQLException {
		return executeUpdate("insert into users values(?,?,?)",user.getUName(),user.getPwd(),user.getStatus())==1;
	}

	public boolean deleteUser(int userId) throws SQLException {
		return executeUpdate("delete users where userId=?",userId)>=1;
	}

	public List<User> findUser() throws SQLException {
		return find("select * from users",this);
	}

	public User findUserById(int userId) throws SQLException {
		return (find("select * from users where userID=?",this,userId)).get(0);
	}
	
	public boolean updateUser(User u) throws SQLException {
		return executeUpdate("update users set userName=?,password=?,status=? where userId=?",u.getUName(),u.getPwd(),u.getStatus(),u.getUserId())==1;
	}
	
	public User mapRow(ResultSet rs) throws SQLException {
		return new User(rs.getInt("userID"),rs.getString("userName"),rs.getString("password"),rs.getInt("status"));
	}

	public User login(String uname,String upass) throws SQLException {
		String sql="select * from users where userName=? and password=?";
		return (find(sql,this,uname,upass)).get(0);
	}

	public User adminLogin(String uname, String upass) throws SQLException {
		String sql="select * from users where userName=? and password=? and status=1";
		return (find(sql,this,uname,upass)).get(0);
	}
}
