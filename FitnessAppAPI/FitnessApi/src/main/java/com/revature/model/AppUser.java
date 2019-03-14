package com.revature.model;

import java.util.HashSet;
import java.util.Set;
import com.revature.util.MD5;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

@Table(name = "account")
@Entity
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@JsonFilter("depth_4")
public class AppUser {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userid")
	private int id;

	

	@Column(name = "username")
	private String username;

	@JsonProperty(access = Access.WRITE_ONLY)
	@Column(name = "password")
	private String password;

	@JsonProperty(access = Access.WRITE_ONLY)
	@Column(name = "salt")
	private String salt;

	@Column(name = "fullname")
	private String fullName;

	@Column(name= "email")
	private String email;

	@Column(name = "pictureurl")
	private String pictureUrl;

	@Column(name = "privateprofile")
	private boolean isPrivate;
	
	//@Transient
	@ManyToOne
	@JoinColumn(name = "typeid")
	private AccountType accountType;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "accountsubscription", joinColumns = @JoinColumn(name = "subscriberid"), inverseJoinColumns = @JoinColumn(name = "subscribeeid"))
	private Set<AppUser> followedUsers = new HashSet<>();
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "accountsubscription", joinColumns = @JoinColumn(name = "subscribeeid"), inverseJoinColumns = @JoinColumn(name = "subscriberid"))
	private Set<AppUser> followers = new HashSet<>();
	
	public int getSubscribers() {
		return followers.size();
	}
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "exercisesubscription", joinColumns = @JoinColumn(name = "userid"), inverseJoinColumns = @JoinColumn(name = "exerciseid"))
	private Set<Exercise> followedExercises = new HashSet<>();
	
	public AppUser() {
		super();
	}
	
	public void addSubscription(AppUser U) {
		followedUsers.add(U);
	}
	
	public void removeSubscription(AppUser U) {
		followedUsers.remove(U);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String pass) {
		password = MD5.getMD5(pass+salt);
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public boolean getIsPrivate() {
		return isPrivate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((salt == null) ? 0 : salt.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AppUser other = (AppUser) obj;
		if (id != other.id)
			return false;
		if (salt == null) {
			if (other.salt != null)
				return false;
		} else if (!salt.equals(other.salt))
			return false;
		return true;
	}

	public void setIsPrivate(boolean isPrivate) {
		this.isPrivate = isPrivate;
	}

	public AccountType getAccountType() {
		return accountType;
	}

	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}

	public Set<AppUser> getFollowedUsers() {
		return followedUsers;
	}

	public void setFollowedUsers(Set<AppUser> followedUsers) {
		this.followedUsers = followedUsers;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Set<Exercise> getFollowedExercises() {
		return followedExercises;
	}

	public void setFollowedExercises(Set<Exercise> followedExercises) {
		this.followedExercises = followedExercises;
	}

	public void setPrivate(boolean isPrivate) {
		this.isPrivate = isPrivate;
	}

	@Override
	public String toString() {
		return "AppUser [id=" + id + ", username=" + username + ", password=" + password + ", salt=" + salt
				+ ", fullName=" + fullName + ", email=" + email + ", pictureUrl=" + pictureUrl + ", isPrivate="
				+ isPrivate + ", accountType=" + accountType + ", followedUsers=" + followedUsers + "]";
	}

	public boolean checkPassword(String pass) {
		return password.equals(MD5.getMD5(pass+salt));
	}
	
	public AppUser(String username, String password, String fullName, String email) {
		super();
		this.username = username;
		this.salt = MD5.getMD5(username + "goop");
		this.password = MD5.getMD5(password + this.salt);
		System.out.println(this.salt);
		System.out.println(this.password);
		this.fullName = fullName;
		this.email = email;
		
		AccountType defaultType = new AccountType();
		defaultType.setAccountTypeId(2);
		
		this.pictureUrl = "";
		this.isPrivate = false;
		this.accountType = defaultType;
		this.followedUsers = new HashSet<AppUser>();
		this.followedExercises = new HashSet<Exercise>();
	}

	public AppUser(int id, String username, String password, String fullName, String email,
			String pictureUrl, boolean isPrivate, AccountType accountType, Set<AppUser> followedUsers,
			Set<Exercise> followedExercises) {
		super();
		this.id = id;
		this.username = username;
		this.salt = MD5.getMD5(username + "goop");
		this.password = MD5.getMD5(password + this.salt);
		this.fullName = fullName;
		this.email = email;
		this.pictureUrl = pictureUrl;
		this.isPrivate = isPrivate;
		this.accountType = accountType;
		this.followedUsers = followedUsers;
		this.followedExercises = followedExercises;
	}
}