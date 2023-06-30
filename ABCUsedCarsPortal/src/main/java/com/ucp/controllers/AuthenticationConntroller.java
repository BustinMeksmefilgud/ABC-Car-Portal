package com.ucp.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ucp.service.UserService;
import com.ucp.entity.User;

@Controller
public class AuthenticationConntroller {

	@Autowired
	UserService userService;
	
	@GetMapping("login")
    public String onLogin() {
        return "login";
    }
	
	  @GetMapping("login_error")
	    public String onLoginError(Model model) {
	        String error_msg = "That ain't right. Try Again.";
	        model.addAttribute("error_string", error_msg);
	        return "login";
	    }
	    
	    @GetMapping("login_success")
	    public String onLoginSuccess(Model model) {
	    	
	    	String success_login = "Welcome to the world of ABC Used Cars.";
	        model.addAttribute("success_login", success_login);
	    	
	    	return "login";
	    }
	    
	    @GetMapping("logout")
	    public String onLogoutSuccess(Model model) {
	    	
	    	String success_logout = "See you next time";
	        model.addAttribute("success_logout", success_logout);
	    	
	    	return "login";
	    }
	
	@GetMapping("register_user")
    public String showRegistrationForm(@ModelAttribute("user") User user) {
    	return "register";
    }
	
	 @PostMapping("register")
	    public String registerNewUser(@ModelAttribute("user") User user, Model model) {
	    	
	    	String response = userService.saveUser(user);
	    	System.out.println(response);
	    	
	    	String success_register = "Registeration Successful! ";
	    	model.addAttribute("success_register", success_register);
	    	
	    	return "login";
	    }
	
	 @PreAuthorize("hasRole('Admin')")
		@RequestMapping(value="/userList", method=RequestMethod.GET)
		public ModelAndView viewUsers(Model model) {
			System.out.println("List out users");
			List<User> users = userService.listUsers();
			System.out.println(users);
			
			return new ModelAndView("userList", "listOfUsers",users);
		}
	 
	 @PostMapping("updateUser")
	 public String changeUser(@RequestParam long uid,
			 @ModelAttribute("user") User user) {
		 
		 
		 User subject = userService.findUser(uid);
		 subject.setName(user.getName());
		 subject.setUserName(user.getUserName());
		 subject.setEmail(user.getEmail());
		 subject.setMobile(user.getMobile());
		 subject.setAddress(user.getAddress());
		 
		 userService.changeUser(subject);
		
		 
		 return "redirect:/profile" ;
	 }
	 
	 @GetMapping("deleteUser")
	 public String removeUser(@RequestParam long uid) {
		 userService.removeUser(uid);
		 
		 
		 
		 return "redirect:/userList";
	 }
	 
	 @PostMapping("roleChange")
	 public String roleTransition(@RequestParam long uid,
			 @RequestParam("role") String role,
			 @ModelAttribute("user") User user) {
		 
		 User userInfo = userService.findUser(uid);
		 
		 userService.roleChange(userInfo, role);
		 
		 return "redirect:userList";
	 }
}
