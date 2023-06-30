package com.ktn.service;

import java.util.HashSet;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.ucp.entity.User;
import com.ucp.repository.RoleRepository;
import com.ucp.repository.UserRepository;
import com.ucp.service.UserServiceImpl;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceTest {
	
	@InjectMocks
	UserServiceImpl userService;
	
	@Mock
	RoleRepository roleRepository;
	
	@Mock
	PasswordEncoder passwordEncoder;
	
	@Mock
	UserRepository userRepository;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void registerUserData() {
		User user = new User();
		user.setId((long) 1);
		user.setName("Luigi Mario");
		user.setUserName("luigi");
		user.setEmail("luigi@gmail.com");
		String encodedPassword = passwordEncoder.encode("okiedokie");
		user.setPassword(encodedPassword);
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles("Users")));
		Mockito.when(userRepository.save(user)).thenReturn(user);
		String userResponse = userService.saveUser(user);
		Assert.assertEquals("User saved successfully", userResponse);
	}
	
	
	  @Test
	  public void userDataIsSaved() { 
	 User user = new User(); 
	 String username = "weegee";
	 user.setUserName(username);
	 Mockito.when(userRepository.findByUserName(username)).thenReturn(user);
	 User loginUser = userService.findLoginUser(username);
	 Assert.assertEquals(user,loginUser); }
	 
	
	

}
