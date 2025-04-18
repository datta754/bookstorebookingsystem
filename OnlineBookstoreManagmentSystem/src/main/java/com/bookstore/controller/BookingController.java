package com.bookstore.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstore.model.Booking;
import com.bookstore.model.Books;
import com.bookstore.model.Customer;
import com.bookstore.repository.BookingRepo;
import com.bookstore.repository.BooksRepo;
import com.bookstore.repository.CustomerRepo;

@Controller
public class BookingController {
    
    @Autowired
    private BookingRepo bookingRepo;
    
    @Autowired
    private BooksRepo booksRepo;
    
    @Autowired
    private CustomerRepo customerRepo;
    
    @GetMapping("/bookingform")
    public String showBookingForm(@RequestParam int bookId,
                                @RequestParam int quantity,
                                @RequestParam String email,
                                Model model) {
        Books book = booksRepo.findById(bookId).orElse(null);
        Customer customer = customerRepo.findByEmail(email);
        
        if(book != null && customer != null) {
            model.addAttribute("book", book);
            model.addAttribute("quantity", quantity);
            model.addAttribute("email", email);
            return "bookingform";
        } else {
            return "redirect:/userdashboard?error=Book or customer not found";
        }
    }
    
    @PostMapping("/booknow")
    public String bookNow(@RequestParam int bookId,
                         @RequestParam int quantity,
                         @RequestParam String email,
                         @RequestParam String fullname,
                         @RequestParam String phone,
                         @RequestParam String address,
                         RedirectAttributes redirectAttributes) {
        
        Books book = booksRepo.findById(bookId).orElse(null);
        Customer customer = customerRepo.findByEmail(email);
        
        if(book != null && customer != null) {
            double totalPrice = book.getPrice() * quantity;
            
            Booking booking = new Booking();
            booking.setBook(book);
            booking.setCustomer(customer);
            booking.setBookingDate(LocalDate.now()); 
            booking.setQuantity(quantity);
            booking.setTotalPrice(totalPrice);
            booking.setFullname(fullname);
            booking.setPhone(phone);
            booking.setAddress(address);
            booking.setStatus("Confirmed");
            
            bookingRepo.save(booking);
            
            redirectAttributes.addFlashAttribute("success", "Booking successful! Thank you for your order.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Booking failed. Please try again.");
        }
        
        return "redirect:/userdashboard?email=" + email;
    }
    
    @GetMapping("/mybookings")
    public String viewMyBookings(@RequestParam String email, Model model) {
        Customer customer = customerRepo.findByEmail(email);
        if(customer != null) {
            List<Booking> bookings = bookingRepo.findByCustomer(customer);
            model.addAttribute("bookings", bookings);
            model.addAttribute("currentUserEmail", email);
        }
        return "mybookings";
    }
    
    @GetMapping("/allbookings")
    public String viewAllBookings(Model model) {
        List<Booking> bookings = bookingRepo.findAll();
        model.addAttribute("allbookings", bookings);
        return "adminbookings";
    }
    
    @PostMapping("/updateStatus")
    public String updateBookingStatus(@RequestParam int bookingId, 
                                    @RequestParam String status,
                                    RedirectAttributes redirectAttributes) {
        Booking booking = bookingRepo.findById(bookingId).orElse(null);
        if(booking != null) {
            booking.setStatus(status);
            bookingRepo.save(booking);
            redirectAttributes.addFlashAttribute("success", "Booking status updated successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Booking not found");
        }
        return "redirect:/allbookings";
    }
}