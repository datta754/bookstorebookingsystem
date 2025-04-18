package com.bookstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bookstore.model.Books;

@Repository
public interface BooksRepo extends JpaRepository<Books, Integer>
{
	public abstract List<Books> findByGenre(String genre);
}
