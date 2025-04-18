package com.bookstore.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bookstore.model.Books;
import com.bookstore.repository.BooksRepo;
import com.bookstore.repository.CustomerRepo;

@Controller 
public class BooksController {
    @Autowired
    private BooksRepo booksrepo;
    
    @Autowired
    private CustomerRepo customerrepo;
    
    @Value("${upload.dir}")
    private String uploadDir;
    
    @GetMapping("/addform")
    public String bookaddf() {
        return "bookaddform";
    }
    
    @PostMapping("/savebookinfo")
    public String savebookinfo(@ModelAttribute Books b, 
                             @RequestParam("imagefile") MultipartFile file,
                             Model model) throws IOException {
        
        if (!file.isEmpty()) {
            String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            Path path = Paths.get(uploadDir + filename);
            Files.createDirectories(path.getParent());
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            b.setImagefilename(filename);
        }
        
        booksrepo.save(b);
        model.addAttribute("booksdata", booksrepo.findAll());
        model.addAttribute("usersdata", customerrepo.findAll());
        return "admindashboard";
    }
    
    @GetMapping("/searchbygenre")
    public String genrewise(@RequestParam String genre,Model m)
    {
    	List<Books> genrebd=booksrepo.findByGenre(genre);
    	m.addAttribute("gbd", genrebd);
    	return "typewise";
    } 
    
}