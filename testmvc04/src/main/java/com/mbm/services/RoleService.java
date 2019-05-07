package com.mbm.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mbm.dao.PayDao;
import com.mbm.domian.Role;
import com.mbm.domian.User;

@Service("roleService")
public class RoleService implements UserDetailsService {
	@Autowired
	PayDao paydao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("*********"+username);	
		User user = paydao.findroleByUsername(username);
		System.out.println("--------"+user.getUsername());
		System.out.println("00000000123");
		if(user==null)throw new UsernameNotFoundException("找不到该账户信息！");
		System.out.println("0123");
		List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
		getRoles(user,list);
		org.springframework.security.core.userdetails.User auth_user = new
			org.springframework.security.core.userdetails.User(user.getUsername(),user.getPassword(),list);
		System.out.println("**"+user.getPassword());
			return auth_user;
		
		
	}
	
	public void getRoles(User user,List<GrantedAuthority> list) {
		System.out.println("user++"+user.getUsername());
		System.out.println("Role++"+user.getRoleid().getRole());
		Role role = paydao.findroleByUsername(user.getUsername()).getRoleid();
		System.out.println("role++"+role.getRole());
		String r = role.getRole();
		System.out.println("***"+r);
		list.add(new SimpleGrantedAuthority("ROLE_"+r));
	}
	
	public Role findroleByID(Integer id) {
		return paydao.findroleByID(id);
	}
	
	public User findUser(int id) {
		return paydao.findUser(id);
	}
	
	public User findroleByUsername(String username) {
		return paydao.findroleByUsername(username);
	}
	
	public Boolean findUserByUsername(String username) {
		if(paydao.findroleByUsername(username)!=null) {
			return true;
		}else {
			return false;
		}
		
	}

}
