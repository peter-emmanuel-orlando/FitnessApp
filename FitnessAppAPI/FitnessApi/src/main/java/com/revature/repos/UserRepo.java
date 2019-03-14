package com.revature.repos;



import java.util.List;

import javax.transaction.Transactional;

//this is the data access object

import org.springframework.data.jpa.repository.JpaRepository;
import com.revature.model.AppUser;

public interface UserRepo extends JpaRepository<AppUser, Integer> {
	AppUser findByUsernameAndPassword(String username, String password);
	AppUser findByUsername(String username);
	AppUser findById(int id);
	@Transactional
	void deleteByUsername(String username);
}
