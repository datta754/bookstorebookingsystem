package com.bookstore.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Customer 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String fullname;
	
	private String username;
	
	private String email;
	
	private String password;
	
	private String cpassword;

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCpassword() {
		return cpassword;
	}

	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}

	@OneToMany(mappedBy = "customer")
	private List<Booking> bookings;
	
	
	public List<Booking> getBookings() {
	    return bookings;
	}

	public void setBookings(List<Booking> bookings) {
	    this.bookings = bookings;
	}
	
	
}
