package com.bookstore.model;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Books {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bookId;
    private String title;
    private String genre;
    private String author;
    private LocalDate publicationdate;
    private double price;
    private String imagefilename;
	public Books() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Books(int bookId, String title, String genre, String author, LocalDate publicationdate, double price,
			String imagefilename) {
		super();
		this.bookId = bookId;
		this.title = title;
		this.genre = genre;
		this.author = author;
		this.publicationdate = publicationdate;
		this.price = price;
		this.imagefilename = imagefilename;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public LocalDate getPublicationdate() {
		return publicationdate;
	}
	public void setPublicationdate(LocalDate publicationdate) {
		this.publicationdate = publicationdate;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImagefilename() {
		return imagefilename;
	}
	public void setImagefilename(String imagefilename) {
		this.imagefilename = imagefilename;
	}
    
	@OneToMany(mappedBy = "book")
	private List<Booking> bookings;
	
	
	public List<Booking> getBookings() {
	    return bookings;
	}

	public void setBookings(List<Booking> bookings) {
	    this.bookings = bookings;
	}
    
}