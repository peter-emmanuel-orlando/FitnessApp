package com.revature.services;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.model.AppUser;
import com.revature.repos.UserRepo;
import com.revature.dto.Credentials;
import com.revature.dto.Details;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepo userRepo;

	@Override
	public AppUser save(AppUser user) {
		return userRepo.save(user);
	}

	@Override
	public AppUser update(Details deets) {
		AppUser user = userRepo.findByUsername(deets.getUsername());
		if(deets.getPassword()!="") {
			user.setPassword(deets.getPassword());
		}
		user.setFullName(deets.getFullname());
		user.setEmail(deets.getEmail());
		user.setPrivate(deets.isPrivateprofile());
		return userRepo.save(user);
	}

	@Override
	public AppUser delete(AppUser user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String username) {
		userRepo.deleteByUsername(username);
	}

	@Override
	public List<AppUser> findAll() {
		// TODO Auto-generated method stub
		return userRepo.findAll();
		
	}

	@Override
	public AppUser findByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepo.findByUsername(username);
	}

	@Override
	public AppUser findById(int id) {
		// TODO Auto-generated method stub
		return userRepo.findById(id);
	}
	
	@Override
	public AppUser login(Credentials creds) {
		AppUser u = userRepo.findByUsername(creds.getUsername());
		if (u==null) {
			return null;
		}else {
			if(u.checkPassword(creds.getPassword())) {
				return u;
			}else {
				return null;
			}
		}
	}
	
	@Override
	public List<AppUser> subscriberRankings(){
		List<AppUser> users = userRepo.findAll();
		List<int[]> sub = new ArrayList<int[]>();
		for(AppUser user:users) {
			int[] I = {user.getId(), user.getSubscribers()};
			sub.add(I);
		}
		sub.sort(Comparator.comparing(a -> a[1]));
		users = new ArrayList<AppUser>();
		for(int x=0; x<6; x++) {
			users.add(userRepo.findById(sub.get(sub.size() - 1)[0]));
			sub.remove(sub.get(sub.size() - 1));
		}
//		do{
//			users.add(userRepo.findById(sub.get(sub.size() - 1)[0]));
//			sub.remove(sub.get(sub.size() - 1));
//		} while(sub.size()!=0);
		return users;
	}

	@Override
	public List<AppUser> search(String searchString) {
		List<AppUser> users = userRepo.findAll();
		List<AppUser> returnUsers = new ArrayList<AppUser>();
		searchString = searchString.trim();
		System.out.println(users.getClass());
		
		for(AppUser user: users) {
			System.out.println(user.getUsername()+" vs "+ searchString+"="+user.getUsername().toLowerCase().contains(searchString.toLowerCase()));
			System.out.println(user.getFullName()+" vs "+ searchString+"="+user.getFullName().toLowerCase().contains(searchString.toLowerCase()));
			System.out.println(user.getUsername().toLowerCase().contains(searchString.toLowerCase()) || user.getFullName().toLowerCase().contains(searchString.toLowerCase()));
			if(
				(
					user.getUsername().toLowerCase().contains(searchString.toLowerCase()) ||
					user.getFullName().toLowerCase().contains(searchString.toLowerCase())
				) && (
					!user.getIsPrivate()
				)
				
			) {
				returnUsers.add(user);
			}else {
				
			}
		}
		
		return returnUsers;
	}
}

