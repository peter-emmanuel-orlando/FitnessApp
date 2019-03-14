package com.revature.services;

//this is the service layer
import java.util.List;

import com.revature.dto.Credentials;
import com.revature.dto.Details;
import com.revature.model.AppUser;

public interface UserService {

	AppUser save(AppUser user);
	AppUser update(Details deets);
	AppUser delete(AppUser user);
	void delete(String username);
	AppUser login(Credentials creds);
	List<AppUser> search(String searchString);
	List<AppUser> subscriberRankings();
	
	List<AppUser>findAll();
	AppUser findByUsername(String username);
	AppUser findById(int id);
	
}
