package com.ktn.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.ucp.entity.Car;
import com.ucp.entity.User;
import com.ucp.repository.CarRepository;
import com.ucp.service.CarService;



@RunWith(MockitoJUnitRunner.class)
public class CarServiceTest {
	
	@InjectMocks
	CarService carService;
	
	@Mock
	CarRepository carRepository;
	
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void testSaveCar() {
		Car car = new Car();
		car.setId((long) 1);
		car.setModel("Magic School Bus");
		car.setYear("2021");
		car.setPrice(33000);
		car.setMaker("Miss Fritz");
		car.setRegistration("2021");
		Mockito.when(carRepository.save(car)).thenReturn(car);
		Car savedCar = carService.saveCar(car);
		Assert.assertEquals(car, savedCar);
		
	}
	
	@Test
	public void testCar() {
		Car car = new Car();
		String search = "Delorean";
		car.setModel(search);
		
		List<Car> searchCar = new ArrayList<Car>();
		searchCar.add(car);
		
		Mockito.when(carRepository.carSearch(search)).thenReturn(searchCar);
		List<Car> searches = carService.searchCar(search);
		Assert.assertEquals(searchCar, searches);
	}
	
	
	@Test
	public void testCarBidding() {
		Car carWithBid = new Car();
		carWithBid.setModel("Lamborghini");
		User user = new User();
		user.setName("John Paul Inso");
		
		carWithBid.setBidder(user.getName());
		carWithBid.setHighestBid(33000);
	
		
		Mockito.when(carRepository.save(carWithBid)).thenReturn(carWithBid);
		Car saveBid = carService.saveCar(carWithBid);
		Assert.assertEquals(carWithBid, saveBid);
		
	}
	
	
	
	

}
