package com.bookstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.model.Books;
import com.bookstore.model.Customer;
import com.bookstore.repository.BooksRepo;
import com.bookstore.repository.CustomerRepo;

@Controller 
public class HomeController 
{
    @Autowired
    private BooksRepo booksrepo;
    
    @Autowired
    private CustomerRepo customerrepo;
    
    @GetMapping("/")
    public String homepage()
    {
        return "home";
    }
    
    @GetMapping("/customerregister")
    public String customerregisterpage()
    {
        return "register";
    }
    
    @GetMapping("/customerlogin")
    public String customerloginpage()
    {
        return "login";
    }
    
    @GetMapping("/adminlogin")
    public String adminlogin()
    {
        return "admin";
    }
    
    @GetMapping("/loginadmin")
    public String adminpage(@RequestParam String username,@RequestParam String password,Model model)
    {
        List<Books> bdata=booksrepo.findAll();
        List<Customer> cdata=customerrepo.findAll();
        if(username.equals("datta") && password.equals("datta"))
        {
            model.addAttribute("booksdata", bdata);
            model.addAttribute("usersdata", cdata);
            return "admindashboard";
        }
        else
        {
            return "redirect:/adminlogin";
        }
    }
}