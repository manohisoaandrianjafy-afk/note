package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.Client;

public interface ClientRepository extends JpaRepository<Client, Integer> {
}