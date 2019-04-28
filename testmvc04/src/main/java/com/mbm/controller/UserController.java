package com.mbm.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbm.domian.User;
import com.mbm.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	//表单操作
	@RequestMapping(value="/Register")
	public String Register() {
		return "Register";
	}
	
	@RequestMapping("/Find_user")
	public String findUser() {
		return "UserList";
	}
	
	@RequestMapping("/findByname")
	public String findByname(@RequestParam("username")String username,Model model) {
		List<User>list = new ArrayList<User>();
		list = userService.FindUserByName(username);
		model.addAttribute("user", list);
		return "UserList";
	}
	
	@RequestMapping("/AddUserRegister")
	public String saveUser(User user) {
		userService.saveUser(user);
		return "UserList";
	}
	
	//ajax操作
	
	@RequestMapping("/Find")
	public String fin() {
		return "FindUser";
	}
	//查找
	@ResponseBody
	@RequestMapping("/finUserByname")
	public List<User> finUserByname(@RequestParam("username")String username) {
		List<User>list = new ArrayList<User>();
		System.out.println("finUserByname");
		list = userService.FindUserByName(username);
		return list;
	}
	//删除
	@ResponseBody
	@RequestMapping("/delete")
	public  String  deleteUser(@RequestParam Integer id) {
		if(userService.deleteUser(id)==1) {
			return "1";
		}
		else {
			return "0";
		}
		
	}
	
	@RequestMapping("/GetUserById")
	@ResponseBody
	public User GetUserById(@RequestParam Integer id) {
		return userService.findUser(id);
	}
	
	@RequestMapping(value = "/updateUserById/{id}",method = RequestMethod.PUT)
	@ResponseBody
	public User updateUserById(User user) {
		userService.UpdateUser(user);
		System.out.println(user.getAge());
		return user;
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public User add(User user) {
		System.out.println("添加成功");
		userService.saveUser(user);
		return user;
	}

}
