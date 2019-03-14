package com.revature.dto;

public interface CreateUserProjection {
	String getUsername();
	String getPassword();
	String getFullName();
	String getEmail();
	String getIsPrivate();
}
