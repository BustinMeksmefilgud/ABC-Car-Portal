package com.ucp.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.annotation.MultipartConfig;

import com.ucp.controllers.CarController;
import com.ucp.entity.Car;
import com.ucp.entity.User;
import com.ucp.service.CarService;
import com.ucp.service.UserService;


@Controller
public class CarController{
	
	@Autowired
	public CarService carService;
	
	@Autowired
	public UserService userService;
	
	@GetMapping("addCar")
    public String openCarUploader(@ModelAttribute("car") Car car) {
        return "addCar";
    }
	
	@PostMapping("saveCar")
	public String saveCar(@ModelAttribute("car") Car car, Model model,
			@RequestParam("picture") MultipartFile multipartFile, Principal principal) throws IOException {

		

		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
	
		car.setPhoto(fileName);
	
		Car savedCar = carService.saveCar(car);
	
		String uploadDir = "./src/main/resources/static/images/car-pics/" + savedCar.getId();
	
			Path uploadPath = Paths.get(uploadDir);
			
		if (!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
		
	
				try (InputStream inputStream = multipartFile.getInputStream()) {
				Path filePath = uploadPath.resolve(fileName);
				System.out.println(filePath.toFile().getAbsolutePath());
					Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
				} catch (IOException e) {
					throw new IOException("Could not save uploaded file: " + fileName);
		
				}
	
		car.setPhotoPath("/images/car-pics/" + savedCar.getId() + "/" + savedCar.getPhoto());
	}
//	 Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);

		car.setEmail(user.getEmail());

		carService.saveCar(car);

		model.addAttribute("success_post", "Car has been saved successfully");

		return "redirect:home";
	}
	
	
	@PreAuthorize("hasRole('Admin')")
	@RequestMapping(value="/carList", method=RequestMethod.GET)
	public ModelAndView viewCars(Model model) {
		System.out.println("Do you like, my cars?");
		List<Car> cars = carService.listCars();
		System.out.println(cars);
		
		return new ModelAndView("carList", "listOfCars",cars);
	}
	
	@GetMapping("deleteCar")
	public String destroyCar(@RequestParam long cid) {
		carService.deleteCar(cid);
		
		return "redirect:/home";
	}
	
	@PostMapping("updateCar")
	public String renewCar(@ModelAttribute("car") Car car,
		@RequestParam long cid) {
		
		Car carDetail = carService.findCar(cid);
		carDetail.setModel(car.getModel());
		carDetail.setYear(car.getYear());
		carDetail.setMaker(car.getMaker());
		carDetail.setRegistration(car.getRegistration());
		carDetail.setPrice(car.getPrice());
		carService.saveCar(carDetail);
		
		return "redirect:/carList";
	}
	
	@PostMapping("bid")
	public String bid(@ModelAttribute("car") Car bid, @RequestParam("cid") long cid,
			@RequestParam("highBid") double highBid, Principal principal, Model model) {
		
		String uname = principal.getName();
		
		User bidder = userService.findLoginUser(uname);
		
		Car carForBid = carService.findCar(cid);
		
		double carHighBid = carForBid.getHighestBid();
		double carPrice = carForBid.getPrice();
		
		if (highBid > carHighBid && highBid >= carPrice ) {
			carForBid.setHighestBid(highBid);
			carForBid.setBidder(bidder.getName());
			
			carService.saveCar(carForBid);
			
			String bidSucc = "Bid Succesful";
	        model.addAttribute("bidSucc", bidSucc);
		} else {
			String bidFail = "Bid must be higher than current highest bid";
	        model.addAttribute("bidFail", bidFail);
		}
		
		
		List<Car> carData = new ArrayList<Car>(); 
    	carData.add(carForBid);
    	model.addAttribute("car", carData);
		return "carDetail";
	}
	
	@GetMapping("adminView")
	public String adminView(@RequestParam long uid, Model model) {
		
		User subject = userService.findUser(uid);
		String uemail = subject.getEmail();
		
		List<User> user = new ArrayList<User>();
		user.add(subject);
		
		model.addAttribute("user", user);
		
		List<Car> cars = carService.searchCar(uemail);
    	
    	model.addAttribute("postedCars", cars);
		
		return "profile";
	}
	
	
	@GetMapping("searchCar")
	public ModelAndView browseCar(@RequestParam String keyword, Model model) {
		
		List<Car> carResult = carService.searchCar(keyword);
		model.addAttribute("searchKey", keyword);
		
		return new ModelAndView ("searchResults", "carList", carResult);
	}
	
}
