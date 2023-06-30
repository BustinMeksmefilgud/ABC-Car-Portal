package com.ucp.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ucp.entity.Role;
import com.ucp.entity.User;
import com.ucp.repository.RoleRepository;
import com.ucp.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired 
	UserRepository userRepository;
	
	@Autowired
	RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public String saveUser(User user) {
		
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles("Users")));
		
		userRepository.save(user);
		
		return "User saved successfully";
	}

	@Override 
	public String changeUser(User user) {
		userRepository.save(user);
		
		return "User's identity has changed";
	}
	
	@Override
	public User findUser(long uid) {
		User user = userRepository.getById(uid);
		
		return user;
	}
	
	@Override
	public User findLoginUser(String username) {
		
		return userRepository.findByUserName(username);
	}
	
	@Override
    public List<User> listUsers(){
		
		List<User> users = userRepository.findAll();
		
		return users ;
		

	}
	
	@Override
	public String removeUser(long uid) {
	
		userRepository.deleteById(uid);
		
		return "User has been dealt with";
	}
	
	@Override
	public void roleChange(User user, String role) {
		
		user.getRoles().clear();
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles(role)));
		userRepository.save(user);
	
	}
	
	



}
