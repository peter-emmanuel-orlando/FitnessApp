package com.revature.controllers;

import com.revature.dto.Credentials;
import com.revature.model.AppUser;
import com.revature.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("auth")
public class AuthController {

    @Autowired
	UserService authService;
	
	@PostMapping
	public ResponseEntity<AppUser> login(@RequestBody Credentials creds) {
		AppUser user = authService.login(creds);
		HttpStatus code = (user != null ? HttpStatus.OK : HttpStatus.UNAUTHORIZED);
		return new ResponseEntity<AppUser>(user, code);
	}
}