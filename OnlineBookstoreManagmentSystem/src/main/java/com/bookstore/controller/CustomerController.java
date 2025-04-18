package com.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstore.model.Customer;
import com.bookstore.repository.BooksRepo;
import com.bookstore.repository.CustomerRepo;

@Controller
public class CustomerController {
    
    @Autowired
    private CustomerRepo customerrepo;
    
    @Autowired
    private BooksRepo booksrepo;
    
    @PostMapping("/registercustomer")
    public String savectminfo(@ModelAttribute Customer c, RedirectAttributes redirectAttributes) {
        customerrepo.save(c);
        redirectAttributes.addFlashAttribute("success", "Registration successful!");
        return "redirect:/home";
    }
    
    @GetMapping("/logincustomer")
    public String userlogin(@RequestParam String email, 
                          @RequestParam String password, 
                          Model model,
                          RedirectAttributes redirectAttributes) {
        Customer co = customerrepo.findByEmail(email);
        if(co != null && co.getPassword().equals(password)) {
            model.addAttribute("booksdata", booksrepo.findAll());
            model.addAttribute("currentUserEmail", email);
            return "userdashboard";
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid email or password");
            return "redirect:/login";
        }
    }
    
    @GetMapping("/userdashboardgenre")
    public String udfromgenre(@RequestParam(required = false) String genre, 
                             @RequestParam String email,
                             Model model) {
        if (genre != null && !genre.isEmpty()) {
            model.addAttribute("booksdata", booksrepo.findByGenre(genre));
        } else {
            model.addAttribute("booksdata", booksrepo.findAll());
        }
        model.addAttribute("currentUserEmail", email);
        return "userdashboard";
    }
    
    @GetMapping("/userdashboard")
    public String userDashboard(@RequestParam(required = false) String email, Model model) {
        if(email != null) {
            model.addAttribute("currentUserEmail", email);
        }
        model.addAttribute("booksdata", booksrepo.findAll());
        return "userdashboard";
    }
}