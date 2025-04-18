package com.bookstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bookstore.model.Booking;
import com.bookstore.model.Customer;

@Repository
public interface BookingRepo extends JpaRepository<Booking, Integer> {
    List<Booking> findByCustomer(Customer customer);
}