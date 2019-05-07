package com.mbm.dao;

import java.util.List;

import com.mbm.domian.User;


public interface UserDao {
	public List<User> FindUserByName(String username);
	public void saveUser(User user);
	public Integer deleteUser(int id);
	public User findUser(int id);
	public void UpdateUser(User user);

}
