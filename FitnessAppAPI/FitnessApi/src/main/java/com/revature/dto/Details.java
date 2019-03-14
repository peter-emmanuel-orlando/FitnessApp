package com.revature.dto;

public class Details {
	private String username;
	private String password;
	private String fullname;
	private String email;
	private boolean privateprofile;
	
	public Details() {
		super();
	}
	
	public Details(String username, String password, String fullname, String email, boolean privateprofile) {
		this.username=username;
		this.password=password;
		this.fullname=fullname;
		this.email=email;
		this.privateprofile=privateprofile;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getFullname() {
		return fullname;
	}

	public String getEmail() {
		return email;
	}

	public boolean isPrivateprofile() {
		return privateprofile;
	}

}
