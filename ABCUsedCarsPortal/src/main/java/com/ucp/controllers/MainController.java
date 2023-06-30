package com.ucp.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.ucp.entity.Car;
import com.ucp.entity.User;
import com.ucp.service.CarService;
import com.ucp.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	CarService carService;
	
	@GetMapping("home")
	public String homePage(Principal principal, Model model) {
	
    	String username = principal.getName();
    	
    	User user_data = userService.findLoginUser(username);
    	List<User> user = new ArrayList<User>(); 
    	user.add(user_data);
    	
    	model.addAttribute("user",user);
    	
    	List<Car> cars = carService.listCars();
    	
    	model.addAttribute("carList", cars);
    	
		return "index";
	}
	
	@GetMapping("about")
    public String openAboutUs() {
        return "about_us";
    }
	
	@GetMapping("contact")
    public String showContactUs() {
    	return "contact_us";
    }
	
	@GetMapping("detail")
	public String carDetail(@RequestParam long cid, Model model) {
		
    	Car car = carService.findCar(cid);
    	System.out.print(car);
    	
    	List<Car> carData = new ArrayList<Car>(); 
    	carData.add(car);
    	model.addAttribute("car", carData);
    	
		return "carDetail";
	}
	
	@GetMapping("profile")
	public String showProfile(Model model, Principal principal) {
		
		String uname = principal.getName();
	
		User subject = userService.findLoginUser(uname);
		String uemail = subject.getEmail();
		
		List<User> user = new ArrayList<User>();
		user.add(subject);
		
		model.addAttribute("user", user);
		
		List<Car> cars = carService.findByEmail(uemail);
    	
    	model.addAttribute("postedCars", cars);
    	
		return "profile";
	}
	
	
	

}
