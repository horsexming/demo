package com.mbm.dao;

import com.mbm.domian.Role;
import com.mbm.domian.User;

public interface PayDao {
	public Role findroleByID(Integer id);
	public User findUser(int id);
	public User findroleByUsername(String username);

}
