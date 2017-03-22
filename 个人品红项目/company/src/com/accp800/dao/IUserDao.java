package com.accp800.dao;

import java.sql.SQLException;
import java.util.List;

import com.accp800.model.User;

public interface IUserDao {
	public boolean addUser(User user)throws SQLException;
	public boolean updateUser(User u)throws SQLException;
	public boolean deleteUser(int userId)throws SQLException;
	public User findUserById(int userId)throws SQLException;
	public List<User> findUser()throws SQLException;
	public User login(String uname,String upass)throws SQLException;
	public User adminLogin(String uname,String upass)throws SQLException;
}
