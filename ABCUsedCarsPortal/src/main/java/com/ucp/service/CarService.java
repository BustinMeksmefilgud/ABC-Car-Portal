package com.ucp.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ucp.entity.Car;
import com.ucp.repository.CarRepository;

@Service
@Transactional
public class CarService {

	@Autowired
	private CarRepository carRepository;
	
	public Car saveCar(Car car) {
		Car savedCar = carRepository.save(car);
		
		return savedCar;
	}
	
	public void deleteCar(long sid) {
		carRepository.deleteById(sid);
	}
	
	public List<Car> listCars() {
		List<Car> cars = carRepository.findAll();
		
		return cars;
	}
	
	public Car findCar(long cid) {
		Car car = carRepository.getById(cid);
		
		return car;
	}
	
	public List<Car> findByEmail(String email){
		
		List<Car> car = carRepository.findByEmail(email);
		
		return car;
	}
	
	public List<Car> searchCar(String keyword){
		
		List<Car> car = carRepository.carSearch(keyword);
	
		return car;
	}

}
