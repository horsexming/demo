package com.mbm.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbm.dao.UserDao;
import com.mbm.domian.User;
@Service("userService")
public class UserService {
	
	@Autowired
	UserDao userDao;
	
	public List<User> FindUserByName(String username) {
		return userDao.FindUserByName(username);
	}
	
	public void saveUser(User user) {
		userDao.saveUser(user);
		System.out.println("save seccess");
	}

	public Integer deleteUser(int id) {
		userDao.deleteUser(id);
		System.out.println("删除成功");
		return 1;
	}
	
	public User findUser(int id) {
		System.out.println("更新回显");
		return userDao.findUser(id);
	}
	
	public void UpdateUser(User user) {
		userDao.UpdateUser(user);
	}
}
