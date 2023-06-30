package com.ucp.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ucp.entity.Car;

@Repository
public interface CarRepository extends JpaRepository<Car, Long>{

	List<Car> findByEmail(String email);
	
	@Query(value = "SELECT c FROM Car c WHERE c.model LIKE '%' || :keyword || '%'"
			+ " OR c.year LIKE '%' || :keyword || '%'"
			+ " OR c.maker LIKE '%' || :keyword || '%'"
			+ " OR c.price LIKE '%' || :keyword || '%'")
	public List<Car> carSearch(@Param("keyword") String keyword);
}
