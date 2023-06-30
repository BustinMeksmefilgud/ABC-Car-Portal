package com.ucp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ucp.entity.User;

public interface UserRepository extends JpaRepository<User, Long>  {
	
	User findByUserName(String userName);
	
}
