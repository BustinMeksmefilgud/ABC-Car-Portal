package com.ucp.service;


import java.util.List;

import com.ucp.entity.User;


public interface UserService {

	String saveUser(User user);
	
	String changeUser(User user);
	
	User findUser(long uid);
	
	User findLoginUser(String username);
	
    List<User> listUsers();
    
    String removeUser(long uid);
    
    void roleChange(User user, String role);
	
}
