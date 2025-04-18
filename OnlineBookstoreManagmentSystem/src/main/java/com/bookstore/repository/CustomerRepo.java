package com.bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bookstore.model.Customer;

@Repository
public interface CustomerRepo extends JpaRepository<Customer, Integer>
{
	public abstract Customer findByEmail(String email);
}
